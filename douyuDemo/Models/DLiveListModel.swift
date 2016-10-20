//
//  DLiveListModel.swift
//  douyuDemo
//
//  Created by ice on 2016/10/20.
//  Copyright © 2016年 k. All rights reserved.
//

import UIKit

//直播列表
class DLiveListModel: NSObject {
    
    var data: [DLiveListDataModel]?
    
    var error: NSNumber?
    
    //利用YYModel中的方法,让得出的 "videoList"的值转化为 DLiveListDataModel模型 (因为开始读取videoList得到值会是 字典或数组 类型)
    class func modelContainerPropertyGenericClass() -> [String: AnyObject]?{
        
        return ["data": DLiveListDataModel.self]
    }
    
}

class DLiveListDataModel: NSObject{
    
    var anchor_city: String?
    var avatar: String?
    var avatar_mid: String?
    
    var avatar_small: String?
    var cate_id: String?
    var child_id: String?
    
    var fans: String?
    var game_name: String?
    var game_url: String?
    
    var isVertical: NSNumber?
    var jumpUrl: String?
    var nickname: String?
    
    var online: NSNumber?
    var owner_uid: String?
    var ranktype: NSNumber?
    
    var room_id: String?
    var room_name: String?
    var room_src: String?
    
    
    var show_status: NSNumber?
    var show_time: String?
    var specific_catalog: String?
    
    var specific_status: NSNumber?
    var subject: String?
    var url: NSNumber?
    
    var vertical_src: String?
    var vod_quality: String?

    
}

