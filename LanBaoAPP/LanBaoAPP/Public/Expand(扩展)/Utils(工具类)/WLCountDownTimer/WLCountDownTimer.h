//
//  WLCountDownTimer.h
//  TGVendor
//
//  Created by 倪望龙 on 2017/7/5.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol WLCountDownTimerDelegate<NSObject>
-(void)WLCountDownTimeDidBegin;
-(void)WLCountDownTimeDidChange:(NSUInteger)count;
-(void)WLCountDownTimeDidComplete;
@end

@interface WLCountDownTimer : NSObject
@property(nonatomic,assign)NSUInteger count;

@property(nonatomic,weak)id <WLCountDownTimerDelegate>delegate;

-(void)start;
-(void)stop;
@end
