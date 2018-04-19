//
//  BaseTextFiled.m
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "BaseTextFiled.h"

@interface BaseTextFiled ()
@property (strong, nonatomic) UIImage *leftImage;
@end

@implementation BaseTextFiled

- (instancetype)initWithLeftImage:(UIImage *)leftImage {
    
    self = [super init];
    if (self) {
        _leftImage = leftImage;
        [self setUpUI];
    }
    return self;
}

-(void) setUpUI{
    
    UIImageView *leftImageView = [UIImageView createCenterImageOfImageView];
    [leftImageView setImage:_leftImage];
    //    YTLog(@"%@",_leftImage);
    CGFloat h = Factor_6(40);
    leftImageView.frame = CGRectMake(Factor_6(10), (h - _leftImage.size.height) / 2, _leftImage.size.width, _leftImage.size.height);
    UIView *sleftView = [[UIView alloc] init];
    sleftView.frame = CGRectMake(0, 0, h, h);
    [sleftView addSubview:leftImageView];
    self.leftView = sleftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.layer.cornerRadius = 8;
    self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
    self.layer.borderWidth = 1;
    self.layer.masksToBounds = YES;
    self.placeholder = @"请输入手机号码";
    self.placeholderColor = [UIColor whiteColor];
    self.font = UIFontMake(14);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
