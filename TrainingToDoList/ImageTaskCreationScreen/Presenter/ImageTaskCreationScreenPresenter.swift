//
//  ImageTaskCreationScreenImageTaskCreationScreenPresenter.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import UIKit
import ViperKit

class ImageTaskCreationScreenPresenter: ImageTaskCreationScreenModuleInput, ModuleInput {

    weak var view: ImageTaskCreationScreenViewInput!
    var interactor: ImageTaskCreationScreenInteractorInput!
    var router: ImageTaskCreationScreenRouterInput!
    var parentPresenter: ImageTaskCreationScreenModuleOutput?

    func viewIsReady() {

    }
    
    func setObjectForEdit(_ data: ImageHeader?) {
        interactor.setObjectForEdit(data)
    }
    
    func setParentPresenter(_ presenter: MainScreenPresenter) {
        parentPresenter = presenter
    }
}

extension ImageTaskCreationScreenPresenter: ImageTaskCreationScreenViewOutput {
    
    func setDataIfExist() -> ImageHeader? {
        return interactor.giveDataIfExist()
    }
    
    func createEntityAndPush(_ headerText: String, _ img: UIImage) {
        let pushingData = ImageHeader()
        pushingData.headerLabel = headerText
        pushingData.image = UIImagePNGRepresentation(img)!
        
        interactor.pushOrUpdate(pushingData)
    }
    
    func showPhotoSearch() {
        router.openPhotoSearchScreen()
    }
    
    func showPicker(_ controller: UIViewController) {
        interactor.show(controller)
    }
}

extension ImageTaskCreationScreenPresenter: ImageTaskCreationScreenInteractorOutput {
    func setImage(_ img: UIImage) {
        view.setImageInView(img)
    }
    
    func popController() {
        view.popController()
    }
    
    func showAlert() {
        view.showAlert()
    }
    
    func reloadTableR() {
        parentPresenter?.reloadTableR()
    }
    
}
