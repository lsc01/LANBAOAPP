//
//  JYAskForLeaveDetailCell.m
//  JYParent
//
//  Created by lsc on 2017/12/7.
//  Copyright © 2017年 互动家园. All rights reserved.
//

#import "JYAskForLeaveDetailCell.h"
#import <PYPhotosView.h>

@interface JYAskForLeaveDetailCell()<UITextViewDelegate,PYPhotosViewDelegate>

@property (nonatomic ,strong) UITextView * textView;

@property (nonatomic ,strong) PYPhotosView * photoView;

@property (nonatomic ,strong) NSMutableArray * imagesArray;

@end

@implementation JYAskForLeaveDetailCell

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
    [self.contentView addSubview:self.textView];
    [self.contentView addSubview:self.photoView];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).with.offset(15);
        make.right.mas_equalTo(self.contentView).with.offset(-15);
        make.height.mas_equalTo(70);
    }];
    
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).with.offset(15);
        make.right.bottom.mas_equalTo(self.contentView).with.offset(-15);
        make.height.mas_equalTo(100);
    }];
}

-(UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc] init];
        _textView.text = @"请输入200字以内的请假原因    ";
        _textView.font = [UIFont systemFontOfSize:13];
        _textView.textColor = HEXCOLOR(kitemTitleColor);
        _textView.delegate = self;
    }
    return _textView;
}

-(PYPhotosView *)photoView{
    if (_photoView == nil) {
        // 2.1 设置本地图片
        _photoView = [PYPhotosView photosView];
        _photoView.photosMaxCol = 4;
        _photoView.hideDeleteView = YES;
        CGFloat p_wh = (kScreenWidth - 30 - _photoView.photoMargin*3)/4;
        _photoView.photoWidth = p_wh;;
        _photoView.photoHeight = p_wh;

        // 3. 设置代理
        _photoView.delegate = self;
    }
    return _photoView;
}

#pragma mark - UITextViewDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"请输入200字以内的请假原因    "]) {
        textView.text = @"";
        _textView.textColor = HEXCOLOR(kTitleColor);
    }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text length]<1) {
        textView.text = @"请输入200字以内的请假原因    ";
        _textView.textColor = HEXCOLOR(kitemTitleColor);
    }
}

-(void)textViewDidChange:(UITextView *)textView{
    NSInteger maxCount = 200;
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
    if (images.count>=3) {
        [SVProgressHUD showImage:nil status:@"最多添加三张图片"];
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
