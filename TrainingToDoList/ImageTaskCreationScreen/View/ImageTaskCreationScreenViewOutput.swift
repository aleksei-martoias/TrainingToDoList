//
//  ImageTaskCreationScreenImageTaskCreationScreenViewOutput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import UIKit

protocol ImageTaskCreationScreenViewOutput {

    func setDataIfExist() -> ImageHeader?
    
    func createEntityAndPush(_ headerText: String, _ img: UIImage)

    func showPicker(_ controller: UIViewController)
    
    func showPhotoSearch()
    
    func viewIsReady()
}
