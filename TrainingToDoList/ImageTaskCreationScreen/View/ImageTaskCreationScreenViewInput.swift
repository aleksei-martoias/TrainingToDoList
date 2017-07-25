//
//  ImageTaskCreationScreenImageTaskCreationScreenViewInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import UIKit

protocol ImageTaskCreationScreenViewInput: class {

    func setImageInView(_ img: UIImage)

    func setupInitialState()
    
    func popController()
    
    func showAlert()
    
}
