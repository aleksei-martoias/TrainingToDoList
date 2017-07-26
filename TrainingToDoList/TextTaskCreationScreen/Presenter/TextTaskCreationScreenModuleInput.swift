//
//  TextTaskCreationScreenTextTaskCreationScreenModuleInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import ViperKit

protocol TextTaskCreationScreenModuleInput: class, ModuleInput {
    func setObjectForEdit(_ data: HeaderText?)
    func setParentPresenter(_ presenter: MainScreenPresenter)
}
