//
//  Picker.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 20.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import UIKit

class Picker: NSObject {
    
    var picker = UIImagePickerController()
    weak var controller: UIViewController?
    
    weak var output: PickerOutput?
    
    func resizePicture(setImage img: UIImage, setScale scale: CGFloat) -> UIImage {
        let newWidth = img.size.width / scale
        let newHeight = img.size.height / scale
        let rect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        img.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func showPicker(_ controller: UIViewController?) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            controller?.present(picker, animated: true, completion: nil)
        }
    }
}

extension Picker: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        output?.success(resizePicture(setImage: image!, setScale: 10))
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension Picker: UINavigationControllerDelegate {}

extension Picker: PickerInput {
    func show(_ controller: UIViewController) {
        showPicker(controller)
    }
    
    func set(output: PickerOutput) {
        self.output = output
    }
}
