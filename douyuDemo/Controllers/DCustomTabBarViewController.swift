//
//  DCustomTabBarViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/14.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//自定义的标签栏控制器

class DCustomTabBarViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //配置标签栏内的导航器
        configureViewController()
        
        
    }
    
    //配置标签栏内的导航器
    func configureViewController(){
        
        let vcInfos = [
            
            ["title": "推荐", "image": "btn_home_normal", "class": "douyuDemo.DRecommendViewController"],
            ["title": "栏目", "image": "btn_column_normal", "class": "douyuDemo.DcolumnViewController"],
            ["title": "直播", "image": "btn_live_normal", "class": "douyuDemo.DLiveListViewController"],
            ["title": "我的", "image": "btn_user_normal", "class": "douyuDemo.DMyViewController"]
            
        ]
        
        var vcArr: [UINavigationController] = []
        
        for vcInfo in vcInfos{
            
            // swift 中，通过字符串获取一个类，需要在类名前加上工程名，还需要将类强转一下
            let vc = (NSClassFromString(vcInfo["class"]!) as! UIViewController.Type).init()
            
            vc.title = vcInfo["title"]
            
            let navVC = UINavigationController(rootViewController: vc)
            
            vcArr.append(navVC)
            
        }
        
        self.viewControllers = vcArr
        
        //设置 tabBar 按钮图片  //遍历标签栏中管理的项目
        var i = 0
        for tabBarItem in self.tabBar.items!{
            
            tabBarItem.image = UIImage(named: vcInfos[i]["image"]!)
            //选中的照片
            tabBarItem.selectedImage = UIImage(named: vcInfos[i]["selectionImage"]!)
            
            i += 1
        }
        
        //设置选中状态下tabBar的颜色  //self.tabBar.barTintColor-> 设置标签栏的背景色
        self.tabBar.tintColor = UIColor.myColor()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
