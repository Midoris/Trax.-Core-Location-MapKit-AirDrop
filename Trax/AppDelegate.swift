//
//  AppDelegate.swift
//  Trax
//
//  Created by тигренок  on 11/28/15.
//  Copyright (c) 2015 Midori.s. All rights reserved.
//

import UIKit
import CoreData

struct GPXURL {
    static let Notification = "GPXURL Radio Station"
    static let Key = "GPXURL URL Key"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        // post a notification when a GPX file arrives
        let center = NSNotificationCenter()
        let notification = NSNotification(name: GPXURL.Notification, object: self, userInfo: [GPXURL.Key: url])
        center.postNotification(notification)
        return true
    }


    
}

