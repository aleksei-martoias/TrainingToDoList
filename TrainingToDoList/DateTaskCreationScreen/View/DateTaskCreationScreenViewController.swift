//
//  DateTaskCreationScreenDateTaskCreationScreenViewController.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import ViperKit

class DateTaskCreationScreenViewController: BaseViewController, DateTaskCreationScreenViewInput, ModuleInputProvider {
    
    var moduleInput: ModuleInput!
    var output: DateTaskCreationScreenViewOutput!

    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func datePickChange(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy | HH:mm"
        
        let strDate = dateFormatter.string(from: datePicker.date)
        titleField.text = strDate
    }
    
    @IBAction func doneButtonToolBar(_ sender: UIBarButtonItem) {
        datePicker.resignFirstResponder()
        titleField.resignFirstResponder()
    }
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        if let data = titleField.text {
            output.createEntityAndPush(data)
            navigationController?.popViewController(animated: true)
        }
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        changeKeyboard()
        datePicker.locale = NSLocale(localeIdentifier: "fr_SN") as Locale
        if let setDate = output.setDataIfExist() {
            titleField.text = setDate.dateLabel
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy | HH:mm"
            datePicker.setDate(dateFormatter.date(from: titleField.text!)!, animated: true)
        }
    }

    func changeKeyboard() {
        titleField.inputView = datePicker
        titleField.inputAccessoryView = toolBar
    }

    // MARK: DateTaskCreationScreenViewInput
    func setupInitialState() {
    }
}