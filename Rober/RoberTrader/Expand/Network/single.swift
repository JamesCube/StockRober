//
//  single.swift
//  Rober
//
//  Created by Hanxun on 17/2/10.
//  Copyright © 2017年 Hanxun. All rights reserved.
//

import UIKit

final class single: NSObject {
    
    static let shared = single()
    private override init() {
        print("我是单例")
    }
    
    func ParmrInit() {
        print("我是单例方法")
    }
}
