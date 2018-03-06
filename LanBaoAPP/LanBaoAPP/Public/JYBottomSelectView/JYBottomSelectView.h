//
//  JYBottomSelectView.h
//  JYParent
//
//  Created by lsc on 2017/12/9.
//  Copyright © 2017年 互动家园. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^JYBottomSelectViewCancelClick)(void);
typedef void(^JYBottomSelectViewDidSelectIdx)(NSUInteger idx);
@interface JYBottomSelectView : UIView

-(instancetype)initDataArray:(NSArray <NSString *>*)arrData CancelClickBlock:(JYBottomSelectViewCancelClick)cancelClickBlock DidSelectIdxBlock:(JYBottomSelectViewDidSelectIdx)didSelectIdxBlock;

@end
