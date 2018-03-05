//
//  NSDictionary+TGGetURLParameters.h
//  TGParent
//
//  Created by wenweijia on 2017/8/7.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TGGetURLParameters)

/**
 *  截取URL中的参数
 *
 *  @return NSMutableDictionary parameters
 */
+ (NSMutableDictionary *)getURLParameters:(NSString *)urlStr;
@end
