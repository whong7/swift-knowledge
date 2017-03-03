//
//  HttpTools.swift
//  闭包的使用
//
//  Created by 吴鸿 on 2017/3/3.
//  Copyright © 2017年 吴鸿. All rights reserved.
//

import UIKit

class HttpTools {
    
    
    var finishedCallback : ((_ jsonData : String)->())?
    
    
    //闭包类型 ：（参数列表）->(返回值类型)
    //@escaping:逃逸的 在其他闭包里面 用到当前闭包，不许添加@escaping
    func loadData(_ finishedCallback : @escaping (_ jsonData : String)->()){
        
        self.finishedCallback = finishedCallback
        
        //1.发送异步网络请求
        DispatchQueue.global().async {
            print("发送异步请求：\(Thread.current)")
            
            //2.回到主线程
            DispatchQueue.main.sync {
                print("回到主线程：\(Thread.current)")
                 //3.回调异步
                finishedCallback("jsonData")
               
            }
        }   
    }
}
