//
//  DlIveListViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/19.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit
import MJRefresh //下拉刷新,上拉加载更多

//直播列表页面
class DLiveListViewController: ViewController {

    //请求的参数,偏移量,上啦加载的参数
    var offset = 0
    
    //数据模型
    var liveListModel: DLiveListModel!
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureColectionView()
        prepareData()
        
        addMJRefresh() //添加刷新功能
    }
    
    //添加刷新功能
    func addMJRefresh(){
        
        //上拉加载更,尾随闭包
        collectionView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: { 
            
            self.offset += 20
            
            self.prepareData() //重新加载数据
            
        })
        
        //下拉获取第一页数据
        collectionView.mj_header = MJRefreshNormalHeader(refreshingBlock: { 
            
            self.offset = 0
            self.prepareData()
        })
        
    }
        

    
    
    
    //集合视图
    func configureColectionView(){
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = CGSizeMake(kScreenWidth/2-10, kScreenWidth/2-10)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        //设置边距
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 5, 5, 5)
        
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
        collectionView.registerNibOf(DcateCollectionCell)
        
    }
    
    
    //配置数据
    func prepareData(){
        
        // GET 的请求方式
        let urlString = String(format: kLiveListUrl, offset)
        
        print(urlString)
        
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
extension DLiveListViewController: MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWithError error: NSError) {
        
        
    }
    
    //下载成功
    func downloader(downloader: MyDownloader, didFinishWithData data: AnyObject) {
        
        if self.offset == 0{
            //先清空再重新下数据
            self.liveListModel = nil
        
        }
        
        //配置数据源模型,只需在模型中层层写出即可
        self.liveListModel = DLiveListModel.modelWithJSON(data)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
         
            //结束刷新
            self.collectionView.mj_footer.endRefreshing()
            self.collectionView.mj_header.endRefreshing()
            
            self.collectionView.reloadData()
         
        }
    }
    
    
    
}


//MARK: 集合视图的代理
extension  DLiveListViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if liveListModel != nil{
            
            return liveListModel.data!.count
            
        }
        
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell: DcateCollectionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        let model = liveListModel.data![indexPath.item]
        
        cell.configureWithModel(model)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //反选
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }
    

}
