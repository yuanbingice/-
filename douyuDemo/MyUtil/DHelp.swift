//
//  CSHelp.swift
//  CodeShare
//
//  Created by ice on 2016/10/13.
//  Copyright © 2016年 k. All rights reserved.
//

import Foundation
import UIKit


extension NSString{
    
    /**
     *  获取前时间的函数
     */
    class func getNowTimeOfString() -> NSString{
        
        let date = NSDate()
        
        let timeInterval = date.timeIntervalSince1970
        
        let timeString = NSString(format: "%.0f", timeInterval)
        
        return timeString
        
    }
    
}


extension UIColor{
    
    /**随机颜色*/
    class func randomColor() -> UIColor {
        
        let r = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        let g = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        let b = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /**
     橘红色的固定颜色
     */
    class func myColor() -> UIColor{
        
        let r = CGFloat(244.0) / 255.0
        let g = CGFloat(89.0) / 255.0
        let b = CGFloat(27.0) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
}



    