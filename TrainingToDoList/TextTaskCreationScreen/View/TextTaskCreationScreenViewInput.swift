//
//  TextTaskCreationScreenTextTaskCreationScreenViewInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

protocol TextTaskCreationScreenViewInput: class {

    func popController()
    
    func showAlert()

    func setupInitialState()
}
