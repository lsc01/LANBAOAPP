//
//  LBAddToListViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/15.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBAddToListViewController.h"
#import "LBAddSongsUpView.h"
#import "LBAddSongListViewController.h"

@interface LBAddToListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) LBAddSongsUpView * viewUp;

@property (nonatomic ,strong) NSMutableArray * arrData;

@end

@implementation LBAddToListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.arrData addObjectsFromArray:@[@"新建歌单",@"中国风",@"欧美风",@"日韩风",@"南亚风"]];
    [self setUI];
}

-(void)setUI{
    self.viewUp = [[NSBundle mainBundle] loadNibNamed:@"LBAddSongsUpView" owner:nil options:nil].firstObject;
    self.viewUp.labelTitle.text = @"添加歌曲到歌单";
    self.viewUp.isAllowSelect = NO;
    [self.viewUp.btnLeft setTitle:@"完成" forState:UIControlStateNormal];
    [self.view addSubview:self.viewUp];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
//    [self.tableView registerNib:[UINib nibWithNibName:@"LBAddSongsCell" bundle:nil] forCellReuseIdentifier:@"LBAddSongsCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.viewUp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(isIPhoneX?88:64);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.viewUp.mas_bottom).offset(2);
    }];
    WeakSelf();
    [self.viewUp setCloseViewBlock:^{
        [weakself dismissViewControllerAnimated:YES completion:^{
            
        }];
    }];
    [self.viewUp setCompleteBlock:^{
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"添加成功" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击按钮响应事件
            [weakself dismissViewControllerAnimated:YES completion:^{
                
            }];
        }]];
        [weakself presentViewController:alert animated:YES completion:nil];
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.arrData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (0 == indexPath.row ) {
        LBAddSongListViewController * vc = [[LBAddSongListViewController alloc] init];
        [self presentViewController:vc animated:YES completion:^{
            
        }];
    }
}

-(NSMutableArray *)arrData{
    if (!_arrData) {
        _arrData = [NSMutableArray array];
    }
    return _arrData;
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
