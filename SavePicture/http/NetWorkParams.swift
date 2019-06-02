//
//  MyNetWorkParams.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/27.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import Moya
import Alamofire
public let MyNetWorkParams = NetWorkParams()

public class NetWorkParams : NSObject{
    public var msg = "msg"
    public var status = "status"
    public var data = "data"
    // 请求头
    public var isDebug = false
    public var header = [String: String]()
    public var sessionManager = DefaultAlamofireManager.sharedManager
}
public class DefaultAlamofireManager: Alamofire.SessionManager {
    static let sharedManager: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
        
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 60
        let manager = Manager(configuration: configuration)
        manager.startRequestsImmediately = false
        return DefaultAlamofireManager(configuration: configuration)
    }()
    
}
