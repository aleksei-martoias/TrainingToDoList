//
//  TextTaskCreationScreenTextTaskCreationScreenInteractor.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

class TextTaskCreationScreenInteractor {

    weak var output: TextTaskCreationScreenInteractorOutput!

    var editOb: HeaderText?
    var dataSource: DataSource!
}


extension TextTaskCreationScreenInteractor: TextTaskCreationScreenInteractorInput {
    func pushOrUpdate(_ data: HeaderText) {
        if editOb != nil {
            editOb?.update(field: data.headerLabel!, data.textLabel!)
        } else {
            dataSource.pushData(push: data.headerLabel!, push: data.textLabel!)
        }
    }

    func giveDataIfExist() -> HeaderText? {
        return editOb
    }
    
    func setObjectForEdit(_ data: HeaderText?) {
        editOb = data
    }
}
