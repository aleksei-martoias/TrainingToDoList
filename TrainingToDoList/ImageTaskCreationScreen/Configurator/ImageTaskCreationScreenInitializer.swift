//
//  ImageTaskCreationScreenImageTaskCreationScreenInitializer.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class ImageTaskCreationScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var imagetaskcreationscreenViewController: ImageTaskCreationScreenViewController!

    override func awakeFromNib() {

        let configurator = ImageTaskCreationScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: imagetaskcreationscreenViewController)
    }

}
