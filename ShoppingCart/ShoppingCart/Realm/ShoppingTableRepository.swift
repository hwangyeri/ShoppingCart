//
//  ShoppingTableRepository.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/09.
//

import Foundation
import RealmSwift

protocol ShoppingTableRepositoryType: AnyObject {
    func fetch() -> Results<ShoppingTable>
    func duplicateFilterItems(forProductID productID: String) -> Results<ShoppingTable>
    func createItem(_ item: ShoppingTable)
    func deleteItem(_ item: ShoppingTable)
}

class ShoppingTableRepository: ShoppingTableRepositoryType {
    
    private let realm = try! Realm()
   
    func checkSchemaVersion() {
        do {
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
    }
    
    // MARK: - Reaml Create
    
    func createItem(_ item: ShoppingTable) {
        do {
            try realm.write {
                realm.add(item)
                print("Realm Add Succeed")
            }
        } catch {
            print(error)
        }
    }
    
    // MARK: - Realm Read
    
    // likeDate 기준으로 최근 등록순으로 정렬
    func fetch() -> Results<ShoppingTable> {
        let data = realm.objects(ShoppingTable.self).sorted(byKeyPath: "likeDate", ascending: false)
        return data
    }
    
    // productID 기준으로 중복 검사
    func duplicateFilterItems(forProductID productID: String) -> Results<ShoppingTable> {
        let results = realm.objects(ShoppingTable.self).filter("productID == %@", productID)
        return results
    }
    
    // title 기준으로 대소문자 구분없이 검색
    func searchItems(forTitle title: String) -> Results<ShoppingTable> {
        let results = realm.objects(ShoppingTable.self).filter("title CONTAINS[c] %@", title)
        return results
    }
    
    // MARK: - Reaml Delete
    
    func deleteItem(_ item: ShoppingTable) {
        do {
            try realm.write {
                realm.delete(item)
                print("Realm Delete Succeed")
            }
        } catch {
            print(error)
        }
    }
    
    
}

