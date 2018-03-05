//
//  LBFirstViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/5.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBFirstViewController.h"
#import "LBLoginViewController.h"
#import "LBRegistPasswordVC.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface LBFirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnRegist;
@property (weak, nonatomic) IBOutlet UIButton *btnWechat;
@property (weak, nonatomic) IBOutlet UIButton *btnQQ;
@property (weak, nonatomic) IBOutlet UIButton *btnWeibo;


@end

@implementation LBFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fd_prefersNavigationBarHidden = YES;
    
    [self setUI];
    
}


-(void)setUI{

    self.btnLogin.clipsToBounds = YES;
    self.btnLogin.layer.cornerRadius = 10;
    [self.btnLogin setBackgroundColor:kAPPBaseColor forState:UIControlStateNormal];
    
    [self.btnRegist setTitleColor:kAPPBaseColor forState:UIControlStateNormal];
}

- (IBAction)loginClick:(UIButton *)sender {
    LBLoginViewController * loginVC = [LBLoginViewController new];
    [self.navigationController pushViewController:loginVC animated:YES];
}
- (IBAction)registerClick:(UIButton *)sender {
    LBRegistPasswordVC * registVC = [[LBRegistPasswordVC alloc] init];
    [self.navigationController pushViewController:registVC animated:YES];
}
- (IBAction)wechatLoginClick:(id)sender {
}
- (IBAction)QQLoginClick:(UIButton *)sender {
}
- (IBAction)weiboLoginClick:(UIButton *)sender {
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
