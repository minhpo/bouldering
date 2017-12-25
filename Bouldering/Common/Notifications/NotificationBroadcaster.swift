//
//  NotificationBroadcaster.swift
//  Bouldering
//
//  Created by Po Sam on 25/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import Foundation
import UserNotifications

protocol NotificationBroadcaster {
    var isEnabled: Bool { get }
    
    func enable(completion: (() -> Void)?, failure: (() -> Void)?)
    func broadcast(title: String, body: String, after delay: TimeInterval)
}

class LocalNotificationBroadcaster: NotificationBroadcaster {
    
    var isEnabled: Bool = false
    
    func enable(completion: (() -> Void)?, failure: (() -> Void)?) {
        let options: UNAuthorizationOptions = [.alert, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, _ in
            self.isEnabled = granted
            
            if self.isEnabled {
                completion?()
            } else {
                failure?()
            }
        }
    }
    
    func broadcast(title: String, body: String, after delay: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delay, repeats: false)
        
        let identifier = "\(Date().timeIntervalSince1970)"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { _ in })
    }
}
