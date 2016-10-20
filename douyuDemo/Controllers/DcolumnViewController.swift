//
//  DcolumnViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/19.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//栏目页面

class DcolumnViewController: ViewController {

    //数据模型
    var columnModel: DcolumnModel!
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureColectionView()
        
        //配置数据
        prepareData()
    }
    
    //集合视图
    func configureColectionView(){
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSizeMake(kScreenWidth/3-15, (kScreenWidth/3-30)*2)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        //设置边距
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        //要加到cell的contentView
        self.view.addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(49)
        }
      
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //注册cell
        collectionView.registerNibOf(DColumnCollectionViewCell)
        
    }
    
    //配置数据
    func prepareData(){
        
        // GET 的请求方式
        let urlString = String(format: "%@%@", kColumnUrl, nowTimeString)
        
        let downloader = MyDownloader()
        
        downloader.delegate = self
        
        downloader.downloadWithUrlString(urlString, methodOfRequest: MyRequestMethod.MyGet, parameterDict: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//MARK: 下载数据代理
extension DcolumnViewController: MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWithError error: NSError) {
        
        
    }
    
    //下载成功
    func downloader(downloader: MyDownloader, didFinishWithData data: AnyObject) {
        
        //配置数据源模型,只需在模型中层层写出即可
        self.columnModel = DcolumnModel.modelWithJSON(data)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            self.collectionView.reloadData()
    
        }
    }
    
    
    
    
}


//MARK: 集合视图的代理
extension  DcolumnViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if columnModel != nil{
            
            return columnModel.data!.count

        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        

        let cell: DColumnCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        let model = columnModel.data![indexPath.item]
        
        cell.configureWithModel(model)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //反选
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }
    
    
    
    
    
}

