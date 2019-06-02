//
//  UserInfoHelper.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/23.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
class UserInfoHelper  {
    var user : UserBean?
    var islogin : Bool = false
    static let instance = UserInfoHelper()
    init() {
        
    }
    func setUserinfo(u:UserBean){
        self.user = u
        islogin = true
    }
    
    
    func getusertoken() -> String {
       guard let s = self.user?.token! else { return "" }
       return s
    }
    
    
    
}
