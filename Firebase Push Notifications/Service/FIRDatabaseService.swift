//
//  FIRDatabaseService.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import Foundation
import Firebase


enum FIRDatabaseReference: String {
    case products = "products"
}


class FIRDatabaseService {
    
    private init () {}
    
    static let shared = FIRDatabaseService()
    
    func reference(_ databaseReference: FIRDatabaseReference) -> DatabaseReference {
        return Database.database().reference().child(databaseReference.rawValue)
    }
    
    func observe(_ databaseRef: FIRDatabaseReference, completion: @escaping (DataSnapshot) -> Void){
        reference(databaseRef).observe(.value) { (snapshot) in
            DispatchQueue.main.async {
                completion(snapshot)
            }
        }
    }
    
    func post(parameters: [String: Any], to databaseRef: FIRDatabaseReference){
        reference(databaseRef).childByAutoId().setValue(parameters)
    }
    
}
