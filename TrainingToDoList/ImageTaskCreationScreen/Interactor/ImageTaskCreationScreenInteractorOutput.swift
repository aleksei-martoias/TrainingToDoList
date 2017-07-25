//
//  ImageTaskCreationScreenImageTaskCreationScreenInteractorOutput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation
import UIKit

protocol ImageTaskCreationScreenInteractorOutput: class {
    
    func popController()
    
    func setImage(_ img: UIImage)
    
    func showAlert()
    
}
