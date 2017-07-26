//
//  MainScreenMainScreenRouter.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import ViperKit

class MainScreenRouter: MainScreenRouterInput {
    var transitionHandler: TransitionHandler!
    
    func openDateTaskScreen(objectForEdit: Date?, presenter: MainScreenPresenter) {
        transitionHandler.openModule(segueIdentifier: "DateSegue") { (moduleInput) in
            guard let moduleInput = moduleInput as? DateTaskCreationScreenModuleInput else {
                fatalError("Wrong type")
            }
            moduleInput.setObjectForEdit(objectForEdit)
            moduleInput.setParentPresenter(presenter)
        }
    }
    
    func openImageTaskScreen(objectForEdit: ImageHeader?, presenter: MainScreenPresenter) {
        transitionHandler.openModule(segueIdentifier: "ImageHeaderShow") { (moduleInput) in
            guard let moduleInput = moduleInput as? ImageTaskCreationScreenModuleInput else {
                fatalError("Wrong type")
            }
            moduleInput.setObjectForEdit(objectForEdit)
            moduleInput.setParentPresenter(presenter)
        }
    }
    
    func openTextTaskScreen(objectForEdit: HeaderText?, presenter: MainScreenPresenter) {
        transitionHandler.openModule(segueIdentifier: "HeaderTextShow") { (moduleInput) in
            guard let moduleInput = moduleInput as? TextTaskCreationScreenModuleInput else {
                fatalError("Wrong type")
            }
            moduleInput.setObjectForEdit(objectForEdit)
            moduleInput.setParentPresenter(presenter)
        }
    }
    
}
