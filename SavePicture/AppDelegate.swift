//
//  AppDelegate.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/16.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit
import SwiftyBeaver
import AVKit
import Photos
import IQKeyboardManagerSwift
var Log = SwiftyBeaver.self
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M"
        console.levelString.debug   = "DEBUG "
        console.levelString.error   = "ERROR "
        console.levelString.info    = "INFO  "
        console.levelString.warning = "WARING"
        console.levelColor.debug    = "🌝🎈🌧☃️❄️☂️🌈  "
        console.levelColor.error    = "🥶😱🤬🥵😤🥴👿  "
        console.levelColor.info     = "🌸🌺🎋🎄🌹🌻🌳  "
        console.levelColor.warning  = "😀😃😄😁😆😅😂  "
        Log.addDestination(console)
        log.debug("我是你爸爸")
        
        chiosephotoorcamer()
        
        return true
    }
    func chiosephotoorcamer(){
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == .notDetermined {
            AVCaptureDevice.requestAccess(for: .video) { (request) in
                if request{
                    log.debug("允许用户访问相机")
                }else{
                    log.debug("拒绝用户访问相机")
                }
            }
        }
        
        if PHPhotoLibrary.authorizationStatus() == .notDetermined{
            PHPhotoLibrary.requestAuthorization { (PHAuthorizationStatus) in
                let result = (PHAuthorizationStatus == .authorized)
                if result{
                    log.debug("允许用户访问相册")
                }else{
                    log.debug("拒绝用户访问相册")
                }
            }
        }
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

