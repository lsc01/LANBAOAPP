//
//  LBMyViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBMyViewController.h"
#import "LBMineHeadTableViewCell.h"
#import "LBMineTableViewCell.h"
#import "LBMyDataViewController.h"
#import "LBFeedbackViewController.h"
#import "LBQuestionViewController.h"
#import "LBMessageCenterVC.h"
#import "LBSysSettingVC.h"

@interface LBMyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSArray * arrImages;
@property (nonatomic ,strong) NSArray * arrTitles;


@end

@implementation LBMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    
    self.arrImages = @[@"",@"",@"",@""];
    self.arrTitles = @[@"常见问题",@"意见反馈",@"消息中心",@"系统设置"];
    [self setUI];
}

-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LBMineHeadTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBMineTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 10;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 4;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 50;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LBMineHeadTableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        return cell1;
    }else{
        LBMineTableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell2.labelTitle.text = self.arrTitles[indexPath.row];
        
        return cell2;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section ==0) {
        LBMyDataViewController * myInfo = [[LBMyDataViewController alloc] init];
        [self.navigationController pushViewController:myInfo animated:YES];
    }else{
        if (indexPath.row == 0) {
            LBQuestionViewController * VC = [[LBQuestionViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row ==1){
            LBFeedbackViewController * VC = [[LBFeedbackViewController alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 2){
            LBMessageCenterVC * VC = [[LBMessageCenterVC alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 3){
            LBSysSettingVC * VC = [[LBSysSettingVC alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
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
