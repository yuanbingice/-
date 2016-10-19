//
//  DcolumnModel.swift
//  douyuDemo
//
//  Created by ice on 2016/10/19.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//栏目模型
class DcolumnModel: NSObject {

    var data: [DcolumnDataModel]?
    
    var error: NSNumber?
    
    
    //利用YYModel中的方法,让得出的 "videoList"的值转化为 CSVideoModel模型 (因为开始读取videoList得到值会是 字典或数组 类型)
    class func modelContainerPropertyGenericClass() -> [String: AnyObject]?{
        
        return ["data": DcolumnDataModel.self]
    }
}

//data 内的模型
class DcolumnDataModel: NSObject{
    
    var cate_id: String?
    var game_icon: String?
    var game_name: String?
    
    var game_src: String?
    var game_url: String?
    var online_rooma: String?
    
    var online_room_ios: String?
    var short_name: String?
    
    
}
