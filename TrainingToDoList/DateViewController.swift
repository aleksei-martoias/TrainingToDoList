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

    @IBOutlet weak var titleField: UITextField!
    
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        if let data = titleField.text {
            creatorDelegate?.addDate(setDate: data)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
