//
//  NetworkService.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/17.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import SwiftyBeaver
let log = SwiftyBeaver.self
let NetworkServiceProvider = MoyaProvider<NetworkService>(endpointClosure:endpointMapping,plugins:[])

private func endpointMapping<Target:Moya.TargetType>(target:Target) ->Endpoint{
    log.debug("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n参数：\(String(describing: target.task)) ")
    return MoyaProvider.defaultEndpointMapping(for: target)
}
public enum NetworkService{
    case Login(phone:String,password:String)
    case register(phone:Int,password:Int)
    case typepagenovel(page:Int,size:Int,type:Int)
    case serarchnovel(novelname:String)
    case allnoveltype
    case getmyimages(page:Int,size:Int)
    case saveimages(file:NSArray)
}

extension NetworkService:Moya.TargetType{
    public var baseURL: URL {
        let baseurl = "http://47.112.107.122:8080/novel-1/mynovel"
        return URL(string: baseurl)!
    }
    
    public var path: String {
        switch self {
        case .Login:
            return "login"
        case .register:
            return "register"
        case .typepagenovel:
            return "pagenovel"
        case .serarchnovel:
            return "searchnovel"
        case .allnoveltype:
            return "getallnoveltype"
        case .getmyimages:
            return "myappliction-1/applicationimg/getphotos"
        case .saveimages:
            return "myappliction-1/applicationimg/savefile"
        }
        
    }
    
    public var method: Moya.Method {
        switch self {
        case .register,.Login,.typepagenovel,.serarchnovel,.allnoveltype,.getmyimages,.saveimages:
            return .post
        
        }
    }
    
    public var sampleData: Data {
         return "{}".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .register(let phone,let  password):
            return .requestParameters(parameters: ["phone" : phone,"password":password], encoding: URLEncoding.queryString)
        case .Login(let phone,let  password):
            return .requestParameters(parameters: ["phone" : phone,"password":password], encoding: URLEncoding.queryString)
        case .typepagenovel(let page, let size,let type):
            return .requestParameters(parameters: ["page" : page,"size":size,"type": type], encoding: URLEncoding.queryString)
        case .serarchnovel(let novelname):
            return .requestParameters(parameters: ["novelname" : novelname], encoding: URLEncoding.queryString)
        case .allnoveltype:
            return .requestPlain
        case .getmyimages(let page, let size):
            return .requestParameters(parameters: ["page" : page,"size":size], encoding: URLEncoding.queryString)
        case .saveimages(let imagelist):
            let formDataAry:NSMutableArray = NSMutableArray()
            for (index,img) in imagelist.enumerated() {
                let data:Data = (img as! UIImage).jpegData(compressionQuality: 1)!
                let name = img as! UIImage
                
                log.debug(name)
                let date:Date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"
                var dateStr:String = formatter.string(from: date as Date)
                dateStr = dateStr.appendingFormat("-%i.png", index)
                let formData = MultipartFormData(provider: .data(data), name: "file", fileName: dateStr, mimeType: "image/jpeg")
                formDataAry.add(formData)
            }
            return .uploadMultipart(formDataAry as! [MultipartFormData])
        }
    }
    
    public var headers: [String : String]? {
         return ["Content-type": "application/json"]
    }
    
    
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
