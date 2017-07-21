//
//  PickerInput.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 20.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import UIKit

protocol PickerInput {
    func show(_ controller: UIViewController)
    
    func set(output: PickerOutput)
}
