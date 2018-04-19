//
//  BaseTextFiled.h
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTextFiled : UITextField

/**
 *  修改 placeholder 的颜色，默认是 UIColorPlaceholder。
 */
@property(nonatomic, strong) IBInspectable UIColor *placeholderColor;

/**
 *  文字在输入框内的 padding。如果出现 clearButton，则 textInsets.right 会控制 clearButton 的右边距
 *
 *  默认为 TextFieldTextInsets
 */
@property(nonatomic, assign) UIEdgeInsets textInsets;
/** 是否允许粘粘 */
@property(nonatomic, assign) BOOL isNotDisplayMenu;

- (instancetype)initWithLeftImage:(UIImage *)leftImage;

@end
