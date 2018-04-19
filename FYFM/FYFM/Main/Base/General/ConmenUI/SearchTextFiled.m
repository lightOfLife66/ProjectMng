//
//  SearchTextFiled.m
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "SearchTextFiled.h"

@interface SearchTextFiled()
@property (strong, nonatomic) UIButton *leftButton;

@end

@implementation SearchTextFiled
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    CGFloat contextHeight = 10;
    
    //    _searchField = [[UITextField alloc] init];
    self.layer.cornerRadius = contextHeight * 0.5;
    self.layer.masksToBounds = YES;
    self.layer.backgroundColor = (__bridge CGColorRef _Nullable)([[UIColor blueColor] colorWithAlphaComponent:0.3]);
    
    //    _leftImageView = [UIImageView createCenterImageOfImageView];
    //    _leftImageView.frame = CGRectMake(10, 6.5, 17, 17);
    //    self.leftView = _leftImageView;
    
    _leftButton = [[UIButton alloc] init];
    _leftButton.frame = CGRectMake(0, 0, 40, 30);
    [_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.leftView = _leftButton;
    
    
    _rightButton = [[UIButton alloc] init];
    _rightButton.frame = CGRectMake(0, 0, 40, 30);
    [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _rightButton.backgroundColor = [UIColor yellowColor];
    self.rightView = _rightButton;
    
    
    
    
    [self layout];
    
}

- (void)layout {
    
}

//控制placeHolder的位置，左右缩20
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    
    //return CGRectInset(bounds, 20, 0);
    CGRect inset = CGRectMake(bounds.origin.x+Factor_6(12), bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
    return inset;
}

//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    //return CGRectInset( bounds, 10 , 0 );
    
    CGRect inset = CGRectMake(bounds.origin.x +10, bounds.origin.y, bounds.size.width -10, bounds.size.height);
    return inset;
}
//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    //return CGRectInset(bounds, 50, 0);
    CGRect inset = CGRectMake(bounds.origin.x+190, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
    
    return inset;
    
}

- (void)rightButtonClick:(UIButton *)sender {
    NSLog(@"点击右边按钮");
}

- (void)leftButtonClick:(UIButton *)sender {
    
}


- (void)setLeftImage:(UIImage *)leftImage {
    if (!leftImage){
        self.leftViewMode = UITextFieldViewModeNever;
        return;
    }
    //    [_leftImageView setImage:leftImage];
    [_leftButton setDefaultImage:leftImage];
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setRightImage:(UIImage *)rightImage {
    if (!rightImage) return;
    [_rightButton setDefaultImage:rightImage];
    _rightButton.backgroundColor = [UIColor yellowColor];
    self.rightViewMode = UITextFieldViewModeAlways;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
