//
//  LBTableViewCell.h
//  LanBaoAPP
//
//  Created by lsc on 2018/3/7.
//  Copyright © 2018年 lsc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LBTableViewCell;
typedef void(^selectedPhotos)(NSArray *photoArray);
@interface LBTableViewCell : UITableViewCell
//返回的相册数据
@property (nonatomic ,strong) NSArray * photoArray;
//返回的输入框的数据
@property (nonatomic ,copy ,readonly) NSString * textReason;

@property (nonatomic ,copy) void(^photoSelectBlock)(NSInteger count , LBTableViewCell * cell);
-(void)setPhotoSelectBlock:(void (^)(NSInteger count,LBTableViewCell * cell))photoSelectBlock;
@end
