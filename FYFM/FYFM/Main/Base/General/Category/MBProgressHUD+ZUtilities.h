//
//  MBProgressHUD+ZUtilities.h
//  WeClubs
//
//  Created by Zed Link on 9/4/2017.
//  Copyright © 2017 Zed. All rights reserved.
//

#import "MBProgressHUD.h"

#define GENERAL_ALERT_DURATION 2.5
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow

@interface MBProgressHUD (ZUtilities)

/**
 弹窗提示, 持续显示指定时间后消失
 */
+ (MBProgressHUD *)zAlertMessage:(NSString *)message to:(UIView *)view afterDelay:(NSTimeInterval)delay;

/**
 弹窗提示, 点击确定后将执行指定的方法, 让视图消失需要手动调用zCancelAlertForView:方法
 该方法尚未完成, 存在问题
 */
//+ (MBProgressHUD *)zAlertConfirmMessage:(NSString *)message to:(UIView *)view andAddTarget:(id)target action:(SEL)selector;

/**
 弹窗提示, 点击确定后将执行Block, 让视图消失需要手动调用zCancelAlertForView:方法
 */
+ (MBProgressHUD *)zAlertMessage:(NSString *)message to:(UIView *)view performBlock:(void(^)())todoBlock;

/**
 弹窗提示_点击背景消失
 */
+ (MBProgressHUD *)zAlertToastMessage:(NSString *)message;

/**
 消息提示框_加载等待_菊花 zAlertHideHUD 或 zAlertHideForView 消失
 */
+ (MBProgressHUD *)zAlertProgress:(NSString *)message;
+ (MBProgressHUD *)zAlertProgressMessage:(NSString *)message to:(UIView *)view;

/**
消息提示框_文本信息 GENERAL_ALERT_DURATION 秒后消失
*/
+ (void)zAlertMessage:(NSString *)message;
+ (void)zAlertMessage:(NSString *)message toView:(UIView *)view;

/**
 消息提示框_成功 GENERAL_ALERT_DURATION 秒后消失
 */
+ (void)zAlertSuccess:(NSString *)success;
+ (void)zAlertSuccess:(NSString *)success toView:(UIView *)view;

/**
 消息提示框_错误 GENERAL_ALERT_DURATION 秒后消失
 */
+ (void)zAlertError:(NSString *)error;
+ (void)zAlertError:(NSString *)error toView:(UIView *)view;


/**
 隐藏提示框，默认是主窗口
 */
+ (void)zAlertHideHUD;
+ (void)zAlertHideForView:(UIView *)view;
@end
