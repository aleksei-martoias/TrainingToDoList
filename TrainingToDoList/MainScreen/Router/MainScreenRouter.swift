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
    
    func openDateTaskScreen(objectForEdit: Date?) {
        transitionHandler.openModule(segueIdentifier: "DateSegue") { (moduleInput) in
            guard let moduleInput = moduleInput as? DateTaskCreationScreenModuleInput else {
                fatalError("Wrong type")
            }
            moduleInput.setObjectForEdit(objectForEdit)
        }
    }
    
    func openImageTaskScreen(objectForEdit: ImageHeader?) {
        transitionHandler.openModule(segueIdentifier: "ImageHeaderShow") { (moduleInput) in
            guard let moduleInput = moduleInput as? ImageTaskCreationScreenModuleInput else {
                fatalError("Wrong type")
            }
            moduleInput.setObjectForEdit(objectForEdit)
        }
    }
    
    func openTextTaskScreen(objectForEdit: HeaderText?) {
        transitionHandler.openModule(segueIdentifier: "HeaderTextShow") { (moduleInput) in
            guard let moduleInput = moduleInput as? TextTaskCreationScreenModuleInput else {
                fatalError("Wrong type")
            }
            moduleInput.setObjectForEdit(objectForEdit)
        }
    }
    
}
