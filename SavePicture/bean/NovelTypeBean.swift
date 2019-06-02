//
//  NovelTypeBean.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/22.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import ObjectMapper
struct NovelTypeBean:Mappable {
    var status :Int?
    var msg : String?
    var data : [NovelType]?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
        msg <- map["msg"]
    }
}
struct NovelType:Mappable {
    var id :Int?
    var typename : String?
    var typeimg : String?
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        typename <- map["typename"]
        typeimg <- map["typeimg"]
    }
}
