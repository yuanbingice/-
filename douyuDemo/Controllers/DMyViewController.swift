//
//  MyViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/15.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//我的页面
class DMyViewController: DBaseTableViewController {

    //数据源 (section = 1)
    var array = [
            ["Image_focus", "我的关注"],
            ["Image_history", "观看历史"],
            ["Image_tesk", "我的任务"],
            ["Image_remind", "开播提醒"],
            ["Image_set", "系统设置"],
            ["Image_recommend", "精彩推荐"]
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

//MARK: 表格视图的代理
extension DMyViewController{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1{  //控制了每组的行数
            
            return 5
        }else{
            return 1
        }
    }
    
    //高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            
            return 85
            
        }else{
            
            return 50
        }
    }
    
    //组头视图高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 35
    }
    

    //MARK: cell设置
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{  //第一组
            
            //直接侧cell内封装一个配置cell的类型方法
            let cell = DMyFirstCell.configFirstCell(tableView)
            
            return cell
            
        }else if indexPath.section == 1 {  //第二组利用数据源数组中的前5个
            
            //要用Value1 所以不用封装的方法
            let cellId = "cellId"
            
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
            
            if cell ==  nil{
                
                cell = UITableViewCell(style: .Value1, reuseIdentifier: cellId)
            }
            
            let arr = array[indexPath.row] //每次都取出一个数组,会取出前5个
            cell!.imageView?.image = UIImage(named: arr[0])
            cell!.textLabel?.text = arr[1]
            
            //选中后的显示和右侧的附加标识
            cell!.selectionStyle = .None
            cell!.accessoryType = .DisclosureIndicator
            
            return cell!
            
        } else if indexPath.section == 2{  //第三组,利用数据源数组中的最后一个
            
            //自己封装的注册方法(非xib)
            tableView.registerClassOf(UITableViewCell)
            
            //自己封装的获取的方法(泛型) 需要指定类型
            let cell: UITableViewCell = tableView.dequeueReusableCell()
            let arr = array.last!
            
            cell.imageView?.image = UIImage(named: arr[0])
            cell.textLabel?.text = arr[1]
            cell.detailTextLabel?.text = "更多鱼丸等你来拿"
            cell.detailTextLabel?.font = UIFont.systemFontOfSize(14)
            
            cell.accessoryType = .DisclosureIndicator
            cell.selectionStyle = .None

            return cell
        }
        
        return UITableViewCell()

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //进入设置页面
        if indexPath.section == 1 && indexPath.row  == 4{
            
            let setCtl = DMySetViewController()
            
            self.hidesBottomBarWhenPushed = true
            
            self.navigationController?.pushViewController(setCtl, animated: true)
            
            self.hidesBottomBarWhenPushed = false
            
        }
        
    }
    
    
}
