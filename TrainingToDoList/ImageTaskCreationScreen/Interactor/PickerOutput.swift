//
//  PickerOutput.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 20.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import UIKit

protocol PickerOutput: class {
    func success(_ img :UIImage)
    
    func fail(_ error: Error)
}
