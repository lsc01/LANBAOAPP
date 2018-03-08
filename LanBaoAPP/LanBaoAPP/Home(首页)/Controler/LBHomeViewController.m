//
//  LBHomeViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBHomeViewController.h"
#import "LBMyViewController.h"
#import "LBHomeUpTableViewCell.h"
#import "LBHomeDownTableViewCell.h"
#import "LBHomeCenterHeaderView.h"

@interface LBHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSArray * arrImages;
@property (nonatomic ,strong) NSArray * arrTitles;

@end

@implementation LBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"首页";
    
    [self setnav];
    
    self.arrImages = @[@"",@"",@"",@""];
    self.arrTitles = @[@"常见问题",@"意见反馈",@"消息中心",@"系统设置"];
    [self setUI];
}

-(void)setnav{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_person"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarbuttonClick)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)leftBarbuttonClick{
    LBMyViewController * myVC = [[LBMyViewController alloc] init];
    
    [self.navigationController pushViewController:myVC animated:YES];
}



-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LBHomeUpTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBHomeUpTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBHomeDownTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBHomeDownTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBHomeCenterHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"LBHomeCenterHeaderView"];
    
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 40;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 4;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LBHomeCenterHeaderView * view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LBHomeCenterHeaderView"];
    return view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LBHomeUpTableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"LBHomeUpTableViewCell" forIndexPath:indexPath];
        return cell1;
    }else{
        LBHomeDownTableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"LBHomeDownTableViewCell" forIndexPath:indexPath];
        return cell2;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
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
