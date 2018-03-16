//
//  LBAddSongListViewController.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/15.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBAddSongListViewController.h"
#import "LBAddSongsUpView.h"
#import "LBAddNewKindListView.h"

@interface LBAddSongListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) LBAddSongsUpView * viewUp;

@property (nonatomic ,strong) NSMutableArray * arrData;

@end

@implementation LBAddSongListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUI];
}

-(void)setUI{
    self.viewUp = [[NSBundle mainBundle] loadNibNamed:@"LBAddSongsUpView" owner:nil options:nil].firstObject;
    self.viewUp.labelTitle.text = @"添加歌曲到歌单";
    self.viewUp.isAllowSelect = NO;
    [self.viewUp.btnLeft setTitle:@"完成" forState:UIControlStateNormal];
    [self.view addSubview:self.viewUp];
    
    LBAddNewKindListView *addView = [[NSBundle mainBundle] loadNibNamed:@"LBAddNewKindListView" owner:nil options:nil].firstObject;
    [self.view addSubview:addView];
    
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
    [addView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.viewUp.mas_bottom).offset(0);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(addView.mas_bottom).offset(2);
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
    
    [addView setAddNewListBlock:^{
        [weakself.arrData addObject:@"加一个"];
        [weakself.tableView reloadData];
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"干啥呢" message:@"我点了添加接下来改干啥呢？" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"爱干嘛干嘛" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击按钮响应事件
        }]];
        [self presentViewController:alert animated:YES completion:nil];
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
