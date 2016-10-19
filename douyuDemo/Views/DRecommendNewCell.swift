//
//  DRecommendNewCell.swift
//  douyuDemo
//
//  Created by ice on 2016/10/17.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit


//推荐页面 新主播cell
class DRecommendNewCell: UITableViewCell {

    //滚动视图
    var scrollView: UIScrollView?
    
    //注册时会调用这个方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //配置滚动视图
        scrollView = UIScrollView()
        scrollView?.userInteractionEnabled = true
        scrollView?.pagingEnabled = false
        scrollView?.bounces = false
        scrollView?.showsVerticalScrollIndicator = false
        scrollView?.showsHorizontalScrollIndicator = false
        self.contentView.addSubview(scrollView!)
        scrollView?.snp_makeConstraints(closure: { (make) in
            
            make.edges.equalTo(0)
        })
    }
    
    //传入新秀的数组模型,进行cell的配置
    func configCell(array: [DNewPeopleModel]){
        
        for i in 0..<array.count{
            
            let model = array[i]
            
            let frame = CGRectMake(CGFloat((i+1)*5+i*90), 5, 90, 130)
            //拼接头像的url
            let imageUrl = String(format: "%@%@%@%@", kHeadImageUrl, model.owner_uid!, kHeadImageUrlAppend, nowTimeString)
            
            let customView = DNewPeopleView(frame: frame, imageUrl: imageUrl, name: model.nickname!, detail: model.game_name!)
            
            scrollView?.addSubview(customView)
            
            //并且需要添加手势,进入到对应的直播页面
//            let tap = UITapGestureRecognizer(target: self, action: <#T##Selector#>)
            
        }
        
        scrollView?.contentSize = CGSizeMake(CGFloat(95*array.count), 130)
    
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
