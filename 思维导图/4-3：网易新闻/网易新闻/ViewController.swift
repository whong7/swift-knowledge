//
//  ViewController.swift
//  网易新闻
//
//  Created by 吴鸿 on 2017/3/3.
//  Copyright © 2017年 吴鸿. All rights reserved.
//

import UIKit

// MARK: - 定义全局常量
private let kHomeCellID = "kHomeCellID"

class ViewController: UIViewController {
    //懒加载属性
    fileprivate lazy var newsModels : [newsModel] = [newsModel]()
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        //1.创建tableView
        let tableView = UITableView()
        //2.设置tableView相关的属性
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 90
        
        //3.注册cell
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: kHomeCellID)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        self.loadData()
        
    }
    
}

// MARK: - 网络请求
extension ViewController{
    
    fileprivate func loadData(){
        
        NetworkTools.requestData(URLString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get) { (result : Any) in
            
        //1.将any类型转成字典类型
            guard let resultDict = result as?[String : Any] else{return}
        //2.根据T1348649079062的key取内容
            guard let dataArray = resultDict["T1348649079062"] as?[[String : Any]] else {return}
        //3.遍历字典，将字典转成模型对象
            for dict in dataArray {
                self.newsModels.append(newsModel(dict: dict))
            }
        //4.刷新表格
            print("\(dataArray)")
            self.tableView.reloadData()
        }
        
    }
    
}

// MARK: - 实现UITableView的数据源
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID, for: indexPath) as! TableViewCell
        cell.newsModel = self.newsModels[indexPath.row]
        
        return cell
    }
    
    
}
