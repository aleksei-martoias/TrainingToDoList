//
//  DateTaskCreationScreenDateTaskCreationScreenInteractorInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation

protocol DateTaskCreationScreenInteractorInput {
    
    func pushOrUpdate(_ data: Date)
    
    func giveDataIfExist() -> Date?
    
    func setObjectForEdit(_ date: Date?)
    
}
