//
//  DRecommendViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/15.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit
import SwiftyJSON
import YYKit
import SDCycleScrollView  //循环滚动视图

//推荐页面
class DRecommendViewController: DBaseTableViewController {

    //广告数据源数组
    var adImageArray = NSMutableArray()
    var adTitleArray = NSMutableArray()
    
    //新人资源数组
    var newPeopleArray = [DNewPeopleModel]()
    
    //分类推荐的数据模型,需要将模型层层写出
    var cateModel: DCategoryModel!
    
    //广告视图(利用第三方库的循环滚动)
    var adView: SDCycleScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置广告视图
        //本地占位图
        adView = SDCycleScrollView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 200), imageURLStringsGroup: adImageArray as [AnyObject])
        adView?.titlesGroup = adTitleArray as [AnyObject]
        adView?.titleLabelTextFont = UIFont.systemFontOfSize(17)
        
        adView?.placeholderImage = UIImage(named: "Img_default")
        adView?.autoScroll = false  //自动滚动
        //
        adView?.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        //页码指示器右对齐
        adView?.pageControlAliment = SDCycleScrollViewPageContolAlimentRight
        
        //头视图
        tableView.tableHeaderView = adView
        //组的头视图高度
        tableView.sectionHeaderHeight = 35
        
        //注册自定义侧cell(除去新秀推荐)
        tableView.registerClassOf(DrecommendCateCell)
        
        //配置广告数据源
        prepareAdData()
        //配置新人推荐的资源
        prepareNewPeopleData()
         //配置分类推荐的数据
        prepareCategoryData()
        
    }
    
    //配置广告数据源
    func prepareAdData(){
        
        //POST 的请求方式
        let urlString = kRecommendAdUrl
        
        let paramtes = ["aid": "ios", "auth": "97d9e4d3e9dfab80321d11df5777a107", "client_sys": "ios", "time" : nowTimeString]
        
        //print(nowTimeString)
        let downloader = MyDownloader()
        downloader.type = .Advertisement  //广告类型
        
        downloader.delegate = self
        
        downloader.downloadWithUrlString(urlString, methodOfRequest: MyRequestMethod.MyPost, parameterDict: paramtes)
        
    }
    
    //配置新人推荐的资源
    func prepareNewPeopleData(){
        
        // GET 的请求方式
        let urlString = String(format: "%@%@", kRecommendNewUrl, nowTimeString)
        //print(urlString,"新人接口")
        
        let downloader = MyDownloader()
        downloader.type = .NewPeople  //新秀类型
        
        downloader.delegate = self
        
        downloader.downloadWithUrlString(urlString, methodOfRequest: MyRequestMethod.MyGet, parameterDict: nil)
        
        
    }
    //配置分类推荐的数据
    func prepareCategoryData(){
        
        // GET 的请求方式
        let urlString = String(format: "%@%@", kRecommendCateUrl, nowTimeString)
        
        let downloader = MyDownloader()
        downloader.type = .Category  //新秀类型
        
        downloader.delegate = self
        
        downloader.downloadWithUrlString(urlString, methodOfRequest: MyRequestMethod.MyGet, parameterDict: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

//MARK: 下载数据代理
extension DRecommendViewController: MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWithError error: NSError) {
        
        
        
    }
    
    //下载成功
    func downloader(downloader: MyDownloader, didFinishWithData data: AnyObject) {
        
        if downloader.type == DownloadType.Advertisement{
        
            //解析广告数据  // 此处解析到需要的那层模型,不用在模型中全部层层写出
            let dict = JSON(data).dictionaryObject
            let array = dict!["data"] as! Array<Dictionary<String, AnyObject>>
            
            for d in array{
                let model = DRecommedAdModel()
                model.modelSetWithJSON(d) //代替KVC,不需要重写key找不到的方法
                //将图片和文字添加进数组
                adImageArray.addObject(model.pic_url!)   //和kvc一样需要将key 和 解析数据中的key 相同
                adTitleArray.addObject(model.title!)
                
            }
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in

                //给广告滚动视图赋值
                self.adView?.imageURLStringsGroup = self.adImageArray as [AnyObject]
                self.adView?.titlesGroup = self.adTitleArray as [AnyObject]
                
                self.tableView.reloadData()
                
            }
            
        }else if downloader.type == DownloadType.NewPeople{
            
            //新秀解析数据  // 此处解析到需要的那层模型,不用在模型中全部层层写出
            let dict = JSON(data).dictionaryObject
            let array = dict!["data"] as! Array<Dictionary<String, AnyObject>>
            
            for d in array{
                
                let model = DNewPeopleModel()
                model.modelSetWithJSON(d) //代替KVC,不需要重写key找不到的方法
                //将图片和文字添加进数组
                newPeopleArray.append(model)
                
            }
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                
                self.tableView.reloadData()
                
            }
            
        }else if downloader.type == DownloadType.Category{  //分类推荐的解析
            
            //使用YYmodel中方法,会自身模型赋值,这样给外层模型赋值,不需要打开内层循环赋值,也不需要使用SwiftyJSON
            self.cateModel = DCategoryModel.modelWithJSON(data)
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
    
    
    
}

//MARK: 表格视图代理

extension DRecommendViewController{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if cateModel != nil{
            
          return cateModel.data!.count+1
        }
        
        return 0
    }
    
    //每组的行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
        
    }
    
    //每组的头视图
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{  //新秀组
            
            //头视图是xib拖拽出来的,不能使用普通的方法创建(会崩溃),需要使用下面的方法
            let headSectionView = NSBundle.mainBundle().loadNibNamed("DRecommendSectionHead", owner: nil, options: nil).last as! DRecommendSectionHead

            headSectionView.titleLabel!.text = "新秀推荐"
            headSectionView.moreLabel.hidden = true //隐藏更多的视图 和 label
            headSectionView.moreView.hidden = true
            
            return headSectionView
            
        }else{
            
            let headSectionView = NSBundle.mainBundle().loadNibNamed("DRecommendSectionHead", owner: nil, options: nil).last as! DRecommendSectionHead
            
            headSectionView.titleLabel.text = cateModel.data![section-1].title
            
            return headSectionView
            
        }
        

    }
    
    //cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0{  //新秀的cell
        
            return 150
            
        }else{
            
            return kScreenWidth
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 && indexPath.row == 0{
            
            //注册新秀的cell
            tableView.registerClassOf(DRecommendNewCell)
            
            let cell: DRecommendNewCell = tableView.dequeueReusableCell()
            
            cell.configCell(newPeopleArray)
            
            return cell
            
        }else {
            
            //自定一个cell,内部包含集合视图(主要内容配置于集合视图的cell,所以此处传值)
            let cell: DrecommendCateCell = tableView.dequeueReusableCell()
            
            //传值
            cell.dataArray = cateModel.data![indexPath.section-1].roomlist!
            
            
            return cell
        }
        
    }
    
    //选中
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //反选
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
}

