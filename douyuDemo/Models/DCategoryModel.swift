//
//  DCategoryModel.swift
//  douyuDemo
//
//  Created by ice on 2016/10/19.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit


//利用yymodel中的方法给模型赋值,所以层层将模型写出来
class DCategoryModel: NSObject {

    var data: [DCategoryData]?
    var error: NSNumber?
    
    //利用YYModel中的方法,让得出的 "videoList"的值转化为 CSVideoModel模型 (因为开始读取videoList得到值会是 字典或数组 类型)
    class func modelContainerPropertyGenericClass() -> [String: AnyObject]?{
        
        return ["data": DCategoryData.self]
    }
    
}

//data内部单个模型
class DCategoryData: NSObject {
    
    var cate_id: String?
    var title: String?
    var roomlist: [DCateRoomListModel]?
    
    class func modelContainerPropertyGenericClass() -> [String: AnyObject]?{
        
        return ["roomlist": DCateRoomListModel.self]
    }
}

//ROOMlist 内部的单个模型
class DCateRoomListModel: NSObject {
    
    var cate_id: String?
    var child_id: String?
    var game_name: String?
    
    var game_url: String?
    var nickname: String?
    var online: NSNumber?
    
    var owner_uid: String?
    var room_id: String?
    var room_name: String?
    
    var room_src: String?
    var show_status: String?
    var show_time: String?
    
    var specific_catalog: String?
    var specific_status: String?
    var subject: String?
    
    var url: String?
    var vod_quality: String?
    
}

