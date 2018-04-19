//
//  PublicSystemDefine.h
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


/**
 *  系统版本
 */
#define __iOS11_0__ (@available(iOS 11.0, *))
#define __iOS10_0__ (@available(iOS 10.0, *))
#define __iOS9_0__ (@available(iOS 9.0, *))
#define __iOS8_0__ (@available(iOS 8.0, *))
#define __iOS7_0__ (@available(iOS 7.0, *))

#define iOS11Later (IOS_VERSION >= 11.0)

/**
 *  打印
 */
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define YTLog(FORMAT, ...) nil
#endif

#define weakselfly(self) __weak typeof(self) weakSelf = self
#define strongselfly(self) __strong typeof(self) strongSelf = weakSelf

///屏幕
#define ScreenScale ([[UIScreen mainScreen] scale])
///屏幕适配因子
#define Factor_6(A) ([UIScreen mainScreen].bounds.size.width / 375.0 * (A))

#define kFactor ([UIScreen mainScreen].bounds.size.width / 375.0)

#pragma mark - 方法-创建器

//UIColor相关创建器
#define UIColorMake(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorMakeWithRGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]
#define UIColorMakeWithHex(hex) [UIColor yt_colorWithHexString:hex]

#define statusColor [UIColor colorWithHexString:@"#1c89a4"]  //浅青色
#define navBarColor [UIColor colorWithHexString:@"#076d91"]  //深青色
#define midGrayColor [UIColor colorWithHexString:@"#333333"] //灰色
#define fontColor [UIColor colorWithHexString:@"#666666"]   //字体灰色

// 字体相关创建器，包括动态字体的支持
#define UIFontMake(size) [UIFont systemFontOfSize:size]
#define UIFontBoldMake(size) [UIFont boldSystemFontOfSize:size]
#define UIFontBoldWithFont(_font) [UIFont boldSystemFontOfSize:_font.pointSize]

#define WEAKSELF(pointer)        __weak typeof(pointer)weakSelf = pointer

//#pragma mark - userdefualt key

//NSString * const phone = @"feiyanggouwu_phone";
//NSString * const password = @"feiyanggouwu_password";



