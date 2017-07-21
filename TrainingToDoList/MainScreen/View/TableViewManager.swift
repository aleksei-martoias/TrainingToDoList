//
//  TableViewManager.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 21.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class TableViewManager: NSObject, UITableViewDataSource {
    
    var output: TableViewManagerOutput!
    var tableViewFromViewController: UITableView?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return RecordTypes.allValues.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case RecordTypes.textType.hashValue:
            return output.getCount(ar: RecordTypes.textType)
        case RecordTypes.imageType.hashValue:
            return output.getCount(ar: RecordTypes.imageType)
        case RecordTypes.dateType.hashValue:
            return output.getCount(ar: RecordTypes.dateType)
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        switch indexPath.section {
        case RecordTypes.textType.hashValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell", for: indexPath)
            if let cell = cell as? TextViewCell,
                let setTask = output.getTask(inAr: RecordTypes.textType, inPos: indexPath.row) as? HeaderText {
                cell.setTask(headerText: setTask.headerLabel!, discription: setTask.textLabel!)
            }
        case RecordTypes.imageType.hashValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "PhotoViewCell", for: indexPath)
            if let cell = cell as? PhotoViewCell ,
                let setTask = output.getTask(inAr: RecordTypes.imageType, inPos: indexPath.row) as? ImageHeader {
                cell.setTask(headerText: setTask.headerLabel!, image: setTask.image!)
            }
            break
        case RecordTypes.dateType.hashValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "DateViewCell", for: indexPath)
            if let cell = cell as? DateViewCell ,
                let setTask = output.getTask(inAr: RecordTypes.dateType, inPos: indexPath.row) as? Date {
                cell.setTask(dateText: setTask.dateLabel!)
            }
        default:
            return UITableViewCell()
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Edit Action
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (IndexPath) -> Void in
            switch indexPath.section {
            case RecordTypes.textType.hashValue:
                self.output.openText(objectForEdit: self.output.getTask(inAr: RecordTypes.textType, inPos: indexPath.row) as? HeaderText)
                break
            case RecordTypes.imageType.hashValue:
                self.output.openImage(objectForEdit: self.output.getTask(inAr: RecordTypes.imageType, inPos: indexPath.row) as? ImageHeader)
            case RecordTypes.dateType.hashValue:
                self.output.openDate(objectForEdit: self.output.getTask(inAr: RecordTypes.dateType, inPos: indexPath.row) as? Date)
            default:
                break
            }
        }
        
        // Delete Action
        let deleteAction = UITableViewRowAction(style: .default, title: "delete") { (IndexPath) -> Void in
            switch indexPath.section {
            case RecordTypes.textType.hashValue:
                if let headerText = self.output.getTask(inAr: RecordTypes.textType, inPos: indexPath.row) {
                    self.output.deleteTask(data: headerText)
                }
            case RecordTypes.imageType.hashValue:
                if let imageHeader = self.output.getTask(inAr: RecordTypes.imageType, inPos: indexPath.row) {
                    self.output.deleteTask(data: imageHeader)
                }
            case RecordTypes.dateType.hashValue:
                if let date = self.output.getTask(inAr: RecordTypes.dateType, inPos: indexPath.row) {
                    self.output.deleteTask(data: date)
                }
            default:
                return
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        
        return [deleteAction, editAction]
    }
}


extension TableViewManager: TableViewManagerInput {
    func setDelegateAndDataSource(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewFromViewController = tableView
    }
    
}
