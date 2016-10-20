//
//  DcateCollectionCell.swift
//  douyuDemo
//
//  Created by ice on 2016/10/19.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit
//推荐页面 分类 中 自定义每个collection cell 
class DcateCollectionCell: UICollectionViewCell {

    //视频截图
    @IBOutlet weak var imageView: UIImageView!
    
    //标题
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var onlineLabel: UILabel!
    
    
    //配置推荐页面中cell的模型
    func configureConllectionViewCell(model: DCateRoomListModel){

        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = true
        //截图
        self.imageView.setImageWithURL(NSURL(string: model.room_src!), placeholder: UIImage(named: "Img_default"))

        
        //主播名
        self.nameLabel.text = model.nickname!
        
        //在线人数
        self.onlineLabel.text = String(format: "%0.1f万", Double(model.online!)/10000)
        //房间的标题
        self.detailLabel.text = model.room_name!
        
        self.detailLabel.backgroundColor = UIColor ( red: 0.7892, green: 0.9879, blue: 0.9996, alpha: 1.0 )
    }
    
    
    //配置直播列表中的cell
    func configureWithModel(model: DLiveListDataModel){
        
        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = true
        
        //截图
        self.imageView.setImageWithURL(NSURL(string: model.room_src!), placeholder: UIImage(named: "Img_default"))
        
        
        //主播名
        self.nameLabel.text = model.nickname!
        
        //在线人数
        self.onlineLabel.text = String(format: "%0.1f万", Double(model.online!)/10000)
        //房间的标题
        self.detailLabel.text = model.room_name!
        
        self.detailLabel.backgroundColor = UIColor ( red: 0.7892, green: 0.9879, blue: 0.9996, alpha: 1.0 )
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
