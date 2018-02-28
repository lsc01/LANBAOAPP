//
//  ViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/2/27.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "ViewController.h"

#import "LBLoginViewController.h"
#import "LBRegistPasswordVC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnRegist;
@property (weak, nonatomic) IBOutlet UIButton *btnWechat;
@property (weak, nonatomic) IBOutlet UIButton *btnQQ;
@property (weak, nonatomic) IBOutlet UIButton *btnWeibo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUI];
    
}


-(void)setUI{
    self.btnLogin.layer.borderWidth =1;
    self.btnLogin.layer.borderColor = [UIColor grayColor].CGColor;
    self.btnLogin.clipsToBounds = YES;
    self.btnLogin.layer.cornerRadius = 10;
}

- (IBAction)loginClick:(UIButton *)sender {
    LBLoginViewController * loginVC = [LBLoginViewController new];
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
}
- (IBAction)registerClick:(UIButton *)sender {
    LBRegistPasswordVC * registVC = [[LBRegistPasswordVC alloc] init];
    [self presentViewController:registVC animated:YES completion:^{
        
    }];
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


@end
