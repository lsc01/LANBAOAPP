//
//  NSString+TGInsertFChar.m
//  TGVendor
//
//  Created by wenweijia on 2017/11/18.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import "NSString+TGInsertFChar.h"

@implementation NSString (TGInsertFChar)
+ (NSString*)InsertFirstCharacterWithUserId:(NSNumber *)userId
{
   return [NSString InsertFirstCharacter:@"e" withUserId:userId];
}

+ (NSString*)InsertFirstCharacter:(NSString*)character withUserId:(NSNumber *)userId
{
    return [NSString stringWithFormat:@"%@%@",character,userId];
}
@end
