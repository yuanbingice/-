//
//  DMyFontSizeCell.swift
//  douyuDemo
//
//  Created by ice on 2016/10/15.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//我的设置里面  设置字体大小的cell
class DMyFontSizeCell: UITableViewCell {

    @IBOutlet weak var fontSlider: UISlider!
    
    @IBOutlet weak var smallLabel: UIImageView!
    
    @IBOutlet weak var bigLabel: UIImageView!
    
    
    class func configCell(tableView: UITableView) -> UITableViewCell{
        
        //先注册
        tableView.registerNibOf(DMyFontSizeCell)
        
        //从队列中获取
        let cell: DMyFontSizeCell = tableView.dequeueReusableCell()
        
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
