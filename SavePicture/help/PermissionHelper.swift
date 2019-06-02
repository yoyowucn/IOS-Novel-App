//
//  PermissionHelper.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/27.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import Photos
import AVKit
struct PermissionHelper {
    
    static let instance = PermissionHelper()
    init() {}
    ///获取当前控制器
    func currentVc() ->UIViewController{
        
        var vc = UIApplication.shared.keyWindow?.rootViewController
        
        if (vc?.isKind(of: UITabBarController.self))! {
            vc = (vc as! UITabBarController).selectedViewController
        }else if (vc?.isKind(of: UINavigationController.self))!{
            vc = (vc as! UINavigationController).visibleViewController
        }else if ((vc?.presentedViewController) != nil){
            vc =  vc?.presentedViewController
        }
        
        return vc!
        
    }
    
    
    func photoEnable() -> Bool {
        func photoResult() {
            let status = PHPhotoLibrary.authorizationStatus()
            if (status == .authorized) {
                savePhoto(value: "1")
            }
            else if (status == .restricted || status == .denied) {
                let alertV = UIAlertView.init(title: "提示", message: "请去-> [设置 - 隐私 - 相册] 打开访问开关", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "确定")
                alertV.show()
                savePhoto(value: "0")
            }
            else if (status == .notDetermined) {//首次使用
                PHPhotoLibrary.requestAuthorization({ (firstStatus) in
                    let isTrue = (firstStatus == .authorized)
                    if isTrue {
                        print("首次允许")
                        savePhoto(value: "1")
                    } else {
                        print("首次不允许")
                        savePhoto(value: "0")
                    }
                })
            }
        }
        func savePhoto(value: String) {
            UserDefaults.standard.setValue(value, forKey: "photoEnablebs")
        }
        let result = (UserDefaults.standard.object(forKey: "photoEnablebs") as! String) == "1"
        return result
    }
    ///相册权限 --> 需要AppleDelegate中让用户先选择授权
    func photoEnableDelegate() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .authorized {
            return true
        }
        return false
    }
    
    //UIDevice.current.systemVersion < 8.0
    //depressed
    ///相册权限---> 需要AppleDelegate中让用户先选择授权, 此方法将被废弃 <AssetsLibrary方法 @available(iOS 7.0, *)>
    //    func photoEnableDelegate2() -> Bool {
    //        let author = ALAssetsLibrary.authorizationStatus()
    //        print("--\(author.rawValue)--")
    //        if (author == .restricted || author == .denied) {
    //            let alertV = UIAlertView.init(title: "提示", message: "请去-> [设置 - 隐私 - 相册] 打开访问开关", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "确定")
    //            alertV.show()
    //            return false
    //        }
    //        return true
    //    }
    
    //MARK: 判断是否可访问相机
    ///相机权限 ---> 直接调用
    func cameraEnable() -> Bool {
        func cameraResult() {
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            
            if (authStatus == .authorized) { /****已授权，可以打开相机****/
                saveCamera(value: "1")
            }
                
            else if (authStatus == .denied) {
                saveCamera(value: "0")
                let alertV = UIAlertView.init(title: "提示", message: "请去-> [设置 - 隐私 - 相机] 打开访问开关", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "确定")
                alertV.show()
            }
                
            else if (authStatus == .restricted) {//相机权限受限
                saveCamera(value: "0")
                let alertV = UIAlertView.init(title: "提示", message: "相机权限受限", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "确定")
                alertV.show()
            }
                
            else if (authStatus == .notDetermined) {//首次 使用
                AVCaptureDevice.requestAccess(for: .video, completionHandler: { (statusFirst) in
                    if statusFirst {
                        //用户首次允许
                        saveCamera(value: "1")
                    } else {
                        //用户首次拒接
                        saveCamera(value: "0")
                    }
                })
            }
        }
        func saveCamera(value: String) {
            UserDefaults.standard.setValue(value, forKey: "cameraEnablebs")
        }
        cameraResult()
        let result = (UserDefaults.standard.value(forKey: "cameraEnablebs") as! String) == "1"
        return result
    }
    
    ///相机权限2 --> 需要AppleDelegate中让用户先选择授权
    func cameraEnableDelegate() -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch status {
        case .authorized:
            return true
        case .denied:
            // 请求授权
            //            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
            //                DispatchQueue.main.async(execute: { () -> Void in
            //                    _ = self.cameraEnableDelegate()
            //                })
            //            })
            //
            return false
        case .notDetermined:
            // 请求授权
            //            PHPhotoLibrary.requestAuthorization({ (status) -> Void in
            //                DispatchQueue.main.async(execute: { () -> Void in
            //                    _ = self.cameraEnableDelegate()
            //                })
            //            })
            
            
            return false
        case .restricted:
            let alertV = UIAlertView.init(title: "提示", message: "相机权限受限", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "确定")
            alertV.show()
            return false
            //        default:
            //            DispatchQueue.main.async(execute: { () -> Void in
            //                let alertController = UIAlertController(title: "照片访问受限",
            //                                                        message: "点击“设置”，允许访问您的照片",
            //                                                        preferredStyle: .alert)
            //
            //                let cancelAction = UIAlertAction(title:"取消", style: .cancel, handler:nil)
            //
            //                let settingsAction = UIAlertAction(title:"设置", style: .default, handler: {
            //                    (action) -> Void in
            //                    let url = URL(string: UIApplication.openSettingsURLString)
            //                    if let url = url, UIApplication.shared.canOpenURL(url) {
            //                        if #available(iOS 10, *) {
            //                            UIApplication.shared.open(url, options: [:],
            //                                                      completionHandler: {
            //                                                        (success) in
            //                            })
            //                        } else {
            //                            UIApplication.shared.openURL(url)
            //                        }
            //                    }
            //                })
            //
            //                alertController.addAction(cancelAction)
            //                alertController.addAction(settingsAction)
            //
            //                self.currentVc().present(alertController, animated: true, completion: nil)
            //            })
            //        }
            //        return false
        }
        
    }
    
    
    
    
}
