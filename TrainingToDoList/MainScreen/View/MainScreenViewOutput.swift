//
//  MainScreenMainScreenViewOutput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//
import UIKit

protocol MainScreenViewOutput {

    func setDelegateAndDataSource(tableView: UITableView)

    func viewIsReady()
    
    func openDateView()
    
    func openImageView()
    
    func openTextView()
    
    func sync()
    
}
