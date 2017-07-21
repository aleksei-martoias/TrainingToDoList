//
//  TextTaskCreationScreenTextTaskCreationScreenInitializer.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class TextTaskCreationScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var texttaskcreationscreenViewController: TextTaskCreationScreenViewController!

    override func awakeFromNib() {

        let configurator = TextTaskCreationScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: texttaskcreationscreenViewController)
    }

}
