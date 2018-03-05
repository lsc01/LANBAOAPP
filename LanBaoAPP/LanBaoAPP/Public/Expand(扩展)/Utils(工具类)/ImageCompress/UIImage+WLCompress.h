//
//  UIImage+WLCompress.h
//  JYParent
//
//  Created by 倪望龙 on 2017/12/16.
//  Copyright © 2017年 互动家园. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WLCompress)
-(NSData *)compressWithLengthLimit:(NSUInteger)maxLength;
@end
