//
//  TypesForRealm.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 18.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Realm
import RealmSwift

class HeaderText: Object {
    dynamic var headerLabel: String?
    dynamic var textLabel: String?
    dynamic var id: String?
    
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
    
    override static func primaryKey() -> String? {
        return "id"
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

class Date: Object {
    dynamic var dateLabel: String?
    dynamic var id: String?
    
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
}
