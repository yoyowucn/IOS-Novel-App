//
//  BaseJsonBean.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/27.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import ObjectMapper
struct BaseJsonBean:Mappable {
    var status :Int?
    var msg : String?
    var data : Any?
    var error : Int?
    var url : String?
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
        msg <- map["msg"]
        error <- map["error"]
    }
    
    
}
