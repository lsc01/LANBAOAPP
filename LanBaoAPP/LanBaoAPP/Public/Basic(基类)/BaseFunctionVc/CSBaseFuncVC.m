//
//  baseDznViewController.m
//  EmptySetDemo_Third
//
//  Created by 倪望龙 on 2017/6/23.
//  Copyright © 2017年 xunyijia. All rights reserved.
//

#import "CSBaseFuncVC.h"
typedef NS_ENUM(NSUInteger, BDRequestErrorType) {
    netNotConnect,//无网络连接
    netTimeOut,//网络阻塞
    otherError,//其他错误
};
@interface CSBaseFuncVC ()
@property(nonatomic,assign)BDRequestErrorType errorType;//错误类型
@property(nonatomic,strong)UIView *loadingView;
@property(nonatomic,strong)UIImageView *gifImageView;
@end

@implementation CSBaseFuncVC

-(UIImageView *)gifImageView{
    if(_gifImageView == nil){
        NSArray *magesArray = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"loading1.png"],
                               [UIImage imageNamed:@"loading2.png"],
                               [UIImage imageNamed:@"loading3.png"],
                               [UIImage imageNamed:@"loading4.png"],
                               [UIImage imageNamed:@"loading5.png"],
                               [UIImage imageNamed:@"loading6.png"],
                               [UIImage imageNamed:@"loading7.png"],
                               [UIImage imageNamed:@"loading8.png"],
                               [UIImage imageNamed:@"loading9.png"],
                               nil];
        _gifImageView = [UIImageView new];
        _gifImageView.animationImages = magesArray;
        _gifImageView.animationDuration = 0.6;
        _gifImageView.animationRepeatCount = 0;
        [_gifImageView startAnimating];
    }
    return _gifImageView;
}

-(UIView *)loadingView{
    if(_loadingView == nil){
        _loadingView = [UIView new];
    }
    return _loadingView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        [self BDDataInit];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kAPPBaseBackGroudColor;
    [self BDSetUpSubviews];
    // Do any additional setup after loading the view.
}

#pragma mark - 数据初始化
-(void)BDDataInit{
   _emptyDesc = @"暂无内容";
}

#pragma mark - 子视图
-(void)BDSetUpSubviews{
    [self.loadingView addSubview:self.gifImageView];
    [_gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(_loadingView);
        make.size.mas_equalTo(CGSizeMake(50.0f, 50.0f));
    }];
    
}

#pragma mark - EmptyViewDataSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    switch (self.emptyType) {
        case requestComplete:{
            return [UIImage imageNamed:@"emptyNothing"];
        }
            break;
        case requestError:{
            if(self.errorType == netNotConnect){//无网络连接
                return [UIImage imageNamed:@"emptyNoNet"];
            }else{//其他错误
                return [UIImage imageNamed:@"emptyError"];
            }
        }
            break;
        default:{
            return [UIImage imageNamed:@"emptyError"];
        }
            break;
    }
    
}

-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    
    NSString *text;
    switch (self.emptyType) {
        case requestComplete:{
            text = _emptyDesc;
        }
            break;
        case requestError:{
            text = _errorDesc;
        }break;
        default:{
            text = @"";
        }break;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:13.0f],
                                 NSForegroundColorAttributeName:HEXCOLOR(0xcccccc)};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
//{
//    NSString *text = _emptyDesc;
//    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
//    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//    paragraph.alignment = NSTextAlignmentCenter;
//
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
//                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
//                                 NSParagraphStyleAttributeName: paragraph};
//
//    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}


-(CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -64.0f;
}

#pragma mark - 自定义空白页
-(UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView{
    if(self.emptyType == loading){
        self.loadingView.frame = scrollView.frame;
        return self.loadingView;
    }else{
        return nil;
    }
}


#pragma mark - DZNEmptyDataSetDelegate

-(BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    if(_emptyType == hidden){
    
        return NO;
        
    }

    return YES;
}

#pragma mark - 网络请求错误函数
-(NSString *)errorTipHandleWithCode:(long)errorCode{
    self.emptyType = requestError;
    switch (errorCode) {
        case NSURLErrorNotConnectedToInternet:{//无网络连接
            self.errorType = netNotConnect;
            _errorDesc = @"请检查网络是否连接正常";
        }break;
        case NSURLErrorTimedOut:{//网络超时
            self.errorType = netTimeOut;
            _errorDesc = @"网络连接超时";
        }break;
        default:{
            self.errorType = otherError;
            _errorDesc = @"网络繁忙，请稍候再试";
        }break;
    }
    return _errorDesc;
}

-(void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    _didTapEmptyViewBlock ? _didTapEmptyViewBlock():nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
