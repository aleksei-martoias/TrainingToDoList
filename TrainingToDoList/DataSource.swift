//
//  DataSorceR.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 18.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import UIKit

protocol DataSource {
    var arHeaderText: [HeaderText]? {get set}
    
    var arImageHeader: [ImageHeader]? {get set}
    
    var arDate: [Date]? {get set}
    
    func clean()
    
    func pushData(push header: String, push text: String)
    
    func pushData(push header: String, push img: UIImage)
    
    func pushData(push date: String)
    
    func updateData(setData data: Any)
    
    func delete(setOb obForDel: Any)
}

class DataSourceImplementation: DataSource {

    init(repositoryService: RepositoryService) {
        self.repositoryService = repositoryService
    }
    let repositoryService: RepositoryService!
    var arHeaderText: [HeaderText]? {
        get {
            guard let inputData = repositoryService.get(type: HeaderText.self) else { return nil }
            return inputData
        }
        set(newElem) {
            repositoryService.save(object: newElem!)
        }
    }
    var arImageHeader: [ImageHeader]? {
        get {
            guard let inputData = repositoryService.get(type: ImageHeader.self) else { return nil }
            return inputData
        }
        set(newElem) {
            repositoryService.save(object: newElem!)
        }
    }
    var arDate: [Date]? {
        get {
            guard let inputData = repositoryService.get(type: Date.self) else { return nil }
            return inputData
        }
        set(newElem) {
            repositoryService.save(object: newElem!)
        }
    }
    
    func clean() {
        repositoryService.clean()
    }
    
    func generate() -> String {
        return NSUUID().uuidString
    }
    
    func convertImageToData(convert img: UIImage) -> Data {
        return UIImagePNGRepresentation(img)!
    }
    
    func convertDataToImage(convert dataI: Data) -> UIImage {
        return UIImage(data: dataI, scale:1.0)!
    }
    
    //Push
    func pushData(push header: String, push text: String) {
        let pushingHT = HeaderText()
        pushingHT.headerLabel = header
        pushingHT.textLabel = text
        pushingHT.id = generate()
        arHeaderText = [pushingHT]
    }

    func pushData(push header: String, push img: UIImage) {
        let pushingIH = ImageHeader()
        pushingIH.headerLabel = header
        pushingIH.image = convertImageToData(convert: img)
        pushingIH.id = generate()
        arImageHeader = [pushingIH]
    }

    func pushData(push date: String) {
        let pushingDT = Date()
        pushingDT.dateLabel = date
        pushingDT.id = generate()
        arDate = [pushingDT]
    }
    
    //Update
    func updateData(setData data: Any) {
        if let headerText = data as? HeaderText {
            repositoryService.save(object: headerText)
        } else if let imageHeader = data as? ImageHeader {
            repositoryService.save(object: imageHeader)
        } else if let date = data as? Date {
            repositoryService.save(object: date)
        }
    }
    
    //Delete
    func delete(setOb obForDel: Any) {
        if let headerText = obForDel as? HeaderText {
            repositoryService.remove(object: headerText)
        } else if let imageHeader = obForDel as? ImageHeader {
            repositoryService.remove(object: imageHeader)
        } else if let date = obForDel as? Date {
            repositoryService.remove(object: date)
        }
    }
}
