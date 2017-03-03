//
//  ViewController.swift
//  懒加载
//
//  Created by 吴鸿 on 2017/3/3.
//  Copyright © 2017年 吴鸿. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var name : [String] = ["why","nihao"]
    
    lazy var name1 : [String] = {
        let name1 = ["123","456"]
        return name1
    }()
    
    //方式一：仅仅创建button
    lazy var btn : UIButton = UIButton()
    //方式二：可以设置更多的btn属性
    lazy var btn1 : UIButton = {
        let btn1 = UIButton()
        btn1.setTitle("按钮", for: .normal)
        return btn1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }




}

