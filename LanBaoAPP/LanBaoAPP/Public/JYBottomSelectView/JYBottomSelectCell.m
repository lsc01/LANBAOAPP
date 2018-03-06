//
//  JYBottomSelectCell.m
//  JYParent
//
//  Created by lsc on 2017/12/9.
//  Copyright © 2017年 互动家园. All rights reserved.
//

#import "JYBottomSelectCell.h"

@implementation JYBottomSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(UILabel *)jyLabelTitle{
    if (_jyLabelTitle == nil) {
        _jyLabelTitle = [[UILabel alloc] init];
        _jyLabelTitle.numberOfLines = 1;
        _jyLabelTitle.textColor = HEXCOLOR(kTitleColor);
        _jyLabelTitle.font = [UIFont systemFontOfSize:14];
        _jyLabelTitle.textAlignment = NSTextAlignmentCenter;
    }
    return  _jyLabelTitle;
}

-(UIView *)viewLine{
    if (_viewLine == nil) {
        _viewLine = [[UIView alloc] init];
        _viewLine.backgroundColor = HEXCOLOR(kLineColor);
    }
    return _viewLine;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    [self.contentView addSubview:self.jyLabelTitle];
    [self.contentView addSubview:self.viewLine];
    
    [self.jyLabelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView).with.offset(-1);
    }];
    [self.viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}

@end
