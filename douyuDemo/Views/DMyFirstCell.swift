//
//  DMyFirstCell.swift
//  douyuDemo
//
//  Created by ice on 2016/10/15.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//我的页面的  第一个cell
class DMyFirstCell: UITableViewCell {

    
    @IBOutlet weak var headImageView: UIImageView!
    
    
    //定义一个类型方法,用来配置cell
    class func configFirstCell(tableView: UITableView) -> UITableViewCell{
        
        
        //自己封装的泛型方法(内部已经定制了复用标记),只需在获取时 指定类型即可
        tableView.registerNibOf(DMyFirstCell)  //先注册cell
        
        //获取,指定类型
        let cell: DMyFirstCell = tableView.dequeueReusableCell()
        
        
        //附加的  和 选中的样式
        cell.accessoryType = .DisclosureIndicator
        
        cell.selectionStyle = .None

        //将图片视图变为圆形
        cell.headImageView.layer.cornerRadius = 65/2
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
