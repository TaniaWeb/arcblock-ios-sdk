//
//  AppDelegate.swift
//  ocap-demo
//
//  Created by Jonathan Lu on 26/6/2018.
//  Copyright © 2018 ArcBlock. All rights reserved.
//

import UIKit
import ArcBlockSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var btcClient: ABSDKClient!
    var ethClient: ABSDKClient!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let databaseURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("ocap-demo-db")
        print(databaseURL)
        do {
            // initialize the ArcBlock client configuration configuration
            let btcConfiguration = try ABSDKClientConfiguration(endpoint: .btc, databaseURL: databaseURL)
            let ethConfiguration = try ABSDKClientConfiguration(endpoint: .eth, databaseURL: databaseURL)
            // initialize app sync client
            btcClient = try ABSDKClient(configuration: btcConfiguration)
            ethClient = try ABSDKClient(configuration: ethConfiguration)
        } catch {
            print("Error initializing ABSDKClient. \(error)")
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
