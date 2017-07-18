//
//  Types.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 13.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

//import UIKit
//import Foundation
//import Realm
//import RealmSwift
//
//struct HeaderText {
//    var headerLabel: String
//    var textLabel: String
//    var id: String?
//    init(set header: String, set text: String, setId sid: String) {
//        headerLabel = header
//        textLabel = text
//        id = sid
//    }
//    
//}
//
//extension HeaderText {
//    init?(data: Data) {
//        if let coding = NSKeyedUnarchiver.unarchiveObject(with: data) as? Encoding {
//            headerLabel = coding.headerLabel as String
//            textLabel = coding.textLabel as String
//        } else {
//            return nil
//        }
//    }
//    
//    func encode() -> Data {
//        return NSKeyedArchiver.archivedData(withRootObject: Encoding(self))
//    }
//    
//    private class Encoding: NSObject, NSCoding {
//        let headerLabel : NSString
//        let textLabel : NSString
//        
//        init(_ foo: HeaderText) {
//            headerLabel = foo.headerLabel as NSString
//            textLabel = foo.textLabel as NSString
//        }
//        
//        @objc required init?(coder aDecoder: NSCoder) {
//            if let headerLabel = aDecoder.decodeObject(forKey: "headerLabel") as? NSString,
//                let textLabel = aDecoder.decodeObject(forKey: "textLabel") as? NSString {
//                self.headerLabel = headerLabel
//                self.textLabel = textLabel
//            } else {
//                return nil
//            }
//        }
//        
//        @objc func encode(with aCoder: NSCoder) {
//            aCoder.encode(headerLabel, forKey: "headerLabel")
//            aCoder.encode(textLabel, forKey: "textLabel")
//        }
//        
//    }
//}
//
//extension HeaderText: Equatable {
//    public static func ==(lhs: HeaderText, rhs: HeaderText) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
//
//struct ImageHeader {
//    var headerLabel: String
//    var image: UIImage
//    var id: String?
//    init(set header: String, set img: UIImage, setId sid: String) {
//        headerLabel = header
//        image = img
//        id = sid
//    }
//}
//
//extension ImageHeader {
//    init?(data: Data) {
//        if let coding = NSKeyedUnarchiver.unarchiveObject(with: data) as? Encoding {
//            headerLabel = coding.headerLabel as String
//            image = coding.image as UIImage
//        } else {
//            return nil
//        }
//    }
//    
//    func encode() -> Data {
//        return NSKeyedArchiver.archivedData(withRootObject: Encoding(self))
//    }
//    
//    private class Encoding: NSObject, NSCoding {
//        let headerLabel : NSString
//        let image : UIImage
//        
//        init(_ foo: ImageHeader) {
//            headerLabel = foo.headerLabel as NSString
//            image = foo.image as UIImage
//        }
//        
//        @objc required init?(coder aDecoder: NSCoder) {
//            if let headerLabel = aDecoder.decodeObject(forKey: "headerLabel") as? NSString,
//                let image = aDecoder.decodeObject(forKey: "imageLabel") as? UIImage {
//                self.headerLabel = headerLabel
//                self.image = image
//            } else {
//                return nil
//            }
//        }
//        
//        @objc func encode(with aCoder: NSCoder) {
//            aCoder.encode(headerLabel, forKey: "headerLabel")
//            aCoder.encode(image, forKey: "imageLabel")
//        }
//        
//    }
//}
//
//extension ImageHeader: Equatable {
//    public static func ==(lhs: ImageHeader, rhs: ImageHeader) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
//
//struct Date {
//    var dateLabel: String
//    var id: String?
//    init(set date: String, setId sid: String) {
//        dateLabel = date
//        id = sid
//    }
//}
//
//extension Date {
//    init?(data: Data) {
//        if let coding = NSKeyedUnarchiver.unarchiveObject(with: data) as? Encoding {
//            dateLabel = coding.dateLabel as String
//        } else {
//            return nil
//        }
//    }
//    
//    func encode() -> Data {
//        return NSKeyedArchiver.archivedData(withRootObject: Encoding(self))
//    }
//    
//    private class Encoding: NSObject, NSCoding {
//        let dateLabel : NSString
//        
//        init(_ foo: Date) {
//            dateLabel = foo.dateLabel as NSString
//        }
//        
//        @objc required init?(coder aDecoder: NSCoder) {
//            if let dateLabel = aDecoder.decodeObject(forKey: "dateLabel") as? NSString {
//                self.dateLabel = dateLabel
//            } else {
//                return nil
//            }
//        }
//        
//        @objc func encode(with aCoder: NSCoder) {
//            aCoder.encode(dateLabel, forKey: "dateLabel")
//        }
//        
//    }
//}
//
//extension Date: Equatable {
//    public static func ==(lhs: Date, rhs: Date) -> Bool {
//        return lhs.id == rhs.id
//    }
//}
