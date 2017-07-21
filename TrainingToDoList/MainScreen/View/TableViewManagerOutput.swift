//
//  TableViewManagerOutput.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 21.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation

protocol TableViewManagerOutput {
    
    func getCount(ar name: RecordTypes) -> Int
    
    func getTask(inAr ar: RecordTypes, inPos pos: Int) -> Any?
    
    func deleteTask(data: Any)
    
    func openDate(objectForEdit: Date?)
    
    func openImage(objectForEdit: ImageHeader?)
    
    func openText(objectForEdit: HeaderText?)
    
}
