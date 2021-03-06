//
//  AppDelegate.swift
//  Demo5
//
//  Created by Michael on 22/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import UIKit
import CryptoSwift
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let reachability = Reachability()!
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        do {
            try reachability.startNotifier()
        } catch {
            
        }
//        reachability.whenReachable = { reachability in
//            if reachability.connection == .wifi {
//                print("Reachable via WiFi")
//            } else {
//                print("Reachable via Cellular")
//            }
//        }
//        reachability.whenUnreachable = { _ in
//            print("Not reachable")
//        }
//        
//        do {
//            try reachability.startNotifier()
//        } catch {
//            print("Unable to start notifier")
//        }
        
        
        print("12345abc".md5())
        
        var jsonFilePath:String = "/Users/michael/Desktop/tmp/library.json"
        
        let url:URL = URL(fileURLWithPath: jsonFilePath)
        var library:[String:Any]?
        do {
            var jsonData:Data? = try Data(contentsOf: url)
            library =  try JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [String : Any]
            if library != nil {
                let books:[[String:String]]? =  library!["books"] as? [[String:String]]
                if books != nil {
                    print("first ", books![0]["author"])
                }
                
            }
            
            
        } catch let error as NSError {
            print("\(error)")
        }
        
        print("\(library)")
        
        
        
        
    
        var newlibrary:Library?
        do {
            let jsonData:Data? = try Data(contentsOf: url)
            newlibrary =  try JSONDecoder().decode(Library.self, from: jsonData!)
            
            print("new ==== ", newlibrary?.books[0].author)
            
        } catch let error as NSError {
            print("\(error)")
        }
        print(newlibrary!)
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

