//
//  RealmManager.swift
//  Session2
//
//  Created by admin on 8/20/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    public static let shared = RealmManager()
    override init() {
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
    func deleteDabase() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
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
}
