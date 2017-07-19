//
//  Configurator.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 19.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import UIKit
import Dip_UI
import Dip

class Configurator: NSObject {
    @IBOutlet weak var controller: UIViewController! {
        didSet {
            if let controller = controller as? ViewController,
                let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                controller.dataSource = try? appDelegate.container.resolve() as DataSource
            }
        }
    }
}
