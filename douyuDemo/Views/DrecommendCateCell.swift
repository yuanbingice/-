//
//  DrecommendCateCell.swift
//  douyuDemo
//
//  Created by ice on 2016/10/19.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//推荐分类里面的自定义cell 包含集合视图(自定义的集合视图)
class DrecommendCateCell: UITableViewCell {
    
    //给集合视图赋值的模型数组,需要传值进来
    var dataArray = [DCateRoomListModel]()
    
    //cell内部是一个集合视图
    var collectionView: UICollectionView!
    let flowLayout = UICollectionViewFlowLayout()
    
    //注册时会调用该方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        flowLayout.itemSize = CGSizeMake(kScreenWidth/2-10, kScreenWidth/2-15)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 5  //行间距
        //设置边距
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5)
        
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        //要加到cell的contentView
        self.contentView.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            
            make.edges.equalTo(0)
        }
        //禁止滑动
        collectionView.scrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.backgroundColor = UIColor.whiteColor()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册集合视图的cell(xib)
        collectionView.registerNibOf(DcateCollectionCell)
        
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

//MARK: 集合视图的代理
extension DrecommendCateCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //每个cell上4个集合item
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    //配置cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell:DcateCollectionCell =  collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        let model = dataArray[indexPath.row]
        
        //配置内容
        cell.configureConllectionViewCell(model)
        
        return cell
    }
    
}

