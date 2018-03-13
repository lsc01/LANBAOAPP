//
//  LBSongKindViewController.m
//  LanBaoAPP
//
//  Created by lanshichang on 2018/3/12.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBSongKindViewController.h"
#import "LBSongKindTableViewCell.h"
#import "LBSongKindInfoModel.h"
#import "LBSongKindDetailInfoViewController.h"

@interface LBSongKindViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) NSMutableArray * arrData;

@property (nonatomic ,strong) LBSongKindInfoModel * currModel;

@end

@implementation LBSongKindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kAPPBaseBackGroudColor;
    int i = 20;
    while (i--) {
        LBSongKindInfoModel *model = [[LBSongKindInfoModel alloc] init];
        model.songName = @"爱仕达多 大";
        model.singerName = @"阿斯达";
        model.islikely = NO;
        model.isShowInfo = NO;
        [self.arrData addObject:model];
    }
    
    [self createUI];
}
-(void)createUI{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"LBSongKindTableViewCell" bundle:nil] forCellReuseIdentifier:@"LBSongKindTableViewCell"];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(self.view);
    }];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBSongKindInfoModel * model = self.arrData[indexPath.row];
    return model.isShowInfo?60:50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LBSongKindInfoModel * model = self.arrData[indexPath.row];
    LBSongKindTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LBSongKindTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelTitleFirst.text = model.songName;
    cell.labelSingerFirst.text = model.singerName;
    cell.labelTitleSecond.text = [[model.songName stringByAppendingString:@" - "] stringByAppendingString:model.singerName];
    cell.btnLike.selected = model.islikely;
    cell.btnMoreInfo.selected = model.isShowInfo;
    cell.viewBGFirst.hidden = model.isShowInfo;
    cell.viewBgSecond.hidden = !model.isShowInfo;
    [cell buttonActionCallBackMoreInfo:^(BOOL isShowInfo) {
        self.currModel.isShowInfo = NO;
        model.isShowInfo = isShowInfo;
        self.currModel = model;
        [tableView reloadData];
//        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    } callBackLike:^(BOOL islikely) {
        model.islikely = islikely;
    } callBackDelete:^{
        self.currModel = nil;
        [self.arrData removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    } longPressGest:^{
        [self showCurrSongDetailInfoVC];
    }];
    return cell;
}

-(void)showCurrSongDetailInfoVC{
    LBSongKindDetailInfoViewController * vc = [[LBSongKindDetailInfoViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    NSLog(@"GGG");
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
