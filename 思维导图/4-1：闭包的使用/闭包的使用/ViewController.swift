//
//  ViewController.swift
//  闭包的使用
//
//  Created by 吴鸿 on 2017/3/3.
//  Copyright © 2017年 吴鸿. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var httpTools : HttpTools?
    
    
    //swift 中只要对父类的方法重写，必须在枉法掐面加上override
    override func viewDidLoad() {
        super.viewDidLoad()
        httpTools = HttpTools()
    }

    
    //MARK:点击
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("点击")
        /*
          self.一般是可以省略的
          1>如果该方法中有局部变量和成员属性有歧义（名称相同）
          2>在闭包中使用成员属性
        */
        
        //解决循环引用
        //方案一
            weak var weakSelf : ViewController? = self
            
            httpTools?.loadData( { (jsonData : String) in
                print( "在viewController获取到数据:\(jsonData)")
                weakSelf?.view.backgroundColor = UIColor.red
            })
        
        //方案二：
            httpTools?.loadData({[weak self] (jsonData : String) in
                self?.view.backgroundColor = UIColor.red
            })
        //方案三:
        // unowned --> unsafe_unretained(野指针)
            httpTools?.loadData({[unowned self] (jsonData : String) in
                self.view.backgroundColor = UIColor.red
            })
        //尾随闭包的概念
        //如果在函数中，闭包是最后一个参数，那么可以写成尾随闭包
        httpTools?.loadData() {[unowned self] (jsonData : String) in
            self.view.backgroundColor = UIColor.red
        }
        
        //如果是唯一的参数，也可以将前面的（）省略掉
        httpTools?.loadData{[unowned self] (jsonData : String) in
            self.view.backgroundColor = UIColor.red
        }
        
    }
    
    deinit {
        print("ViewController---deinit")
    }
    
}

