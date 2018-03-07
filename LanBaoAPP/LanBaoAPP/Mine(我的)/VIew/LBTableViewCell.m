//
//  LBTableViewCell.m
//  LanBaoAPP
//
//  Created by lsc on 2018/3/7.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import "LBTableViewCell.h"
#import <PYPhotosView.h>

@interface LBTableViewCell()<UITextViewDelegate,PYPhotosViewDelegate>

@property (nonatomic ,strong) UILabel * labelTitle;
@property (nonatomic ,strong) UIView *lineView1;
@property (nonatomic ,strong) UITextView * textView;
@property (nonatomic ,strong) UIView *lineView2;
@property (nonatomic ,strong) PYPhotosView * photoView;

@property (nonatomic ,strong) NSMutableArray * imagesArray;

@end
@implementation LBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.lineView1];
    [self.contentView addSubview:self.lineView2];
    [self.contentView addSubview:self.textView];
    [self.contentView addSubview:self.photoView];
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).with.offset(15);
        make.right.mas_equalTo(self.contentView).with.offset(-15);
        make.height.mas_equalTo(15);
    }];
    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labelTitle.mas_bottom).with.offset(15);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView1.mas_bottom).with.offset(5);
        make.left.mas_equalTo(self.contentView).with.offset(15);
        make.right.mas_equalTo(self.contentView).with.offset(-15);
        make.height.mas_equalTo(140);
    }];
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.photoView.mas_top).with.offset(-10);
        make.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
    
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).with.offset(15);
        make.right.mas_equalTo(self.contentView).with.offset(-15);
        make.bottom.mas_equalTo(self.contentView).with.offset(-15);
        make.height.mas_equalTo((kScreenWidth - 30 - 50)/5.0);
    }];
}

-(UILabel *)labelTitle{
    if (_labelTitle == nil) {
        _labelTitle = [[UILabel alloc] init];
        _labelTitle.text = @"问题描述";
        _labelTitle.font = [UIFont systemFontOfSize:16];
        _labelTitle.textColor = HEXCOLOR(kitemTitleColor);
    }
    return _labelTitle;
}

-(UIView *)lineView1{
    if (_lineView1 == nil) {
        _lineView1 = [[UIView alloc] init];
        _lineView1.backgroundColor = HEXCOLOR(kdesribeColor);
    }
    return _lineView1;
}

-(UIView *)lineView2{
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc] init];
        _lineView2.backgroundColor = HEXCOLOR(kdesribeColor);
    }
    return _lineView2;
}

-(UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc] init];
        _textView.text = @"请输入您的描述    ";
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.textColor = HEXCOLOR(kitemTitleColor);
        _textView.delegate = self;
    }
    return _textView;
}

-(PYPhotosView *)photoView{
    if (_photoView == nil) {
        // 2.1 设置本地图片
        _photoView = [PYPhotosView photosView];
        _photoView.photosMaxCol = 5;
        _photoView.hideDeleteView = YES;
        CGFloat p_wh = (kScreenWidth - 30 - _photoView.photoMargin*4)/5;
        _photoView.photoWidth = p_wh;;
        _photoView.photoHeight = p_wh;
        
        // 3. 设置代理
        _photoView.delegate = self;
    }
    return _photoView;
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"请输入您的描述    "]) {
        textView.text = @"";
        _textView.textColor = HEXCOLOR(kTitleColor);
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text length]<1) {
        textView.text = @"请输入您的描述    ";
        _textView.textColor = HEXCOLOR(kitemTitleColor);
    }
}

-(void)textViewDidChange:(UITextView *)textView{
    NSInteger maxCount = 300;
    if (textView.text.length > maxCount) {
        NSString * strTemp = [textView.text substringWithRange:NSMakeRange(0,maxCount)];
        textView.text = strTemp;
    }
}

#pragma mark - PYPhotosViewDelegate
- (void)photosView:(PYPhotosView *)photosView didAddImageClickedWithImages:(NSMutableArray *)images
{
    self.imagesArray = nil;
    [self.imagesArray addObjectsFromArray:images];
    if (images.count>=4) {
        [SVProgressHUD showImage:nil status:@"最多添加4张图片"];
    }else{
        _photoSelectBlock?_photoSelectBlock(images.count,self):nil;
    }
}
/**
 * 删除图片按钮触发时调用此方法
 * imageIndex : 删除的图片在之前图片数组的位置
 */
- (void)photosView:(PYPhotosView *)photosView didDeleteImageIndex:(NSInteger)imageIndex{
    //    [self.imagesArray removeObjectAtIndex:imageIndex];
    NSLog(@"self.images:%ld",self.imagesArray.count);
}

// 进入预览图片时调用, 可以在此获得预览控制器，实现对导航栏的自定义
- (void)photosView:(PYPhotosView *)photosView didPreviewImagesWithPreviewControlelr:(PYPhotosPreviewController *)previewControlelr
{
    NSLog(@"进入预览图片");
}


-(void)setPhotoArray:(NSArray *)photoArray{
    [self.imagesArray addObjectsFromArray:photoArray];
    [self.photoView reloadDataWithImages:self.imagesArray];
}

-(NSArray *)photoArray{
    return self.imagesArray;
}

-(NSString *)textReason{
    return self.textView.text;
}

-(NSMutableArray *)imagesArray{
    if (_imagesArray == nil) {
        _imagesArray = [NSMutableArray array];
    }
    return _imagesArray;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
