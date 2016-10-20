//
//  Const.swift
//  IpaDown_SWift
//
//  Created by 16/01/01
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit


//
//  Const.h
//  TestIpaDown
//
//  Created by gaokunpeng on 15/8/2.
//  Copyright (c) 2015年 gaokunpeng. All rights reserved.
//

//屏幕的简单适配
//获取屏幕的宽度
public let kScreenWidth = UIScreen.mainScreen().bounds.size.width
//获取屏幕的高度
public let kScreenHeight = UIScreen.mainScreen().bounds.size.height

//当前时间的字符串
public let nowTimeString = NSString.getNowTimeOfString() as String




//一...推荐页面
//1、广告
public let kRecommendAdUrl = "http://www.douyutv.com/api/v1/slide/6"

//2、新人推荐 //需要当前时间
public let kRecommendNewUrl = "http://www.douyutv.com/api/v1/home_newbie_list?aid=ios&auth=3c0837ba99e8506db591b7971dfb20c2&client_sys=ios&time="
//3. 头像的域名
public let kHeadImageUrl = "http://uc.douyutv.com/upload/avatar"
public let kHeadImageUrlAppend = "_avatar_big.jpg?upt="

//4. 分类推荐
public let kRecommendCateUrl = "http://www.douyutv.com/api/v1/channel?aid=ios&auth=6a4c6b01d851ceece76aee1980b9e5bb&client_sys=ios&limit=4&time="


//二...栏目页面
public let kColumnUrl = "http://www.douyutv.com/api/v1/game?aid=ios&auth=3f252c3294b31a61fbdd890a45609549&client_sys=ios&time="


//三...直播列表页面

//public let kLiveListUrl = "http://www.douyutv.com/api/v1/live?aid=ios&auth=b317487532542c2f8200f374f3153da2&client_sys=ios&limit=20&offset=%d&time=%@"
public let kLiveListUrl = "http://capi.douyucdn.cn/api/v1/live?limit=20&offset=%d"










