//
//  ProductCell.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with product: Product){
   
        
        titleLabel.text = product.title
        priceLabel.text = product.price()
    }
    
}
