//
//  NSString+TGInsertFChar.h
//  TGVendor
//
//  Created by wenweijia on 2017/11/18.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TGInsertFChar)
/**
    默认添加E字符  e+userId
*/
+ (NSString*)InsertFirstCharacterWithUserId:(NSNumber *)userId;
/**
    拼接字符到userid前面
 */
+ (NSString*)InsertFirstCharacter:(NSString*)character withUserId:(NSNumber *)userId;

@end
