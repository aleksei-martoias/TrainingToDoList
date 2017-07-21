//
//  ImageTaskCreationScreenImageTaskCreationScreenInteractorInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation
import UIKit

protocol ImageTaskCreationScreenInteractorInput {
    
    func pushOrUpdate(_ data: ImageHeader)
    
    func giveDataIfExist() -> ImageHeader?
    
    func show(_ controller: UIViewController)
    
    func setObjectForEdit(_ data: ImageHeader?)
}
