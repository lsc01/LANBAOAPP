//
//  WLDeviceStateInfo.h
//  TGParent
//
//  Created by 倪望龙 on 2017/8/23.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLDeviceStateInfo : NSObject
/**
 *  WiFi开关是否打开
 *
 *  @return 状态
 */
+ (BOOL)isWiFiEnabled;
@end
