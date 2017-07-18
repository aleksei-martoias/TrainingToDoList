//
//  DateViewController.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 13.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    var creatorDelegate: CreatorDelegete?
    
    var editOb: Date?
    
    @IBOutlet weak var toolBarUI: UIToolbar!

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var datePickerUI: UIDatePicker!
    
    @IBAction func datePickChange(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy | HH:mm"
        
        let strDate = dateFormatter.string(from: datePickerUI.date)
        titleField.text = strDate
    }
    
    @IBAction func doneButtonTB(_ sender: UIBarButtonItem) {
        datePickerUI.resignFirstResponder()
        titleField.resignFirstResponder()
    }
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        if let data = titleField.text {
            if var editingOb = editOb {
                editingOb.dateLabel = data
                creatorDelegate?.updateData(set: editingOb)
            } else {
                creatorDelegate?.addDate(setDate: data)
            }
            navigationController?.popViewController(animated: true)
        } else {
            print("### No date!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeKeyboard()
        datePickerUI.locale = NSLocale(localeIdentifier: "fr_SN") as Locale
        
        if let setDate = editOb {
            titleField.text = setDate.dateLabel
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy | HH:mm"
            datePickerUI.setDate(dateFormatter.date(from: titleField.text!)!, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeKeyboard() {
        titleField.inputView = datePickerUI
        titleField.inputAccessoryView = toolBarUI
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
