//
//  CollectionViewManager.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 26.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class CollectionViewManager: NSObject {
    var output: CollectionViewManagerOutput!
}

extension CollectionViewManager: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0//searchResults!.searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! SearchResultsCollectionViewCell
        
        if let flickrPhoto = searchResults?.searchResults[indexPath.item] {
            cell.flickrPhoto = flickrPhoto
            
            cell.heartToggleHandler = { isStarred in
                self.collectionView.reloadItems(at: [ indexPath ])
            }
            
            flickrPhoto.loadThumbnail { image, error in
                if cell.flickrPhoto == flickrPhoto {
                    if flickrPhoto.isFavourite {
                        cell.imageView.image = image
                    } else {
                        if let filteredImage = image?.applyTonalFilter() {
                            cell.imageView.image = filteredImage
                        }
                    }
                }
            }
        }
        
        return cell
    }
}

extension CollectionViewManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 3 images across
        //let width = view.bounds.width / 3
        
        // each image has a ratio of 4:3
        //let height = (width / 4) * 3
        //return CGSize(width: width, height: height)
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension CollectionViewManager: CollectionViewManagerInput {
    func setDelegateAndDataSource(_ collection: UICollectionView) {
        collection.dataSource = self
        collection.delegate = self
    }
}
