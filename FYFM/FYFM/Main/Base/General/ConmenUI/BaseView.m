//
//  BaseView.m
//  ClassificationDemo
//
//  Created by 袁涛 on 2017/11/28.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

/**
 创建UI
 */
- (void)createUI {
    
}

/**
 布局
 */
- (void)layoutUI{
    
}


- (void)contentMASLayout {
    UIEdgeInsets inset = UIEdgeInsetsMake([Util navBarHeight], 0, 0, 0);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.superview).insets(inset);
    }];
}

-(void)contentMASedgesLayout {
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.superview);
    }];
}


@end
