//
//  NovelBean.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/22.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import ObjectMapper
struct NovelBean:Mappable {
    var status :Int?
    var msg : String?
    var data : [Novel]?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
        msg <- map["msg"]
    }
    
}
struct Novel:Mappable {
    var id :Int?
    var novel_id:Int?
    var novel_name:String?
    var novel_easyinfo:String?
    var novel_author:String?
    var novel_img:String?
    var novel_type:Int?
    var novel_typename:String?
    var novel_uptime:String?
    var novel_state:String?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        novel_id <- map["novel_id"]
        novel_name <- map["novel_name"]
        novel_easyinfo <- map["novel_easyinfo"]
        novel_author <- map["novel_author"]
        novel_img <- map["novel_img"]
        novel_type <- map["novel_type"]
        novel_typename <- map["novel_typename"]
        novel_uptime <- map["novel_uptime"]
        novel_state <- map["novel_state"]
    }
    
    
}
