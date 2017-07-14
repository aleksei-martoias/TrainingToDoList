//
//  DataSource.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 13.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit
import Foundation

class DataSource {
    let defaults = UserDefaults.standard
    var arHeaderText: [HeaderText]?
    var arImageHeader: [ImageHeader]?
    var arDate: [Date]?
    var nextHeaderText = 0
    var nextImageHeader = 0
    var nextDate = 0
    
    init() {
//        clean()
        loadFromDefaults()
        subscribeForNotifications()
    }
    
    func clean() {
        defaults.removeObject(forKey: "ArHeaderText")
        defaults.removeObject(forKey: "ArImageHeader")
        defaults.removeObject(forKey: "ArDate")
    }
    
    @objc func loadFromDefaults() {
        
        if let inputData = defaults.object(forKey: "ArHeaderText") as? [Data] {
            arHeaderText = inputData.map { HeaderText(data: $0)! }
        }
        if arHeaderText == nil {
            arHeaderText = [HeaderText]()
        }
        
        if let inputData = defaults.object(forKey: "ArImageHeader") as? [Data] {
            arImageHeader = inputData.map { ImageHeader(data: $0)! }
        }
        if arImageHeader == nil {
            arImageHeader = [ImageHeader]()
        }
        
        if let inputData = defaults.object(forKey: "ArDate") as? [Data] {
            arDate = inputData.map { Date(data: $0)! }
        }
        if arDate == nil {
            arDate = [Date]()
        }
    }
    
    func subscribeForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(saveToDefault), name: NSNotification.Name(rawValue: "NEED_TO_SAVE_DATA"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadFromDefaults), name: NSNotification.Name(rawValue: "NEED_TO_LOAD_DATA"), object: nil)
    }
    
    //Push
    
//    func pushData(push header: String, push text: String) {
//        var ar: [HeaderText]?
//        
//        if let inputData = defaults.object(forKey: "ArHeaderText") as? [Data] {
//            ar = inputData.map { HeaderText(data: $0)! }
//        }
//        if ar == nil {
//            ar = [HeaderText(set: header, set: text)]
//        } else {
//            ar?.append(HeaderText(set: header, set: text))
//        }
//        
//        arHeaderText = ar
//        
//        guard let unwrappedAr = ar else { return }
//        let encoded = unwrappedAr.map { $0.encode() }
//        defaults.set(encoded, forKey: "ArHeaderText")
//        defaults.synchronize()
//    }
//    
//    func pushData(push header: String, push img: UIImage) {
//        var ar: [ImageHeader]?
//        
//        if let inputData = defaults.object(forKey: "ArImageHeader") as? [Data] {
//            ar = inputData.map { ImageHeader(data: $0)! }
//        }
//        if ar == nil {
//            ar = [ImageHeader(set: header, set: img)]
//        } else {
//            ar?.append(ImageHeader(set: header, set: img))
//        }
//        
//        arImageHeader = ar
//        
//        guard let unwrappedAr = ar else { return }
//        let encoded = unwrappedAr.map { $0.encode() }
//        defaults.set(encoded, forKey: "ArImageHeader")
//        defaults.synchronize()
//    }
//    
//    func pushData(push date: String) {
//        var ar: [Date]?
//        
//        if let inputData = defaults.object(forKey: "ArDate") as? [Data] {
//            ar = inputData.map { Date(data: $0)! }
//        }
//        if ar == nil {
//            ar = [Date(set: date)]
//        } else {
//            ar?.append(Date(set: date))
//        }
//        
//        arDate = ar
//        
//        guard let unwrappedAr = ar else { return }
//        let encoded = unwrappedAr.map { $0.encode() }
//        defaults.set(encoded, forKey: "ArDate")
//        defaults.synchronize()
//    }
    
    func pushData(push header: String, push text: String) {
        arHeaderText?.append(HeaderText(set: header, set: text))
    }
    
    func pushData(push header: String, push img: UIImage) {
        arImageHeader?.append(ImageHeader(set: header, set: img))
    }
    
    func pushData(push date: String) {
        arDate?.append(Date(set: date))
    }
    
    //Save
    
    @objc func saveToDefault() {
        if let unwrappedAr = arHeaderText {
            let encoded = unwrappedAr.map { $0.encode() }
            defaults.set(encoded, forKey: "ArHeaderText")
        }
        
        if let unwrappedAr = arImageHeader {
            let encoded = unwrappedAr.map { $0.encode() }
            defaults.set(encoded, forKey: "ArImageHeader")
        }
        
        if let unwrappedAr = arDate {
            let encoded = unwrappedAr.map { $0.encode() }
            defaults.set(encoded, forKey: "ArDate")
        }
        
        defaults.synchronize()
    }
    
    //Delete
    
    func delete(ar name: String, at element: Int) {
        switch name {
        case "ArHeaderText":
            arHeaderText?.remove(at: element)
        case "ArImageHeader":
            arImageHeader?.remove(at: element)
        case "ArDate":
            arDate?.remove(at: element)
        default:
            return
        }
    }
    
    deinit {
        saveToDefault()
        NotificationCenter.default.removeObserver(self)
    }
}
