//
//  BaseView.h
//  ClassificationDemo
//
//  Created by 袁涛 on 2017/11/28.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "YJProgressHUD.h"

@interface BaseView : UIView

/**
 创建UI
 */
- (void)createUI ;

/**
 布局
 */
- (void)layoutUI;



/**
     自身布局 自定义的contentView
 */
- (void)contentMASLayout;
- (void)contentMASedgesLayout;


@end
