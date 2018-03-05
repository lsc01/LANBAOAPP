//
//  NSString+TGtimeStampSwitch.h
//  TGVendor
//
//  Created by wenweijia on 2017/7/26.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TGtimeStampSwitch)

+(NSString *)timestampSwitchTime:(double)timestamp andFormatter:(NSString *)format;
@end
