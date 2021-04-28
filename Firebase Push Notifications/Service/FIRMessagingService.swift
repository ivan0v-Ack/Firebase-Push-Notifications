//
//  FIRMessagingService.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import Foundation
import FirebaseMessaging

enum SubscriptionTopic: String {
    case newProducts = "newProducts"
   
}

class FIRMessagingService {
    private init () {}
    
    static let shared = FIRMessagingService()
    let messaging = Messaging.messaging()
    
    func subscribe(to topic: SubscriptionTopic) {
        messaging.subscribe(toTopic: topic.rawValue)
    }
    
    func unSubscribe(from topic: SubscriptionTopic) {
        messaging.unsubscribe(fromTopic: topic.rawValue)
    }
}
