//
//  NSString+TGTimeInterval.h
//  TGParent
//
//  Created by wenweijia on 2017/7/13.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TGTimeInterval)
//时间戳转字符串（默认：yyyy年MM月DD日 HH:mm ）
+ (NSString *)timeWithTimeIntervalNumber:(NSNumber *)timeNumber;

//时间戳转字符串
+ (NSString *)timeWithTimeIntervalNumber:(NSNumber *)timeNumber DateFormat:(NSDateFormatter *)formatter;

//时间戳转日期（默认：yyyy年MM月DD日 HH:mm ）
+ (NSDate *)timeDateWithTimeIntervalNumber:(NSNumber *)timeNumber;

//时间戳转日期
+ (NSDate *)timeDateWithTimeIntervalNumber:(NSNumber *)timeNumber DateFormat:(NSDateFormatter *)formatter;

//时间戳转日期（默认：yyyy年MM月DD日 HH:mm ）(时区改变)
+ (NSDate *)timeSystemDateWithTimeIntervalNumber:(NSNumber *)timeNumber;

@end
