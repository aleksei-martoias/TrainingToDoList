//
//  RepositoryService.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 18.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

protocol RepositoryService {
    func save<T: Object>(object: T)
    
    func save<T: Object>(object: [T])
    
    func get<T: Object>(type: T.Type) -> [T]?
    
    func get<T: Object>(type: T.Type, predicate: NSPredicate) -> T?
    
    func remove<T: Object>(object: T)
    
    func remove<T: Object>(object: [T])
    
    func clean()
}

class RepositoryServiceImplementation: RepositoryService {
    func save<T: Object>(object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                if T.primaryKey() != nil {
                    realm.add(object, update: true)
                } else {
                    realm.add(object)
                }
            }
        } catch {
            print("### error saving object to Realm")
        }
    }

    func save<T: Object>(object: [T]) {
        do {
            let realm = try Realm()
            try realm.write {
                if T.primaryKey() != nil {
                    realm.add(object, update: true)
                } else {
                    realm.add(object)
                }
            }
        } catch {
            print("### error saving object to Realm")
        }
    }
    
    func get<T: Object>(type: T.Type) -> [T]? {
        do {
            let realm = try Realm()
            let result = realm.objects(type)
            var resultArray = [T]()
            result.forEach({ (object) in
                resultArray.append(object)
            })
            return resultArray
        } catch {
            print("### error getting object from Realm")
            return nil
        }
    }
    
    func get<T: Object>(type: T.Type, predicate: NSPredicate) -> T? {
        do {
            let realm = try Realm()
            let result = realm.objects(type)
            let filtered = result.filter(predicate)
            if filtered.count == 0 {
                return nil
            } else {
                return filtered[0]
            }
        } catch {
            print("### error getting object from Realm")
            return nil
        }
    }
    
    func remove<T: Object>(object: T) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("### error removing object from Realm")
        }
    }

    func remove<T: Object>(object: [T]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("### error removing object from Realm")
        }
    }
    
    func clean() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("### error removing all objects from Realm")
        }
    }

}
