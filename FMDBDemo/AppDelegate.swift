//
//  AppDelegate.swift
//  FMDBDemo
//
//  Created by leezb101 on 2018/3/30.
//  Copyright © 2018年 luohe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let created = WeaponDb.createTable()
        if created {
            let ak = ["name": "AKM", "distance": 400, "bullet": 7.62, "price": 500, "rank": 3] as [String : Any]
            let ump = ["name": "ump9", "distance": 200, "bullet": 0.9, "price": 100, "rank": 5] as [String : Any]
            let m16 = ["name": "M16", "distance": 500, "bullet": 5.56, "price": 300, "rank": 4] as [String : Any]
            let m4 = ["name": "M416", "distance": 700, "bullet": 5.56, "price": 600, "rank": 2] as [String: Any]
            let g98k = ["name": "98K", "distance": 1200, "bullet": 7.62, "price": 1000, "rank": 1] as [String: Any]
            let uzi = ["name": "UZI", "distance": 100, "bullet": 0.9, "price": 100, "rank": 6] as [String: Any]
            WeaponDb.insertToTable(dataDict: ak as NSDictionary)
            WeaponDb.insertToTable(dataDict: ump as NSDictionary)
            WeaponDb.insertToTable(dataDict: m16 as NSDictionary)
            WeaponDb.insertToTable(dataDict: m4 as NSDictionary)
            WeaponDb.insertToTable(dataDict: g98k as NSDictionary)
            WeaponDb.insertToTable(dataDict: uzi as NSDictionary)
        }
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

