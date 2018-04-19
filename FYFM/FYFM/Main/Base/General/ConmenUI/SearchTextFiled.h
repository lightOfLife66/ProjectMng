//
//  SearchTextFiled.h
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "BaseTextFiled.h"

@interface SearchTextFiled : BaseTextFiled

@property (strong, nonatomic) UIButton *rightButton;
- (void)setLeftImage:(UIImage *)leftImage;
- (void)setRightImage:(UIImage *)rightImage;

@end
