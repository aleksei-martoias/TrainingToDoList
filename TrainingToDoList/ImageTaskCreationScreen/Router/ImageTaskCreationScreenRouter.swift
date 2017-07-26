//
//  ImageTaskCreationScreenImageTaskCreationScreenRouter.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import ViperKit

class ImageTaskCreationScreenRouter: ImageTaskCreationScreenRouterInput {
    
    var transitionHandler: TransitionHandler!

    func openPhotoSearchScreen() {
        transitionHandler.openModule(segueIdentifier: "PhotoSearchShow") { (moduleInput) in
            guard let moduleInput = moduleInput as? FlickerModuleInput else {
                fatalError("Wrong type")
            }
        }
    }
}
