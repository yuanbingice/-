//
//  DBaseTableViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/15.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit
import SnapKit  //约束


//包含表格视图的基础类

class DBaseTableViewController: ViewController {
    
    //数据源数组
    var dataArray: NSArray = []
    
    //表格视图
    private(set) lazy var tableView: UITableView = {
       
        let tableView = UITableView(frame: CGRectZero, style: .Plain)
        //关闭水平提示条
        tableView.showsHorizontalScrollIndicator = false

        tableView.backgroundColor = UIColor ( red: 0.8774, green: 1.0, blue: 0.9092, alpha: 1.0 )
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        
        self.view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) in
            
            make.left.right.equalTo(0)
            make.top.equalTo(64)
            make.bottom.equalTo(-49) //比底部小就应该为负数,右侧也类似
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


//MARK: 表格视图代理
extension DBaseTableViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("子类必须重写该方法")
        
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        print("子类必须重写该方法")
        
        return UITableViewCell()
    }
    
}

