//
//  DateTaskCreationScreenDateTaskCreationScreenViewOutput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

protocol DateTaskCreationScreenViewOutput {
    
    func setDataIfExist() -> Date?
    
    func createEntityAndPush(_ date: String)

    func viewIsReady()
}
