//
//  newsModel.swift
//  网易新闻
//
//  Created by 吴鸿 on 2017/3/4.
//  Copyright © 2017年 吴鸿. All rights reserved.
//

import UIKit

class newsModel: NSObject {
    var title : String = ""
    var imgsrc : String = ""
    
    
    // MARK: 字典转模型
    init(dict : [String :Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
    
}
