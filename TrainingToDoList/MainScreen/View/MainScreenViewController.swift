//
//  MainScreenMainScreenViewController.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit
import ViperKit

class MainScreenViewController: BaseViewController, ModuleInputProvider {
    var moduleInput: ModuleInput!

    var output: MainScreenViewOutput!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    let refreshControl = UIRefreshControl()
    
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
            self.output.openTextView()
        })
        
        alertController.addAction(UIAlertAction(title: "Add photo task", style: .default) { _ in
            self.output.openImageView()
        })
        
        alertController.addAction(UIAlertAction(title: "Add date task", style: .default) { _ in
            self.output.openDateView()
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        setupRefreshControl()
        output.setDelegateAndDataSource(tableView: tableView)
    }


    // MARK: MainScreenViewInput
    func setupInitialState() {
    }
}


extension MainScreenViewController: MainScreenViewInput {
    
}
