//
//  TextTaskCreationScreenTextTaskCreationScreenPresenter.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import ViperKit

class TextTaskCreationScreenPresenter: TextTaskCreationScreenModuleInput, TextTaskCreationScreenInteractorOutput {

    weak var view: TextTaskCreationScreenViewInput!
    var interactor: TextTaskCreationScreenInteractorInput!
    var router: TextTaskCreationScreenRouterInput!

    func viewIsReady() {

    }
    
    func setObjectForEdit(_ data: HeaderText?) {
        interactor.setObjectForEdit(data)
    }
}


extension TextTaskCreationScreenPresenter: TextTaskCreationScreenViewOutput {
    func setDataIfExist() -> HeaderText? {
        return interactor.giveDataIfExist()
    }
    
    func createEntityAndPush(_ headerText: String, _ text: String) {
        let pushingData = HeaderText()
        pushingData.headerLabel = headerText
        pushingData.textLabel = text
        interactor.pushOrUpdate(pushingData)
    }
}
