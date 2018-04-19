//
//  BaseViewController.h
//  FYFM
//
//  Created by mac_123 on 2018/3/27.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseNavViewController.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIButton *navLeftBtn;
@property (nonatomic, strong) UIButton *navRightBtn;

-(void) pushViewController:(UIViewController *) VC;

- (void)actionCustomLeftBtnWithNrlImage:(NSString *)nrlImage htlImage:(NSString *)hltImage
                                  title:(NSString *)title
                                 action:(void(^)(void))btnClickBlock;
- (void)actionCustomLeftBtnWithNrlImage:(NSString *)nrlImage htlImage:(NSString *)hltImage
                                  title:(NSString *)title
                                  color:(UIColor *)color
                               fontSize:(UIFont *)font
                                 action:(void(^)(void))btnClickBlock;

- (void)actionCustomRightBtnWithNrlImage:(NSString *)nrlImage htlImage:(NSString *)hltImage
                                   title:(NSString *)title
                                  action:(void(^)(void))btnClickBlock;

- (void)actionCustomRightBtnWithNrlImage:(NSString *)nrlImage htlImage:(NSString *)hltImage
                                   title:(NSString *)title
                                   color:(UIColor *)color
                                fontSize:(UIFont *)font
                             selectTitle:(NSString *)selectTitle
                                  action:(void(^)(void))btnClickBlock;

@end
