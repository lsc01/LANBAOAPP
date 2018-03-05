//
//  AppInfoMacros.h
//  BSEM
//
//  Created by 逸信Mac on 16/3/14.
//  Copyright © 2016年 逸信Mac. All rights reserved.
//

#ifndef AppInfoMacros_h
#define AppInfoMacros_h

#pragma mark - 地图
//缩放等级
#define kMapZoomLevel 18.0f
//地图中心点
#define kMapCenterCoor CLLocationCoordinate2DMake(23.135309,113.269043)

#pragma mark - 注册

//支付渠道类型
typedef enum : NSUInteger {
    alipayChannel = 15,//支付宝
    wxChannel = 26,//微信
} TGPayMethodType;

typedef enum : NSUInteger {
    walletPay = 1,//钱包
    wallet_channel_pay = 2,//钱包+渠道
    channelPay = 3,//渠道
} TGPayGroupType;

#endif /* AppInfoMacros_h */
