//
//  ViewController.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 12.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    let refreshControl = UIRefreshControl()
    let dataSource = DataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        setupRefreshControl()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(referesh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func referesh() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @IBAction func touchNewTask(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Select task type", message: "Text, photo or date", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Add text task", style: .default) { _ in
            self.performSegue(withIdentifier: "HeaderTextShow", sender: nil)
        })
        
        alertController.addAction(UIAlertAction(title: "Add photo task", style: .default) { _ in
            self.performSegue(withIdentifier: "ImageHeaderShow", sender: nil)
        })
        
        alertController.addAction(UIAlertAction(title: "Add date task", style: .default) { _ in
            self.performSegue(withIdentifier: "DateSegue", sender: nil)
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "HeaderTextShow":
            if let targetVC = segue.destination as? HeaderTextViewController {
                targetVC.creatorDelegate = self
                if sender != nil {
                    targetVC.editOb = sender as? HeaderText
                }
            }
        case "ImageHeaderShow":
            if let targetVC = segue.destination as? HeaderImageViewcontroller {
                targetVC.creatorDelegate = self
                if sender != nil {
                    targetVC.editOb = sender as? ImageHeader
                }
            }
        case "DateSegue":
            if let targetVC = segue.destination as? DateViewController {
                targetVC.creatorDelegate = self
                if sender != nil {
                    targetVC.editOb = sender as? Date
                }
            }
        default:
            break
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dataSource.arHeaderText!.count
        case 1:
            return dataSource.arImageHeader!.count
        case 2:
            return dataSource.arDate!.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell", for: indexPath)
            if let cell = cell as? TextViewCell {
                cell.setTask(set: indexPath.row, setDataSource: dataSource)
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "PhotoViewCell", for: indexPath)
            if let cell = cell as? PhotoViewCell {
                cell.setTask(set: indexPath.row, setDataSource: dataSource)
            }
            break
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "DateViewCell", for: indexPath)
            if let cell = cell as? DateViewCell {
                cell.setTask(set: indexPath.row, setDataSource: dataSource)
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
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (IndexPath) -> Void in
            switch indexPath.section {
            case 0:
                self.performSegue(withIdentifier: "HeaderTextShow", sender: self.dataSource.arHeaderText?[indexPath.row])
            case 1:
                self.performSegue(withIdentifier: "ImageHeaderShow", sender: self.dataSource.arImageHeader?[indexPath.row])
            case 2:
                self.performSegue(withIdentifier: "DateSegue", sender: self.dataSource.arDate?[indexPath.row])
            default:
                break
            }
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "delete") { (IndexPath) -> Void in
            switch indexPath.section {
            case 0:
                if let ht = self.dataSource.arHeaderText?[indexPath.row] {
                    self.dataSource.delete(setOb: ht)
                }
            case 1:
                if let ih = self.dataSource.arImageHeader?[indexPath.row] {
                    self.dataSource.delete(setOb: ih)
                }
            case 2:
                if let d = self.dataSource.arDate?[indexPath.row] {
                    self.dataSource.delete(setOb: d)
                }
            default:
                return
            }
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
        }
        
        return [deleteAction, editAction]
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

protocol CreatorDelegete {
    func addHeaderText(setHeader header: String, setText text: String)
    
    func addImageHeader(setHeader header: String, setImage img: UIImage)
    
    func addDate(setDate date: String)
    
    func tableViewReload()
}

extension ViewController: CreatorDelegete{
    func tableViewReload() {
        tableView.reloadData()
    }

    func addHeaderText(setHeader header: String, setText text: String) {
        dataSource.pushData(push: header, push: text)
        tableView.reloadData()
    }
    
    func addImageHeader(setHeader header: String, setImage img: UIImage) {
        dataSource.pushData(push: header, push: img)
        tableView.reloadData()
    }
    
    func addDate(setDate date: String) {
        dataSource.pushData(push: date)
        tableView.reloadData()
    }
}

struct TransferDate {
    
}
