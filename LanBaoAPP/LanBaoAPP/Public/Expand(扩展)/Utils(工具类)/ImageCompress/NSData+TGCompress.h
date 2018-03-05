//
//  NSData+TGCompress.h
//  TGVendor
//
//  Created by wenweijia on 2017/7/22.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (TGCompress)
/**
 *  图片压缩
 *
 *  @param image     要被压缩的图片
 *  @param maxLength 目标大小
 *
 *  @return 最终图片data
 */
+ (NSData *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;
@end
