//
//  MainScreenMainScreenRouterInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation

protocol MainScreenRouterInput {
    func openDateTaskScreen(objectForEdit: Date?, presenter: MainScreenPresenter)
    
    func openImageTaskScreen(objectForEdit: ImageHeader?, presenter: MainScreenPresenter)
    
    func openTextTaskScreen(objectForEdit: HeaderText?, presenter: MainScreenPresenter)
    
}
