//
//  RealmManager.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/17/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    public static let shared = RealmManager()
    
    override private init() {
        //
    }
    
    func getObjects(type: Object.Type) -> Results<Object>? {
        do {
            let realm = try Realm()
            return realm.objects(type)
        } catch let error as NSError {
            print(error.description)
        }
        return nil
    }
    
    func addObject(obj: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(obj)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
//    func addObjects(objs: [Object]) {
//        do {
//            let realm = try Realm()
//            try realm.write {
//                realm.add(objs)
//            }
//        } catch let error as NSError {
//            print(error.description)
//        }
//    }
    
    func editObject(obj: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(obj, update: true)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func editObjects(objs: [Object]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(objs, update: true)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func deleteObject(obj: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(obj)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func deleteObjects(objs: [Object]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(objs)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func deleteDatabase() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func incrementID(type: Object.Type) -> Int {
        do {
            let realm = try Realm()
            return (realm.objects(type).max(ofProperty: "id") as Int? ?? 0) + 1
        } catch let error as NSError {
            print(error.description)
        }
        return 0
    }
}
