//
//  UNService.swift
//  Firebase Push Notifications
//
//  Created by Ivan Ivanov on 4/28/21.
//

import UIKit
import UserNotifications

class UNService: NSObject {
    
    private override init () {}
    
    static let shared = UNService()
    
    let unCenter = UNUserNotificationCenter.current()
    func authorize(){
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        unCenter.requestAuthorization(options: options) { (garanted, error) in
            print(error ?? "No UN auth error")
            guard garanted else {return}
            DispatchQueue.main.async {
                self.configure()
            }
        }
   }
    
    func configure() {
        unCenter.delegate = self
        
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
    
}

extension UNService: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let options: UNNotificationPresentationOptions = [.alert, .sound]
        completionHandler(options)
    }
}
