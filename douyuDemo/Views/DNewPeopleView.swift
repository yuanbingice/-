//
//  DNewPeopleView.swift
//  douyuDemo
//
//  Created by ice on 2016/10/18.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit
import YYKit
import WPAttributedMarkup

//新秀视图(头像,名称,介绍)

class DNewPeopleView: UIView {

    //重写一个构造器
    init(frame: CGRect, imageUrl: String, name: String, detail: String) {
        
        super.init(frame: frame)
        
        //头像
       
        let imageView = UIImageView()
        //利用第三方库,加载网络图片
        imageView.setImageWithURL(NSURL(string: imageUrl), placeholder: UIImage(named: "Image_head"))
            
        self.addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(80)
            make.top.equalTo(0)
        }
        //圆角
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        
        
        //名称
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.textAlignment = .Center
        nameLabel.font = UIFont.systemFontOfSize(16)
        nameLabel.adjustsFontSizeToFitWidth = true // 自适应宽度
        self.addSubview(nameLabel)
        nameLabel.snp_makeConstraints { (make) in
            
            make.left.right.equalTo(imageView)
            make.top.equalTo(imageView.snp_bottom)
            make.height.equalTo(20)
        }
        
        //游戏介绍
        let detailLabel = UILabel()
        detailLabel.font = UIFont.systemFontOfSize(15)
        detailLabel.textColor = UIColor ( red: 0.8048, green: 0.8202, blue: 0.8738, alpha: 1.0 )
        detailLabel.text = detail
        detailLabel.textAlignment = .Center
        self.addSubview(detailLabel)
        detailLabel.snp_makeConstraints { (make) in
            
            make.left.right.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp_bottom)
            make.height.equalTo(20)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
