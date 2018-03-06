//
//  LBQuestionModel.h
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/6.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBQuestionModel : NSObject

@property (nonatomic ,assign ,getter=isSelectState) BOOL selectState;

@property (nonatomic, copy) NSString * stringTitle;

@property (nonatomic ,copy) NSString * strContent;
@end
