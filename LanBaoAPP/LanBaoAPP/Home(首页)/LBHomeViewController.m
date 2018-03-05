//
//  LBHomeViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBHomeViewController.h"
#import "LBMyViewController.h"

@interface LBHomeViewController ()

@end

@implementation LBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    [self setnav];
    
}

-(void)setnav{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithTitle:@"个人" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarbuttonClick)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)leftBarbuttonClick{
    LBMyViewController * myVC = [[LBMyViewController alloc] init];
    
    [self.navigationController pushViewController:myVC animated:YES];
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
