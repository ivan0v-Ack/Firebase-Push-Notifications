//
//  Product.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import Foundation


struct Product {
    let title: String
    let cost: Double
    
    init(title: String, cost: Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String: Any]){
        guard let title = valueDict["title"] as? String,
              let cost = valueDict["cost"] as? Double
        else { return nil }
        self.title = title
        self.cost = cost
        
    }
    
    func price() -> String {
        return "$" + String(format: "%.2f", cost)
        
    }
    
    func parameters() -> [String: Any]{
        let dict: [String: Any] = [
            "title":title,
            "cost": cost
        ]
        return dict
    }
}
