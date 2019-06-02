//
//  TabHomeJsonBean.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/28.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import ObjectMapper
struct TabHomeJsonBean: Mappable{
    var data : [ImageData]?
    var msg : String?
    var status : Int?

   
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map){
        data <- map["data"]
        msg <- map["msg"]
        status <- map["status"]
    }
    

}
struct ImageData :Mappable{
    var id : Int?
    var imamsg : String?
    var imgkey : String?
    var imgname : String?
    var imgurl : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        imamsg <- map["imamsg"]
        imgkey <- map["imgkey"]
        imgname <- map["imgname"]
        imgurl <- map["imgurl"]
    }

 
}
