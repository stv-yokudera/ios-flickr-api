//
//  PhotoListViewController.swift
//  ios-flickr-api
//
//  Created by OkuderaYuki on 2017/10/15.
//  Copyright © 2017年 OkuderaYuki. All rights reserved.
//

import UIKit
import SVProgressHUD

final class PhotoListViewController: UIViewController {
    
    // MARK: - properties
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    private let photoSearchAPI = PhotoSearchAPI()
    private let provider = PhotoListProvider()
    private var tags = ""
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        collectionView.dataSource = provider
        photoSearchAPI.loadable = self
        searchBar.delegate = self
        
        resetPhotoList()
    }
    
    private func resetSearchBar() {
        searchBar.text = ""
    }
    
    private func resetPhotoList() {
        photoSearchAPI.reset()
        provider.add(photos: [])
        collectionView.reloadData()
    }
}

// MARK: - UISearchBarDelegate
extension PhotoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let tags = searchBar.text else {
            return
        }
        self.tags = tags
        resetPhotoList()
        let loadingMessage = String.localized(key: "PHOTOLIST_LOADING")
        SVProgressHUD.Custom.show(with: loadingMessage)
        photoSearchAPI.load(tags: self.tags)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return PhotoCell.cellSize()
    }
}

// MARK: - UICollectionViewDelegate
extension PhotoListViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard hasMorePhotoList() else {
            return
        }
        nextloadPhotoList()
    }
    
    private func hasMorePhotoList() -> Bool {
        
        if collectionView.isScrollEnd() {
            
            if photoSearchAPI.waiting() {
                return false
            }
            return photoSearchAPI.isMoreRequest()
        }
        return false
    }
    
    private func nextloadPhotoList() {
        let loadingMessage = String.localized(key: "PHOTOLIST_LOADING")
        SVProgressHUD.show(withStatus: loadingMessage)
        photoSearchAPI.incement()
        photoSearchAPI.load(tags: tags)
    }
}

// MARK: - PhotoSearchLoadable
extension PhotoListViewController: PhotoSearchLoadable {
    
    func set(status: PhotoListStatus) {
        
        // .loadingの場合はreturn
        if case .loading = status {
            return
        }
        
        SVProgressHUD.dismiss()
        
        switch status {
        case .normal(let result):
            updatePhotoList(result: result)
        case .noData:
            let noDataMessage = String.localized(key: "PHOTOLIST_NODATA")
            showAlert(message: noDataMessage)
        case .offline:
            let offlineMessage = String.localized(key: "PHOTOLIST_OFFLINE")
            showAlert(message: offlineMessage)
        case .error:
            let errorMessage = String.localized(key: "PHOTOLIST_ERROR")
            showAlert(message: errorMessage)
        default:
            break
        }
    }
    
    private func updatePhotoList(result: PhotoSearchResult?) {
        
        if let pages = result?.photos?.pages,
            let photos = result?.photos {
            photoSearchAPI.updateTotal(total: pages)
            provider.append(photos: photos.photo.map { $0 })
        }
        collectionView.reloadData()
        scrollToTop()
    }
    
    private func scrollToTop() {
        
        // リクエストカウントが1の場合は、一番上までスクロールする
        if photoSearchAPI.current() == 1 {
            collectionView.scrollToTop()
        }
    }
    
    private func showAlert(message: String) {
        showOkAlert(message: message) { _ in
            self.resetSearchBar()
            self.resetPhotoList()
        }
    }
}
