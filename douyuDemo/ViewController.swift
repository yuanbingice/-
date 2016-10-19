//
//  ViewController.swift
//  douyuDemo
//
//  Created by ice on 2016/10/14.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//基类视图控制器, 子类都会继承下面方法,但是就看自身是否调用

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //子类视图全部继承的
        self.view.backgroundColor = UIColor.randomColor()
        
        self.navigationController!.navigationBar.barTintColor = UIColor.myColor()
        
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    /**
     标题
     */
    func addNavTitle(title: String) {
        
        let label = UILabel.createLabelFrame(CGRectMake(0, 0, 215, 44), title: title, textAlignment: .Center)
        label.font = UIFont.boldSystemFontOfSize(24)
        //58  95  145
        label.textColor = UIColor(red: 58.0/255.0, green: 95.0/255.0, blue: 145.0/255.0, alpha: 1.0)
        navigationItem.titleView = label
    }
    
    
    /**
     导航上按钮
     @param isLeft: 导航按钮在左边还是右边
     */
    func addNavButton(title: String, target: AnyObject?, action: Selector, isLeft: Bool) {
        
        addNavButton(title, target: target, action: action, isLeft: isLeft, imageName: "buttonbar_action")
        
    }
    
    private func addNavButton(title: String, target: AnyObject?, action: Selector, isLeft: Bool, imageName: String) {
        
        let btn = UIButton.createBtn(CGRectMake(0, 0, 25, 25), title: title, bgImageName: imageName, target: target, action: action)
        let barButton = UIBarButtonItem(customView: btn)
        if isLeft {
            //左边
            navigationItem.leftBarButtonItem = barButton
            
        }else{
            //右边
            navigationItem.rightBarButtonItem = barButton
        }
        
        
    }
    
    /**
     返回按钮
     */
    func addBackButton() {
        
        addNavButton("", target: self, action: #selector(backAction), isLeft: true, imageName: "btn_nav_back")
    }
    
    func backAction() {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

