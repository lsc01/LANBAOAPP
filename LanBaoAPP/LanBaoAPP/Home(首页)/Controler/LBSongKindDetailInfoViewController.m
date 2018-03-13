//
//  LBSongKindDetailInfoViewController.m
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/13.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBSongKindDetailInfoViewController.h"
#import "LBSongDetailHeadView.h"
#import "LBKindDetailInfoCell.h"
#import "LBAddSongsViewController.h"

@interface LBSongKindDetailInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong)LBSongDetailHeadView * listheadView;
@end

@implementation LBSongKindDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = kAPPBaseColor;
    [self setUI];
}
-(void)setUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.bounces = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBKindDetailInfoCell" bundle:nil] forCellReuseIdentifier:@"LBKindDetailInfoCell"];
  
    
    self.listheadView = [[NSBundle mainBundle] loadNibNamed:@"LBSongDetailHeadView" owner:nil options:nil].firstObject;
    [self.view addSubview:self.listheadView];
    
    UIImageView * imageview = [[UIImageView alloc] initWithImage:self.image];
    
    [self.view addSubview:imageview];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(kScreenWidth*0.8);
//        make.bottom.mas_equalTo(self.listheadView.mas_top);
    }];
    
    [self.listheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(60);
        make.top.mas_equalTo(imageview.mas_bottom);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.listheadView.mas_bottom);
    }];
    
    
    WeakSelf();
    [self.listheadView setAddSongsBlock:^{
        LBAddSongsViewController * addVC = [[LBAddSongsViewController alloc] init];
        [weakself presentViewController:addVC animated:YES completion:^{
            
        }];
    }];
    
    [self.listheadView setRepeatBlock:^{
        
    }];
    
    [self.listheadView setDeleteSongsBlock:^{
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBKindDetailInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LBKindDetailInfoCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)closebtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
