//
//  DMySetViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/15.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//我的设置界面
class DMySetViewController: DBaseTableViewController {
    
    //用来标记开关
    var switchTag = 0
    
    var sliderTag = 0
    
    //数据源数组
    var cellInfos = [
        [  //第一组section
            [
                "title": "列表自动加载",
                "type": "swith"  //用于区分右侧视图的类型,开关
            ],
            [
                "title": "展示全部分类",
                "type": "swith"  //用于区分右侧视图的类型
            ]
        ],
        [  //第二组section
            [
                "title": "播放器手势",
                "type": "swith"  //用于区分右侧视图的类型
            ],
            [
                "title": "弹幕透明度",
                "type": "none"  //用于区分右侧视图的类型,没有视图
            ],
            [
                "title": "",
                "type": "slider"  //用于区分右侧视图的类型
            ],
            [
                "title": "弹幕字号",
                "type": "none"  //用于区分右侧视图的类型
            ],
            [
                "title": "",
                "type": "slider"  //用于区分右侧视图的类型
            ],
            [
                "title": "休眠设置",
                "type": "1"  //用于区分右侧视图的类型,小箭头
            ]
        ],
        [  //第三组section
            [
                "title": "消息通知",
                "type": "swith"  //用于区分右侧视图的类型
            ],
            [
                "title": "清理缓存",
                "type": "label"  //用于区分右侧视图的类型
            ]
        ]
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //继承的方法
        self.addBackButton()
        self.addNavTitle("设置")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        tableView.rowHeight = 50
        
        tableView.sectionHeaderHeight = 38  //组头视图高度
        
    }
    
    //开关的响应方法
    func switchAction(sw: UISwitch){
        
    }
    
    //改变字体大小
    func sliderAction(sl: UISlider){
        
    }


}


//MARK:  表格视图代理
extension DMySetViewController{
    
    //3组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return cellInfos.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return cellInfos[section].count
    }
    
    
    //不用全部判断cell, 多数使用cell的右侧附加视图 (这样设置简单)
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        //滑块的视图(自定制的cell)
        if (indexPath.section == 1 && indexPath.row == 2) ||  (indexPath.section == 1 && indexPath.row == 4){
            
            //已经在cell页面注册,获取,现在只需调用该方法
            let cell: DMyFontSizeCell = DMyFontSizeCell.configCell(tableView) as! DMyFontSizeCell
            
            cell.fontSlider.tag = self.sliderTag
            self.sliderTag += 1
            
            cell.fontSlider.value = 1
            cell.fontSlider.addTarget(self, action: #selector(sliderAction(_:)), forControlEvents: .ValueChanged)
            cell.selectionStyle = .None
            
            return cell
        }
        
        //s使用系统的cell
        let cell = tableView.dequeueReusableCell()
        cell.textLabel?.font = UIFont.systemFontOfSize(15)
        cell.textLabel?.textColor = UIColor.darkTextColor()
        cell.textLabel?.text = cellInfos[indexPath.section][indexPath.row]["title"]
        
        //设置cell右侧的不同样式
        let type = cellInfos[indexPath.section][indexPath.row]["type"]
        
        if  type == "swith"{ //开关
            
            let swith = UISwitch()
            swith.tag = 100 + self.switchTag
            
            self.switchTag += 1
            
            cell.accessoryView = swith
            
        }else if type == "none"{ //无效果
        
            cell.accessoryType = .None
        
        }else if type == "1"{ //箭头
            
            cell.accessoryType = .DisclosureIndicator
            
        }else if type == "label"{ //文字
            
            let label = UILabel()
            label.text = "56MB"
            
            label.font = UIFont.systemFontOfSize(15)
            cell.accessoryView = label
        }
        
        return cell
    }
    
    
    
    
}
