//
//  TextTaskCreationScreenTextTaskCreationScreenViewController.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import ViperKit

class TextTaskCreationScreenViewController: BaseViewController, TextTaskCreationScreenViewInput, ModuleInputProvider {

    var moduleInput: ModuleInput!
    var output: TextTaskCreationScreenViewOutput!
    
    @IBOutlet weak var headerTitle: UITextField!
    @IBOutlet var gesture: UITapGestureRecognizer!
    @IBOutlet weak var textUI: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let headerText = headerTitle.text,
            let text = textUI.text {
            output.createEntityAndPush(headerText, text)
        }
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        headerTitle.resignFirstResponder()
        textUI.resignFirstResponder()
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        if let setData = output.setDataIfExist() {
            headerTitle.text = setData.headerLabel
            textUI.text = setData.textLabel
        }
    }


    // MARK: TextTaskCreationScreenViewInput
    func setupInitialState() {
    }
}
