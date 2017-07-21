//
//  MainScreenMainScreenInitializer.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class MainScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mainscreenViewController: MainScreenViewController!

    override func awakeFromNib() {

        let configurator = MainScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainscreenViewController)
    }

}
