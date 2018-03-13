//
//  LBSongKindInfoModel.h
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/13.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBSongKindInfoModel : NSObject

@property (nonatomic,copy) NSString * songName;

@property (nonatomic,copy) NSString * singerName;

@property (nonatomic,copy) NSString * imageHeadUrlStr;

@property (nonatomic ,assign) BOOL islikely;//是否喜欢

@property (nonatomic ,assign) BOOL isShowInfo;//显示更多cell的高度未60 否则为50

@end
