//
//  ViewController.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navigationBarOutlet: UINavigationBar!
    @IBOutlet weak var colletctionView: UICollectionView!
    
    // MARK: - Vars
    
    var productsArray = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductsService.shared.delegate = self
        ProductsService.shared.observeProducts()
        // Do any additional setup after loading the view.
        setupNavBar()
        view.backgroundColor = #colorLiteral(red: 0.5882352941, green: 1, blue: 0.3058823529, alpha: 1)
       
    }
    
    private func setupNavBar() {
        navigationBarOutlet.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationBarOutlet.backgroundColor = #colorLiteral(red: 0.5882352941, green: 1, blue: 0.3058823529, alpha: 1)
        
      
    }

    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        AlertService.addProductAlert(in: self) { (product) in
            ProductsService.shared.postProduct(product)
        }
    }
    
    @IBAction func subscribeBtnPressed(_ sender: UIBarButtonItem) {
        AlertService.subscribeAlert(in: self )
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        let product = productsArray[indexPath.row]
        cell.configure(with: product)
        return cell
    }
    
    
}


extension ViewController: ProductsServiceDelegate {
    func didChange(products: [Product]) {
        productsArray = products
        colletctionView.reloadData()
    }
    
    
}
