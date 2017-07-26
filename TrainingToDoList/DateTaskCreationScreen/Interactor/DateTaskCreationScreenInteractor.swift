//
//  DateTaskCreationScreenDateTaskCreationScreenInteractor.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

class DateTaskCreationScreenInteractor {

    weak var output: DateTaskCreationScreenInteractorOutput!
    
    var editOb: Date?
    var dataSource: DataSource!
    var networkLayer: NetworkLayerInputInput!
}

extension DateTaskCreationScreenInteractor: DateTaskCreationScreenInteractorInput{
    func pushOrUpdate(_ data: Date) {
        if editOb != nil {
            editOb?.update(field: data.dateLabel!)
        } else {
            networkLayer.post(task: data, success: { (_ id: Int) in
                self.dataSource.pushData(push: data.dateLabel!, id: id)
                self.output.reloadTableR()
                self.output.popController()
            }, error: {(error: Error) -> Void in
                self.output.showAlert()
            })
        }
    }
    
    func giveDataIfExist() -> Date? {
        return editOb
    }
    
    func setObjectForEdit(_ date: Date?) {
        editOb = date
    }
}
