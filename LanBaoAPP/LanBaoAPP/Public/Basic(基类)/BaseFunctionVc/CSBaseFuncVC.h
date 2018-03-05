//
//  CSBaseFuncVc.h
//  ComplainSYS
//
//  Created by 逸信Mac on 16/6/6.
//  Copyright © 2016年 逸信Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

typedef NS_ENUM(NSUInteger, BDEmptyType) {
    loading = 0,//加载动画
    requestComplete,//加载完成(空白页)
    requestError,//错误页
    hidden,//隐藏
};
typedef void(^BDdidTapEmptyView)(void);
@interface CSBaseFuncVC : UIViewController <DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property(nonatomic,assign)BDEmptyType emptyType;//空白页类型
@property(nonatomic,copy)NSString *emptyDesc;//空白描述
@property(nonatomic,copy)NSString *errorDesc;//错误描述

@property(nonatomic,copy)BDdidTapEmptyView didTapEmptyViewBlock;

-(void)setDidTapEmptyViewBlock:(BDdidTapEmptyView)didTapEmptyViewBlock;

-(NSString *)errorTipHandleWithCode:(long)errorCode;

@end
