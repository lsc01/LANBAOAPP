//
//  ThirdMacros.h
//  MobileProject 第三方SDK的Key及配置
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#ifndef ThirdMacros_h
#define ThirdMacros_h

#pragma mark - 开发环境
//(注释为测试环境，打开为上架环境)
//#define kAppStore

//百度地图SDK的Key
#define  kBaiduMapKey @"7CyGoIDnP7nHCUGwOG29WkyM414xlo1j"

//ShareSDK的key
#define ShareSDKKey @"1fe9285cb32e4"

//腾讯地图
#define  kTencentMapKey @"ZMRBZ-WFD2S-A2WO2-66CZJ-H6CYF-WJB5U"

//科大讯飞的key
#define IFlyAPPID  @"59886425"

//莹石云key
#define kEZAPPKey @"dc3912c5a7b247fb98feeba7bc3661ae"
#define kEZAPPSecret @"109cbb18b05e10dba5fd26de05174693"

//ping++
#define pinppUrlScheme  @"wxtgvendor"
//#define pinppUrlScheme  @"wx045d467538992713"

//BUGHD Key
#define BugHdKey  @"7630a4780ef7f7942489f3258dc47cd1"

#pragma mark - 腾讯云
#ifndef kAppStore
#define SDK_APPID @"1400044856"// 测试appid
#else
#define SDK_APPID @"1400048407"// 外网appid
#endif

#define SDK_ACCOUNTTYPE @"18203"//accountType 以上两个在腾讯云配置的时候拿到

//--微信支付key
#define kWXPayKey @"wxc46e3b14b6eed27e"

//ShareSDK
//--微信
#define kSocial_WX_ID @"wx045d467538992713"
#define kSocial_WX_Secret @"29aa1a9a4e44e5094efe0e3949b0e7c4"
//--QQ
#define kSocial_QQ_ID  @"1106328606"
#define kSocial_QQ_Secret @"QPc2zVqfzyn7p1w2"
//--新浪微博
#define kSocial_Sina_ID @"2076983498" //个人的，审核已通过
#define kSocial_Sina_Secret @"3b500b1b5863b563aba6125dc3541eb9"

#define kSocial_Sina_Account @"3921700956"
#define kSocial_Sina_RedirectURL @"https://api.weibo.com/jintuoguanbusiness.html"

#endif /* ThirdMacros_h */
