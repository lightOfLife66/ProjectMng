//
//  TopNavBarTitleView.h
//  cxfShopiOSApp
//
//  Created by 袁涛 on 2017/12/11.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import "BaseView.h"

#import "SearchTextFiled.h"

@interface TopNavBarTitleView : BaseView
@property (assign, nonatomic) BOOL isLeftViewHidden; //左边控件是否隐藏
@property (strong, nonatomic) SearchTextFiled *searchTextField;
/** 左边控件 */
@property (strong, nonatomic) UIButton *IconButton;
/** 右边控件 */
@property (strong, nonatomic) UIButton *listButton;

//@property (strong, nonatomic) BaseButton *QRCodeButton;
@end



