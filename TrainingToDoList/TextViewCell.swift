//
//  TextViewCell.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 12.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {

    @IBOutlet weak var headerOfTask: UILabel!
    
    @IBOutlet weak var textOfTask: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func setTask(set element: Int, setDataSource dataSource: DataSource) {
//        if dataSource.arHeaderText != nil && (dataSource.arHeaderText?.count)! > element {
//            headerOfTask.text = dataSource.arHeaderText?[element].headerLabel
//            textOfTask.text = dataSource.arHeaderText?[element].textLabel
//        }
//    }
    
    func setTask(headerText: String, discription: String) {
        headerOfTask.text = headerText
        textOfTask.text = discription
    }
}
