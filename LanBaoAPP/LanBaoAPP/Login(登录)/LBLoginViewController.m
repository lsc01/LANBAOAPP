//
//  LBLoginViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/2/28.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBLoginViewController.h"
#import "LBForgetPassWordVC.h"
#import "LBHomeViewController.h"
#import "AppDelegate.h"
#import "BSENavigationController.h"
#import "LBRegistPasswordVC.h"

@interface LBLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassWord;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@property (weak, nonatomic) IBOutlet UIButton *btnForget;

@property (weak, nonatomic) IBOutlet UIButton *btnRegist;
@end

@implementation LBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = kAPPBaseColor;
    [self setUI];
}

-(void)setUI{
    self.btnLogin.clipsToBounds = YES;
    self.btnLogin.layer.cornerRadius = 20;
    
    self.btnRegist.clipsToBounds = YES;
    self.btnRegist.layer.cornerRadius = 20;
    self.btnRegist.layer.borderColor = [UIColor whiteColor].CGColor;
    self.btnRegist.layer.borderWidth = 1;
    
}

- (IBAction)loginClick:(UIButton *)sender {
    
    LBHomeViewController * homeVC = [[LBHomeViewController alloc] init];
    
    BSENavigationController * nav = [[BSENavigationController alloc] initWithRootViewController:homeVC];
    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = nav;
    [delegate.window makeKeyAndVisible];
    
}
- (IBAction)registClick:(UIButton *)sender {
    LBRegistPasswordVC * VC = [[LBRegistPasswordVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (IBAction)forgetPwdClick:(UIButton *)sender {
    LBForgetPassWordVC * forgetVC = [[LBForgetPassWordVC alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
    
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
