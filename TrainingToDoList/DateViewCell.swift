//
//  DateViewCell.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 12.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class DateViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*func setTask(_ dateF: String) {
        date.text = dateF
    }*/
    
//    func setTask(set element: Int, setDataSource dataSource: DataSource) {
//        if dataSource.arDate != nil && (dataSource.arDate?.count)! > element {
//            date.text = dataSource.arDate?[element].dateLabel
//        }
//    }
    
    func setTask(dateText: String) {
        date.text = dateText
    }
}
