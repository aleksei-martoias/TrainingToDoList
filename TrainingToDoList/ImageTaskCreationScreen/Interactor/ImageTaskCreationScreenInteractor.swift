//
//  ImageTaskCreationScreenImageTaskCreationScreenInteractor.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import UIKit

class ImageTaskCreationScreenInteractor {

    weak var output: ImageTaskCreationScreenInteractorOutput!
    var picker: PickerInput?
    var networkLayer: NetworkLayerInputInput!
    
    var dataSource: DataSource!
    var editOb: ImageHeader?
    func addToRealm() {
        
    }
}


extension ImageTaskCreationScreenInteractor: ImageTaskCreationScreenInteractorInput {
    func pushOrUpdate(_ data: ImageHeader) {
        if editOb != nil {
            editOb?.update(field: data.headerLabel!, data.image!)
        } else {
            networkLayer.post(task: data, success: { (_) in
                self.dataSource.pushData(push: data.headerLabel!, push: data.image!)
                self.output.popController()
            }, error: {(error: Error) -> Void in
                self.output.showAlert()
            })
        }
    }
    
    func giveDataIfExist() -> ImageHeader? {
        return editOb
    }
    
    func show(_ controller: UIViewController) {
        picker?.show(controller)
    }
    
    func setObjectForEdit(_ data: ImageHeader?) {
        editOb = data
    }
    
}

extension ImageTaskCreationScreenInteractor: PickerOutput {
    func success(_ img :UIImage) {
        output.setImage(img)
    }
    
    func fail(_ error: Error) {
        
    }
}
