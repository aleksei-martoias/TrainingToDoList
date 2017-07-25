//
//  MainScreenMainScreenPresenter.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import UIKit
import ViperKit

class MainScreenPresenter: MainScreenModuleInput, ModuleInput {

    weak var view: MainScreenViewInput!
    var interactor: MainScreenInteractorInput!
    var router: MainScreenRouterInput!
    var tableManager: TableViewManagerInput!

    func viewIsReady() {
        
    }
}


extension MainScreenPresenter: MainScreenInteractorOutput {
    func reloadTable() {
        view.reloadTable()
    }
}

extension MainScreenPresenter: MainScreenViewOutput {
    func setDelegateAndDataSource(tableView: UITableView) {
        tableManager.setDelegateAndDataSource(tableView: tableView)
    }
    
    func openDateView() {
        router.openDateTaskScreen(objectForEdit: nil)
    }
    
    func openImageView() {
        router.openImageTaskScreen(objectForEdit: nil)
    }
    
    func openTextView() {
        router.openTextTaskScreen(objectForEdit: nil)
    }
    
    func sync() {
        interactor.sync()
    }
}
extension MainScreenPresenter: TableViewManagerOutput {
    func openDate(objectForEdit: Date?) {
        router.openDateTaskScreen(objectForEdit: objectForEdit)
    }
    
    func openImage(objectForEdit: ImageHeader?) {
        router.openImageTaskScreen(objectForEdit: objectForEdit)
    }
    
    func openText(objectForEdit: HeaderText?) {
        router.openTextTaskScreen(objectForEdit: objectForEdit)
    }

    
    func getCount(ar name: RecordTypes) -> Int {
        return interactor.getCount(ar: name)
    }
    
    func getTask(inAr ar: RecordTypes, inPos pos: Int) -> Any? {
        return interactor.getTask(inAr: ar, inPos: pos)
    }
    
    func deleteTask(data: Any) {
        interactor.deleteTask(data: data)
    }
    
    func deleteFromServer(id: Int) {
        interactor.deleteFromServer(id: id)
    }
    
}
