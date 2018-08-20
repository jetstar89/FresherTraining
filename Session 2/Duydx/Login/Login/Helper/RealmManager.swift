//
//  RealmManager.swift
//  Login
//
//  Created by admin on 8/20/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import RealmSwift
class RealmManager: NSObject {
    public static let shared = RealmManager()
    override private init() {
        //
    }
    func addPerson(_ person: Person) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(person)
            }
        } catch let error as NSError {
            print("\(error)")
        }
    }
    func updatePerson(_ person: Person) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(person, update: true)
            }
        } catch let error as NSError {
            print("\(error)")
        }
    }
    func getAllPerson() -> Results<Person>? {
        var listPerson: Results<Person>?
        do {
            let realm = try Realm()
            try realm.write {
                listPerson = realm.objects(Person.self)
            }
        } catch let error as NSError {
            print("\(error)")
        }
        return listPerson
    }
    func deletePerson(_ person: Person) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(person)
            }
        } catch let error as NSError {
            print("\(error)")
        }
    }
}
