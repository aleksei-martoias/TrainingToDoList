//
//  HeaderImageViewcontroller.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 13.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class HeaderImageViewcontroller: UIViewController {
    var creatorDelegate: CreatorDelegete?
    
    var editOb: ImageHeader?

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        if let headerText = titleField.text,
            let img = imageView.image {
            if var editingOb = editOb {
                editingOb.headerLabel = headerText
                editingOb.image = img
                creatorDelegate?.updateData(set: editingOb)
            } else {
                creatorDelegate?.addImageHeader(setHeader: headerText, setImage: img)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectPhotoAction(_ sender: UIButton) {
        showPicker()
    }
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let setData = editOb {
            titleField.text = setData.headerLabel
            imageView.image = setData.image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    func showPicker() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HeaderImageViewcontroller: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = resizePicture(setImage: image!, setScale: 10)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension HeaderImageViewcontroller: UINavigationControllerDelegate {}
