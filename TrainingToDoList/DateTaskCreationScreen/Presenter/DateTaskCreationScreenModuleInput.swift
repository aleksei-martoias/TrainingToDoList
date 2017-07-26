//
//  DateTaskCreationScreenDateTaskCreationScreenModuleInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import ViperKit

protocol DateTaskCreationScreenModuleInput: class, ModuleInput {
    func setObjectForEdit(_ date: Date?)
    func setParentPresenter(_ presenter: MainScreenPresenter)
}
