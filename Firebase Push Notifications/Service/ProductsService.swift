//
//  ProductsService.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import Foundation


protocol ProductsServiceDelegate {
    func didChange(products: [Product])
}

class ProductsService {
    private init () {}
    static let shared = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    func observeProducts(){
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            
            guard let productSnapshot = ProductsSnapshot(snapshot: snapshot) else { return }
            self.delegate?.didChange(products: productSnapshot.products)
        }
    }
    func postProduct(_ product: Product) {
        
        
        FIRDatabaseService.shared.post(parameters: product.parameters(), to: .products)
    }
}
