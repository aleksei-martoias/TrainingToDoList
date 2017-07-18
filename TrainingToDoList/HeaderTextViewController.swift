//
//  HeaderTextViewController.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 13.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class HeaderTextViewController: UIViewController {
    var creatorDelegate: CreatorDelegete?
    var editOb: HeaderText?
    
    @IBOutlet weak var headerTitle: UITextField!
    
    @IBOutlet var gesture: UITapGestureRecognizer!
    @IBOutlet weak var textUI: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let headerText = headerTitle.text,
            let text = textUI.text {
            if editOb != nil {
                editOb?.update(field: headerText, text)
                creatorDelegate?.tableViewReload()
            } else {
                creatorDelegate?.addHeaderText(setHeader: headerText, setText: text)
            }
            }
        
        navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addGestureRecognizer(gesture)
        
        if editOb != nil {
            headerTitle.text = editOb?.headerLabel
            textUI.text = editOb?.textLabel
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        headerTitle.resignFirstResponder()
        textUI.resignFirstResponder()
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
