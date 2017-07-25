//
//  ImageTaskCreationScreenImageTaskCreationScreenViewController.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import ViperKit

class ImageTaskCreationScreenViewController: BaseViewController, ModuleInputProvider {

    var moduleInput: ModuleInput!
    var output: ImageTaskCreationScreenViewOutput!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        if let headerText = titleField.text,
            let img = imageView.image {
            output.createEntityAndPush(headerText, img)
        }
    }
    @IBAction func selectPhotoAction(_ sender: UIButton) {
        output.showPicker(self)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        if let setData = output.setDataIfExist() {
            titleField.text = setData.headerLabel
            imageView.image = UIImage(data: (setData.image)!, scale:1.0)!
        }
    }


    // MARK: ImageTaskCreationScreenViewInput
    func setupInitialState() {
    }
    
}

extension ImageTaskCreationScreenViewController: ImageTaskCreationScreenViewInput {
    func setImageInView(_ img: UIImage) {
        imageView.image = img
    }
    
    func popController() {
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Can not upload the data", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        present(alertController, animated: true)
    }
}
