//
//  TypesForRealm.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 18.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Realm
import RealmSwift
import Alamofire
import ObjectMapper
import ObjectMapper_Realm

class HeaderText: Object, Mappable {
    dynamic var headerLabel: String?
    dynamic var textLabel: String?
    dynamic var id: String?
    
    required convenience init?(map: Map) {
        self.init()
        headerLabel = try? map.value("headerLabel")
        textLabel = try? map.value("textLabel")
        id = try? map.value("id")
    }
    
    func update(field header: String, _ text: String) {
        do {
            let realm = try Realm()
            try realm.write {
                headerLabel = header
                textLabel = text
            }
        } catch {
            print("### error changing object in Realm")
        }
    }
    
    func mapping(map: Map) {
        headerLabel <- map["headerLabel"]
        textLabel <- map["textLabel"]
        id <- (map["id"], IntTransform())
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

extension HeaderText: NetworkLayerInput {
    func getParams() -> Parameters {
        let parameters: Parameters = [
            "headerLabel" : headerLabel ?? "",
            "textLabel": textLabel ?? "",
            "entity": "HeaderText"
        ]
        
        return parameters
    }
}

class ImageHeader: Object {
    dynamic var headerLabel: String?
    dynamic var image: Data?
    dynamic var id: String?
    
    func update(field header: String, _ img: Data) {
        do {
            let realm = try Realm()
            try realm.write {
                headerLabel = header
                image = img
            }
        } catch {
            print("### error changing object in Realm")
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension ImageHeader: NetworkLayerInput {
    func getParams() -> Parameters {
        let parameters: Parameters = [
            "headerLabel" : headerLabel ?? "",
            "entity": "ImageHeader"
        ]
        
        return parameters
    }
}

class Date: Object, Mappable {
    dynamic var dateLabel: String?
    dynamic var id: String?
    
    required convenience init?(map: Map) {
        self.init()
        dateLabel = try? map.value("dateLabel")
        id = try? map.value("id")
    }
    
    func update(field date: String) {
        do {
            let realm = try Realm()
            try realm.write {
                dateLabel = date
            }
        } catch {
            print("### error changing object in Realm")
        }
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        dateLabel <- map["dateLabel"]
        id <- (map["id"], IntTransform())
    }
    
}

extension Date: NetworkLayerInput {
    func getParams() -> Parameters {
        let parameters: Parameters = [
            "dateLabel" : dateLabel ?? "",
            "entity": "Date"
        ]
        
        return parameters
    }
}

class IntTransform: TransformType {
    public typealias Object = String
    public typealias JSON = Int
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> String? {
        if let timeInt = value as? Int {
            return "\(timeInt)"
        }
        
        if let timeStr = value as? String {
            return timeStr
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: String?) -> Int? {
        if let date = Int(value ?? "") {
            return date
        }
        return nil
    }
}
