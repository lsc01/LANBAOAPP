//
//  LBConnectionBoxViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/20.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBConnectionBoxViewController.h"
#import "LBConnectBoxView1.h"
#import "LBSelectWLANView.h"
#import "LBConnectBoxFinishView.h"
@interface LBConnectionBoxViewController ()<LBConnectBoxViewDelegate,LBSelectWLANViewDelegate,LBConnectBoxFinishViewDelegate>
@property (nonatomic ,strong) UIButton * buttonClose;

@property (nonatomic ,strong) LBConnectBoxView1 * viewConnectBox1;
@property (nonatomic ,strong) LBSelectWLANView * viewSelectWLAN;
@property (nonatomic ,strong) LBConnectBoxView1 * viewConnectBox2;
@property (nonatomic ,strong) LBConnectBoxFinishView * viewConnectBoxFinish;

@end

@implementation LBConnectionBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = kAPPBaseColor;
    [self setUI];
    
}

-(void)setUI{
    self.buttonClose =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonClose setBackgroundImage:[UIImage imageNamed:@"kind_down_close"] forState:UIControlStateNormal];
    [self.buttonClose addTarget:self action:@selector(closebtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonClose];
    
    [self.buttonClose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(15);
        make.height.width.mas_equalTo(25);
        make.top.mas_equalTo(self.view).offset(isIPhoneX?54:30);
    }];
    
    [self.view addSubview:self.viewConnectBox1];
    [self.viewConnectBox1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.buttonClose.mas_bottom).offset(5);
        
    }];
    
}


-(void)gotoNextViewWithConnectBoxView:(LBConnectBoxView1 *)view{
    [view removeFromSuperview];
    if (view == self.viewConnectBox1) {
        
        [self.view addSubview:self.viewSelectWLAN];
        [self.viewSelectWLAN mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(self.buttonClose.mas_bottom).offset(5);
        }];
    }else{
        
        [self.view addSubview:self.viewConnectBoxFinish];
        [self.viewConnectBoxFinish mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(self.buttonClose.mas_bottom).offset(5);
        }];
    }
    
}
-(void)gotoNextViewWithSelectWLANView{
    [self.viewSelectWLAN removeFromSuperview];
    [self.view addSubview:self.viewConnectBox2];
    [self.viewConnectBox2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.buttonClose.mas_bottom).offset(5);
    }];
}
-(void)gotoNextViewWithConnectBoxFinishView{
    [self.viewConnectBoxFinish removeFromSuperview];
    [self closebtnClick:nil];
}


-(LBConnectBoxView1 *)viewConnectBox1{
    if (_viewConnectBox1 == nil) {
        _viewConnectBox1 = [[NSBundle mainBundle] loadNibNamed:@"LBConnectBoxView1" owner:nil options:nil].firstObject;
        _viewConnectBox1.delegate = self;
        _viewConnectBox1.labelTitle.text = @"连接主箱";
        _viewConnectBox1.labelDesc.text = @"连接新的设备。。。";
        _viewConnectBox1.imageViewWifi.backgroundColor = [UIColor grayColor];
    }
    return _viewConnectBox1;
}

-(LBConnectBoxView1 *)viewConnectBox2{
    if (_viewConnectBox2 == nil) {
        _viewConnectBox2 = [[NSBundle mainBundle] loadNibNamed:@"LBConnectBoxView1" owner:nil options:nil].firstObject;
        _viewConnectBox2.delegate = self;
        _viewConnectBox2.labelTitle.text = @"主箱联网中";
        _viewConnectBox2.labelDesc.text = @"此过程大约需要30s~60s";
        _viewConnectBox2.imageViewWifi.backgroundColor = [UIColor grayColor];
    }
    return _viewConnectBox2;
}

-(LBSelectWLANView *)viewSelectWLAN{
    if (_viewSelectWLAN == nil) {
        _viewSelectWLAN = [[NSBundle mainBundle] loadNibNamed:@"LBSelectWLANView" owner:nil options:nil].firstObject;
        _viewSelectWLAN.delegate = self;
    }
    return _viewSelectWLAN;
}

-(LBConnectBoxFinishView *)viewConnectBoxFinish{
    if (_viewConnectBoxFinish == nil) {
        _viewConnectBoxFinish = [[NSBundle mainBundle] loadNibNamed:@"LBConnectBoxFinishView" owner:nil options:nil].firstObject;
        _viewConnectBoxFinish.delegate = self;
    }
    return _viewConnectBoxFinish;
}


- (void)closebtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)dealloc{
    NSLog(@"消失");
}

@end
