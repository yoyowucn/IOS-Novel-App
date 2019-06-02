//
//  Taolsterhelper.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/27.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
struct Taolsterhelper {
    static var instance = Taolsterhelper()
    init() {
        
    }
    /// 代码延迟运行
    ///
    /// - Parameters:
    ///   - delayTime: 延时时间。比如：.seconds(5)、.milliseconds(500)
    ///   - qosClass: 要使用的全局QOS类（默认为 nil，表示主线程）
    ///   - closure: 延迟运行的代码
    public func delay(by delayTime: TimeInterval, qosClass: DispatchQoS.QoSClass? = nil,
                      _ closure: @escaping () -> Void) {
        let dispatchQueue = qosClass != nil ? DispatchQueue.global(qos: qosClass!) : .main
        dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delayTime, execute: closure)}
}
