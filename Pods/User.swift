//
//  User.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/22.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import ObjectMapper

struct User:Mappable{
    var status :Int?
    var msg : String?
    var data : UserBean?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
        msg <- map["msg"]
    }
}
struct UserBean :Mappable{
    var id :Int?
    var relasename:String?
    var nickname:String?
    var account:String?
    var password:String?
    var icon:String?
    var likestarts:Int?
    var fances:Int?
    var token:String?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        relasename <- map["relasename"]
        nickname <- map["nickname"]
        account <- map["account"]
        password <- map["password"]
        icon <- map["icon"]
        likestarts <- map["likestarts"]
        fances <- map["fances"]
        token <- map["token"]
    }
    
    
}

