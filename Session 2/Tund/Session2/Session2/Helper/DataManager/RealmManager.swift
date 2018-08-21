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
    static let shared = RealmManager()
    override private init() {
        // unable init
    }

    func getObjects<Element: Object>(type: Element.Type) -> Results<Element>? {
        do {
            let realm = try Realm()
            return realm.objects(type).sorted(byKeyPath: "id")
        } catch let error as NSError {
            print(error.description)
        }
        return nil
    }
    func addObject(obj: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                if let staff = obj as? Staff {
                    staff.id = incrementID(type: Staff.self)
                    realm.add(staff)
                }
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func addObjects(objs: [Object]) {
        for item in objs {
            addObject(obj: item)
        }
    }
    
    func updateObject(obj: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(obj, update: true)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    func updateObjects(objs: [Object]) {
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
