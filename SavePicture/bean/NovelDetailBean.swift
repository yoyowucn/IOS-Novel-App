//
//  NovelDetailBean.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/22.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import ObjectMapper
struct NovelDetailBean:Mappable{
    var status :Int?
    var msg : String?
    var data : [NovelDetail]?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
        msg <- map["msg"]
    }
}
struct NovelDetail:Mappable {
    var id :Int?
    var novel_id : Int?
    var novel_content : String?
    var novel_chapter : String?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        novel_id <- map["novel_id"]
        novel_content <- map["novel_content"]
        novel_chapter <- map["novel_chapter"]
    }
}
