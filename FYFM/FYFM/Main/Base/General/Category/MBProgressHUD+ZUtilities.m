//
//  MBProgressHUD+ZUtilities.m
//  WeClubs
//
//  Created by Zed Link on 9/4/2017.
//  Copyright © 2017 Zed. All rights reserved.
//

#import "MBProgressHUD+ZUtilities.h"

@implementation MBProgressHUD (ZUtilities)

#pragma mark - 弹窗 自动消失
/**
 弹窗

 @param text 弹窗文字内容
 @param icon 弹窗图片
 @param view 弹窗的窗口 view view == nil 则 view = keywindow
 */
+ (void)zAlertTitle:(NSString *)text icon:(NSString *)icon view:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.alpha = 1;
    // 设置图片
    if (icon != nil) {
        
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    }
    
    hud.label.text = text;
    hud.mode = MBProgressHUDModeCustomView;
    hud.margin = 10.f;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 几秒后移除
    [hud hideAnimated:YES afterDelay:delay];
}

/**
 消息提示框_文本信息 GENERAL_ALERT_DURATION 秒后消失
 */
+ (void)zAlertMessage:(NSString *)message {
    
//    [self zAlertMessage:message toView:nil]; //11.1
    [self zAlertTitle:message icon:nil view:[[UIApplication sharedApplication] keyWindow] afterDelay:GENERAL_ALERT_DURATION];
}

+ (void)zAlertMessage:(NSString *)message toView:(UIView *)view {
    
    [self zAlertTitle:message icon:nil view:view afterDelay:GENERAL_ALERT_DURATION];
}


/**
 消息提示框_成功 GENERAL_ALERT_DURATION 秒后消失
 */
+ (void)zAlertSuccess:(NSString *)success {
    
    [self zAlertSuccess:success toView:nil];
}
+ (void)zAlertSuccess:(NSString *)success toView:(UIView *)view {
    
    if (view == nil) {
        
        view = KEY_WINDOW;
    }
    
    [self zAlertTitle:success icon:@"success.png" view:KEY_WINDOW afterDelay:GENERAL_ALERT_DURATION];
}

/**
 消息提示框_错误 GENERAL_ALERT_DURATION 秒后消失
 */
+ (void)zAlertError:(NSString *)error {
    
    [self zAlertError:error toView:nil];
}
+ (void)zAlertError:(NSString *)error toView:(UIView *)view {
    
    if (!view) {
        
        view = KEY_WINDOW;
    }
    [self zAlertTitle:error icon:@"error.png" view:view afterDelay:GENERAL_ALERT_DURATION];
}


#pragma mark - 弹窗 点击后消失
/**
 弹出提示框 默认点击后消失

 @param message 信息
 @param view    View ，若 View = nil 则 view = keyWindow

 */
+ (MBProgressHUD *)zAlertProgressMessage:(NSString *)message to:(UIView *)view
{
    if (view == nil) {
        
        view = KEY_WINDOW;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = message;
    
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.2f];
    
    return hud;
}

+ (MBProgressHUD *)zAlertProgress:(NSString *)message {
    return [self zAlertProgressMessage:message to:KEY_WINDOW];
}


+ (MBProgressHUD *)zAlertMessage:(NSString *)message to:(UIView *)view performBlock:(void(^)())todoBlock
{
    MBProgressHUD *hud = [self zAlertToastMessage:message];
    hud.completionBlock = todoBlock;
    
    return hud;
}


+ (MBProgressHUD *)zAlertToastMessage:(NSString *)message
{
    
    return [self zAlertMessage:message to:KEY_WINDOW afterDelay:GENERAL_ALERT_DURATION];
}

+ (MBProgressHUD *)zAlertMessage:(NSString *)message to:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [self zAlertConfirmMessage:message to:view];
    [hud hideAnimated:YES afterDelay:delay];
    
    return hud;
}

+ (MBProgressHUD *)zAlertConfirmMessage:(NSString *)message to:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.2f];
    return hud;
}



#pragma mark - 弹窗 隐藏
/**
 隐藏提示框
 */
+ (void)zAlertHideHUD {
    
    [self zAlertHideForView:nil];
}

/**
 隐藏提示框
 */
+ (void)zAlertHideForView:(UIView *)view {
    
    if (!view) {
        
        view = KEY_WINDOW;
    }
    [self hideHUDForView:view animated:YES];
}







@end
