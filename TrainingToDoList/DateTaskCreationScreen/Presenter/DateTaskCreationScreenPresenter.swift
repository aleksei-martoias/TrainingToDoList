//
//  DateTaskCreationScreenDateTaskCreationScreenPresenter.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import ViperKit

class DateTaskCreationScreenPresenter: DateTaskCreationScreenModuleInput {

    weak var view: DateTaskCreationScreenViewInput!
    var interactor: DateTaskCreationScreenInteractorInput!
    var router: DateTaskCreationScreenRouterInput!
    
    
    func viewIsReady() {

    }
    
    func setObjectForEdit(_ date: Date?) {
        interactor.setObjectForEdit(date)
    }
}

extension DateTaskCreationScreenPresenter: DateTaskCreationScreenViewOutput {
    func setDataIfExist() -> Date? {
        return interactor.giveDataIfExist()
    }
    
//    func pushOrUpdate(_ data: Date) {
//        interactor.pushOrUpdate(data)
//    }
    func createEntityAndPush(_ date: String) {
        let pushingData = Date()
        pushingData.dateLabel = date
        interactor.pushOrUpdate(pushingData)
    }
}

extension DateTaskCreationScreenPresenter: DateTaskCreationScreenInteractorOutput {
    
    func popController() {
        view.popController()
    }
    
    func showAlert() {
        view.showAlert()
    }
    
}


