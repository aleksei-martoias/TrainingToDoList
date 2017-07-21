//
//  TextTaskCreationScreenTextTaskCreationScreenInteractorInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation

protocol TextTaskCreationScreenInteractorInput {
    
    func pushOrUpdate(_ data: HeaderText)
    
    func giveDataIfExist() -> HeaderText?

    func setObjectForEdit(_ data: HeaderText?)
}
