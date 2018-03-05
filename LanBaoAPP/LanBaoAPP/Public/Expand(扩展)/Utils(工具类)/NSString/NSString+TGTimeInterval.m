//
//  NSString+TGTimeInterval.m
//  TGParent
//
//  Created by wenweijia on 2017/7/13.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import "NSString+TGTimeInterval.h"

@implementation NSString (TGTimeInterval)

+ (NSString *)timeWithTimeIntervalNumber:(NSNumber *)timeNumber
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    return [self timeWithTimeIntervalNumber:timeNumber DateFormat:formatter];
}

+ (NSString *)timeWithTimeIntervalNumber:(NSNumber *)timeNumber DateFormat:(NSDateFormatter *)formatter
{
    // 格式化时间
    NSDate* date = [self timeDateWithTimeIntervalNumber:timeNumber DateFormat:formatter];
    
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSDate *)timeDateWithTimeIntervalNumber:(NSNumber *)timeNumber
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
   return [self timeDateWithTimeIntervalNumber:timeNumber DateFormat:formatter];
}

+ (NSDate *)timeDateWithTimeIntervalNumber:(NSNumber *)timeNumber DateFormat:(NSDateFormatter *)formatter
{
    // 格式化时间
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:[NSString stringWithFormat:@"%@",formatter]];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeNumber doubleValue]/ 1000.0];
    
    return date;
}

+ (NSDate *)timeSystemDateWithTimeIntervalNumber:(NSNumber *)timeNumber
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:zone];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:[NSString stringWithFormat:@"%@",formatter]];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeNumber doubleValue]/ 1000.0];
    
    //这里处理8个小时时间差问题
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate * nowDate = [date dateByAddingTimeInterval:interval];
    return nowDate;
}

@end
