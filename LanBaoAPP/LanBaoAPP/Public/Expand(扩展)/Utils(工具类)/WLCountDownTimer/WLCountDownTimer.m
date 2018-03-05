//
//  WLCountDownTimer.m
//  TGVendor
//
//  Created by 倪望龙 on 2017/7/5.
//  Copyright © 2017年 jzg. All rights reserved.
//

#import "WLCountDownTimer.h"
@interface WLCountDownTimer()
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation WLCountDownTimer
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

-(NSTimer *)timer{
    if(_timer == nil){
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    }
    return _timer;
}

-(void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)setCount:(NSUInteger)count{
    [self stop];
    _count = count;
    [self.delegate respondsToSelector:@selector(WLCountDownTimeDidBegin)] ? [self.delegate WLCountDownTimeDidBegin] : nil;
}

#pragma mark - 开始
-(void)start{
    [self.timer setFireDate:[NSDate distantPast]];
    [self.delegate respondsToSelector:@selector(WLCountDownTimeDidBegin)] ? [self.delegate WLCountDownTimeDidBegin] : nil;
}

#pragma mark - 停止
-(void)stop{
    [self.timer setFireDate:[NSDate distantFuture]];
}

#pragma mark - 减数计数器
-(void)countDown{
    if(_count > 0){
        [self.delegate respondsToSelector:@selector(WLCountDownTimeDidChange:)] ? [self.delegate WLCountDownTimeDidChange:_count] : nil;
        _count --;
    }else{//计时完成
        [self stop];
        [self.delegate respondsToSelector:@selector(WLCountDownTimeDidComplete)] ? [self.delegate WLCountDownTimeDidComplete]:nil;
    }
}
@end
