//
//  SearchResultsCollectionViewCell.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 26.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import UIKit

class SearchResultsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        imageView.image = nil
    }
}
