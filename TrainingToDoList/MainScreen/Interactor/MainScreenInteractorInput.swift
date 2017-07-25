//
//  MainScreenMainScreenInteractorInput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import Foundation

protocol MainScreenInteractorInput {
    
    func getCount(ar name: RecordTypes) -> Int
    
    func getTask(inAr ar: RecordTypes, inPos pos: Int) -> Any?
    
    func deleteTask(data: Any)
    
    func sync()
    
    func deleteFromServer(id: Int)
    
}
