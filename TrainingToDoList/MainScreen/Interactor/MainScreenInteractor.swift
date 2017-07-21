//
//  MainScreenMainScreenInteractor.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

class MainScreenInteractor {

    weak var output: MainScreenInteractorOutput!
    
    var dataSource: DataSource!

}


extension MainScreenInteractor: MainScreenInteractorInput {
    
    func getCount(ar name: RecordTypes) -> Int {
        switch name {
        case .textType:
            return dataSource.arHeaderText?.count ?? 0
        case .imageType:
            return dataSource.arImageHeader?.count ?? 0
        case .dateType:
            return dataSource.arDate?.count ?? 0
        }
    }
    
    func getTask(inAr ar: RecordTypes, inPos pos: Int) -> Any? {
        switch ar {
        case .textType:
            return dataSource.arHeaderText?[pos]
        case .imageType:
            return dataSource.arImageHeader?[pos]
        case .dateType:
            return dataSource.arDate?[pos]
        }
    }
    
    func deleteTask(data: Any) {
        dataSource.delete(setOb: data)
    }
    
}
