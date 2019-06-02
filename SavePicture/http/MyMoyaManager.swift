//
//  MyMoyaManager.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/27.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
private func endpointMapping<Target: TargetType>(target: Target) -> Endpoint {
    log.info("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n参数：\(String(describing: target.task)) ")
    return MoyaProvider.defaultEndpointMapping(for: target)
}
struct MyMoyaManager{
   
    
    
    
    //获取我的image
    static func getTabHomeImg<T:TargetType>(controller:UIViewController,_ target:T,progress: Progress? = nil ,success successCallback: @escaping (TabHomeJsonBean?) -> Void) {
        let provider = MoyaProvider<T>(endpointClosure: endpointMapping,plugins:[RequestAlertPlugin(viewController: controller)])
        provider.request(target) { (event) in
            switch event {
            case let .success(response):
                do {
                    let data = try response.mapJSON() as! [String:Any]
                    
                    let statusCode = response.statusCode
                    if (statusCode == 200) {
                        //解析登录数据
                        if let imgdata = TabHomeJsonBean(JSON: data){
                            if imgdata.status == 200 {
                                
                                successCallback(imgdata)
                            }else if imgdata.status == 414{
                            }
                        }else{
                            Log.debug("解析失败")
                        }
                    }else {
                        //请求报错提示
                        Log.debug("请求出错了\(data)")
                    }
                } catch {
                    //可不做处理
                }
                break
            case let .failure(error):
                Log.debug(error)
                break
            }
        }
    }
    
    
    //获取我的image
    static func loadupdate<T:TargetType>(controller:UIViewController,_ target:T,progress: Progress? = nil ,success successCallback: @escaping (BaseJsonBean?) -> Void) {
        let provider = MoyaProvider<T>(endpointClosure: endpointMapping,plugins:[RequestAlertPlugin(viewController: controller)])
        provider.request(target) { (event) in
            switch event {
            case let .success(response):
                do {
                    let data = try response.mapJSON() as! [String:Any]
                    let statusCode = response.statusCode
                    if (statusCode == 200) {
                        //解析登录数据
                        if let imgdata = BaseJsonBean(JSON: data){
                            if imgdata.status == 200 {
                                
                                successCallback(imgdata)
                            }else if imgdata.status == 414{
                            }
                        }else{
                            Log.debug("解析失败")
                        }
                    }else {
                        //请求报错提示
                        Log.debug("请求出错了\(data)")
                    }
                } catch {
                    //可不做处理
                }
                break
            case let .failure(error):
                Log.debug(error)
                break
            }
        }
    }
    
    //获取分类
    static func getnoveltypelist<T:TargetType>(controller:UIViewController,_ target:T,progress: Progress? = nil ,success successCallback: @escaping (NovelTypeBean?) -> Void) {
        let provider = MoyaProvider<T>(endpointClosure: endpointMapping,plugins:[RequestAlertPlugin(viewController: controller)])
        provider.request(target) { (event) in
            switch event {
            case let .success(response):
                do {
                    let data = try response.mapJSON() as! [String:Any]
                    let statusCode = response.statusCode
                    if (statusCode == 200) {
                        //解析登录数据
                        if let typedata = NovelTypeBean(JSON: data){
                            if typedata.status == 200 {
                                successCallback(typedata)
                            }else if typedata.status == 414{
                            }
                        }else{
                            Log.debug("解析失败")
                        }
                    }else {
                        //请求报错提示
                       Log.debug("请求出错了\(data)")
                    }
                } catch {
                    //可不做处理
                }
                break
            case let .failure(error):
                Log.debug(error)
                break
            }
        }
    }
    //获取该分类下的列表
    static func getnovellist<T:TargetType>(controller:UIViewController,_ target:T,progress: Progress? = nil ,success successCallback: @escaping (NovelBean?) -> Void) {
        let provider = MoyaProvider<T>(endpointClosure: endpointMapping,plugins:[RequestAlertPlugin(viewController: controller)])
        provider.request(target) { (event) in
            switch event {
            case let .success(response):
                do {
                    let data = try response.mapJSON() as! [String:Any]
                    let statusCode = response.statusCode
                    if (statusCode == 200) {
                        //解析登录数据
                        if let noveldata = NovelBean(JSON: data){
                            if noveldata.status == 200 {
                                successCallback(noveldata)
                            }else if noveldata.status == 414{
                            }
                        }else{
                            debugPrint("解析失败")
                        }
                    }else {
                        //请求报错提示
                        debugPrint("请求出错了\(data)")
                    }
                } catch {
                    //可不做处理
                }
                break
            case let .failure(error):
               Log.debug(error)
                break
            }
        }
    }
    //登陆
    static func novellogin<T:TargetType>(controller:UIViewController,_ target:T,success successCallback: @escaping (User?) -> Void) {
        let provider = MoyaProvider<T>(endpointClosure: endpointMapping,plugins:[RequestAlertPlugin(viewController: controller)])
        provider.request(target) { (event) in
            switch event {
            case let .success(response):
                do {
                    let data = try response.mapJSON() as! [String:Any]
                    let statusCode = response.statusCode
                    if (statusCode == 200) {
                        //解析登录数据
                        if let u = User(JSON: data){
                            if u.status == 200 {
                                successCallback(u)
                            }else if u.status == 414{
                            }else{
                                controller.ShowTip(Title: "请求失败")
                            }
                        }else{
                            Log.debug("解析失败")
                        }
                    }else {
                        //请求报错提示
                        Log.debug("请求出错了\(data)")
                    }
                } catch {
                    //可不做处理
                }
                break
            case let .failure(error):
                Log.debug(error)
                break
            }
        }
    }
    
    
}
