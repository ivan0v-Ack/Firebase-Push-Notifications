//
//  ProductsSnapshot.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import UIKit
import Firebase

struct ProductsSnapshot {
    let products: [Product]
    
    init?(snapshot: DataSnapshot){
        guard let snapDict = snapshot.value as? [String: [String: Any]] else { return nil }
        var products = [Product]()
        for snap in snapDict {
            guard let product = Product(valueDict: snap.value) else { continue }
            products.append(product)
        }
        self.products = products
    }
}

