//
//  NetworkTools.swift
//  网易新闻
//
//  Created by 吴鸿 on 2017/3/4.
//  Copyright © 2017年 吴鸿. All rights reserved.
//

import UIKit
import Alamofire

enum methodType {
    case get
    case post
}

class NetworkTools {
    //类方法
    class func requestData(URLString : String,type : methodType,parameters:[String : Any]? = nil,finishedCallback: @escaping(_ result : Any)->()){
    
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            //1.校验是否有结果
            guard let result = response.result.value else{
                return
            }
            //2.将结果回调出去
            finishedCallback(result)
        }
        
    }
    
   
   

}
