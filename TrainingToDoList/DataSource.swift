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
    
    func generate() -> String {
        return NSUUID().uuidString
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
    
    func pushData(push header: String, push text: String) {
        arHeaderText?.append(HeaderText(set: header, set: text, setId: generate()))
    }
    
    func pushData(push header: String, push img: UIImage) {
        arImageHeader?.append(ImageHeader(set: header, set: img, setId: generate()))
    }
    
    func pushData(push date: String) {
        arDate?.append(Date(set: date, setId: generate()))
    }
    
    //Update
    
    func updateData(setData data: Any) {
        if let ht = data as? HeaderText,
            let index = arHeaderText?.index(of: ht) {
            arHeaderText?[index] = ht
        } else if let ih = data as? ImageHeader,
            let index = arImageHeader?.index(of: ih) {
            arImageHeader?[index] = ih
        } else if let d = data as? Date,
            let index = arDate?.index(of: d) {
            arDate?[index] = d
        }
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
    
//    func delete(ar name: String, at element: Int) {
//        switch name {
//        case "ArHeaderText":
//            arHeaderText?.remove(at: element)
//        case "ArImageHeader":
//            arImageHeader?.remove(at: element)
//        case "ArDate":
//            arDate?.remove(at: element)
//        default:
//            return
//        }
//    }
    
    func delete(setOb obForDel: Any) {
        if let ht = obForDel as? HeaderText,
            let index = arHeaderText?.index(of: ht) {
            arHeaderText?.remove(at: index)
        } else if let ih = obForDel as? ImageHeader,
            let index = arImageHeader?.index(of: ih) {
            arImageHeader?.remove(at: index)
        } else if let d = obForDel as? Date,
            let index = arDate?.index(of: d) {
            arDate?.remove(at: index)
        }
    }
    
    deinit {
        saveToDefault()
        NotificationCenter.default.removeObserver(self)
    }
}
