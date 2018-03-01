//
//  LBMyDataViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/1.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBMyDataViewController.h"
#import "LBMydataHeadTableViewCell.h"
#import "LBMyDataTableViewCell.h"

@interface LBMyDataViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) NSArray * arrTitles;
@property (nonatomic ,strong) NSArray * arrDescripts;

@end

@implementation LBMyDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人资料";
    
    self.arrTitles = @[@"昵称",@"性别",@"出生日期"];
    self.arrDescripts = @[@"xx",@"男",@"1234-12-12"];
    [self setUI];
}

-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    
    [self.view addSubview:self.tableView];

    [self.tableView registerNib:[UINib nibWithNibName:@"LBMydataHeadTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBMydataHeadTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBMyDataTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBMyDataTableViewCell"];
    
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
        return self.arrTitles.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else{
        return 50;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LBMydataHeadTableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"LBMydataHeadTableViewCell" forIndexPath:indexPath];
        return cell1;
    }else{
        LBMyDataTableViewCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"LBMyDataTableViewCell" forIndexPath:indexPath];
        cell2.labelTitle.text = self.arrTitles[indexPath.row];
        cell2.labelDescript.text = self.arrDescripts[indexPath.row];
        
        
        return cell2;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
