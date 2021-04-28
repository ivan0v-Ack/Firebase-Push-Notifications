//
//  AlertService.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import UIKit


class AlertService {
    
    private init() {}
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping(Product)-> Void){
        
        let alert = UIAlertController(title: "New Product", message: "What's for sale", preferredStyle: .alert)
        
        alert.addTextField { (titleTF) in
            titleTF.placeholder = "Title"
        }
        
        alert.addTextField { (priceTF) in
            priceTF.placeholder = "Price"
            priceTF.keyboardType = .numberPad
        }
        let send = UIAlertAction(title: "Send", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text, let price = alert.textFields?.last?.text, let cost = Double(price) else { return }
            let product = Product(title: title, cost: cost)
            completion(product)
        }
        
        alert.addAction(send)
        vc.present(alert, animated: true)
        
        
    }
    
    static func subscribeAlert(in vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let subscrite = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            FIRMessagingService.shared.subscribe(to: .newProducts)
        }
        
        let unSubscribe = UIAlertAction(title: "UnSubscribe", style: .default) { (_) in
            FIRMessagingService.shared.unSubscribe(from: .newProducts)
        }
        alert.addAction(subscrite)
        alert.addAction(unSubscribe)
        vc.present(alert, animated: true)
    }
    
}
