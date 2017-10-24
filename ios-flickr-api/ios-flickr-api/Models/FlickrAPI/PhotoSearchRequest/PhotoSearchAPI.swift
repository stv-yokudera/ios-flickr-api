//
//  PhotoSearchAPI.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import Foundation
import ObjectMapper

enum PhotoListStatus {
    case loading
    case normal(PhotoSearchResult)
    case noData
    case offline
    case error
}

protocol PhotoSearchLoadable: class {
    func set(status: PhotoListStatus)
}

final class PhotoSearchAPI {
    
    weak var loadable: PhotoSearchLoadable?
    
    private var isLoading = false
    private var requestCount = 1
    private var totalCount = 1
    
    // MARK: - リクエストカウント管理
    
    func current() -> Int {
        return requestCount
    }
    
    func reset() {
        requestCount = 1
    }
    
    func incement() {
        requestCount += 1
    }
    
    func updateTotal(total: Int) {
        totalCount = total
    }
    
    func isMoreRequest() -> Bool{
        return totalCount > requestCount * PhotoSearchParamsBuilder.perPage
    }
    
    // MARK: - リクエスト可否判定
    
    func waiting() -> Bool {
        return isLoading
    }
    
    // MARK: - リクエスト実行
    
    /// 写真検索
    ///
    /// - Parameter tags: 検索ワード
    func load(tags: String) {
        
        guard APIClient.isReachable() else {
            self.loadable?.set(status: .offline)
            return
        }
        
        isLoading = true
        
        let params = PhotoSearchParamsBuilder.build(tags: tags,
                                                    page: current())
        let router = Router.photosSearchAPI(params)
        APIClient.request(router: router) { [weak self] result in
            
            switch result {
            case .success(let jsonData):
                self?.loadSuccess(response: jsonData)
            case .failure(let error):
                self?.loadFailure(error: error)
            }
            self?.isLoading = false
        }
    }
    
    // MARK: - レスポンス取得時の処理
    
    /// 写真検索成功時の処理
    ///
    /// - Parameter response: APIレスポンスオブジェクト
    func loadSuccess(response: Any) {
        if let searchResult = Mapper<PhotoSearchResult>().map(JSONObject: response) {
            
            // photosがnilの場合: error
            guard let photos = searchResult.photos else {
                loadable?.set(status: .error)
                return
            }
            
            // photosが空の場合: noData, 有件の場合: normal
            let status: PhotoListStatus = photos.photo.isEmpty ? .noData : .normal(searchResult)
            loadable?.set(status: status)
        }
    }
    
    /// 写真検索失敗時の処理
    ///
    /// - Parameter error: エラーオブジェクト
    func loadFailure(error: Error) {
        print("error: \(error)")
        loadable?.set(status: .error)
    }
}
