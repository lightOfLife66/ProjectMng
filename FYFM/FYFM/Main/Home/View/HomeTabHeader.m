//
//  HomeTabHeader.m
//  FYFM
//
//  Created by mac_123 on 2018/4/3.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "HomeTabHeader.h"



@implementation HomeTabHeader


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void) setUI{
    
    _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headBtn setTitle:@"新品推荐" forState:UIControlStateNormal];
    _headBtn.titleLabel.font = UIFontMake(12);
    [_headBtn setTintColor:[UIColor whiteColor]];
    _headBtn.backgroundColor = [UIColor orangeColor];
    [self addSubview:_headBtn];
    
    [self createConstraint];
    
}

-(void) createConstraint{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
