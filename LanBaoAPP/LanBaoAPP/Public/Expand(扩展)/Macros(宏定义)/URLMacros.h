//
//  URLMacros.h
//  BSEM
//
//  Created by 逸信Mac on 16/2/29.
//  Copyright © 2016年 逸信Mac. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h
#ifdef DEBUG
#define BsemURL_PREFIX  @"http://jyfam88.jobpp.cn"//内网
#else
#define BsemURL_PREFIX  @"https://jyfam.jobpp.cn:50090"//外网
#endif
#define HTTP(x) [BsemURL_PREFIX stringByAppendingString:x]

#pragma mark - 登录注册
//登录
#define kloginHTTP   HTTP(@"/user/logindo")
//app检查更新
#define kcheckUpDate HTTP(@"/app/versionJson/getVersionIos")
#endif /* URLMacros_h */



