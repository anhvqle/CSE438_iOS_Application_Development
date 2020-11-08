//
//  AppDelegate.swift
//  AnhLe-Lab3
//
//  Created by Anh Le on 10/23/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //optional func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem,completionHandler: @escaping (Bool) -> Void)
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void){
        print("quoc chim")
        if shortcutItem.type == "depauw.AnhLe-Lab3.color-flower" {
            print("flower")
        }
        else if shortcutItem.type == "depauw.AnhLe-Lab3.color-hello-kitty" {
            print("hello kitty")
        }
        else if shortcutItem.type == "depauw.AnhLe-Lab3.color-pig" {
            print("pig")
        }
        else if shortcutItem.type == "depauw.AnhLe-Lab3.color-duck" {
            print("duck")
        }
    }
}

