//
//  DateTaskCreationScreenDateTaskCreationScreenInitializer.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class DateTaskCreationScreenModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var datetaskcreationscreenViewController: DateTaskCreationScreenViewController!

    override func awakeFromNib() {

        let configurator = DateTaskCreationScreenModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: datetaskcreationscreenViewController)
    }

}
