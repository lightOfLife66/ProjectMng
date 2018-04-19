//
//  HomeHotCollectionViewCell.m
//  cxfShopiOSApp
//
//  Created by hhf on 2017/12/12.
//  Copyright © 2017年 hhf. All rights reserved.
//

#import "HomeHotCollectionViewCell.h"

@interface HomeHotCollectionViewCell ()
@property (strong, nonatomic) UIImageView *titleImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation HomeHotCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    self.userInteractionEnabled = YES;
    
    _titleImageView = [UIImageView createCenterImageOfImageView];
    _titleImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:_titleImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.userInteractionEnabled = YES;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = UIFontMake(12);
    [self.contentView addSubview:_titleLabel];
    [self layoutUI];
}

- (void)layoutUI {
    
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).mas_offset(Factor_6(5));
        make.right.equalTo(self.contentView).mas_offset(-Factor_6(5));
        make.height.mas_equalTo(Factor_6(40));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.width.equalTo(self.contentView);
//        make.left.mas_equalTo(_titleImageView);
//        make.width.mas_equalTo(Factor_6(120));
        make.top.equalTo(_titleImageView.mas_bottom).mas_offset(Factor_6(10));
    }];
}

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;
    _titleLabel.text = [dic objectForKey:@"title"];
    [_titleImageView setImage:[UIImage imageNamed:[dic objectForKey:@"imageName"]]];
}



@end
