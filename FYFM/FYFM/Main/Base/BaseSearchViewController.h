//
//  BaseSearchViewController.h
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "BaseViewController.h"
#import "TopNavBarTitleView.h"

@interface BaseSearchViewController : BaseViewController<UITextFieldDelegate>

@property (assign, nonatomic) BOOL isShowKeyboard;
@property (strong, nonatomic) TopNavBarTitleView *navBarView;
- (void)setSearchLeftImageView:(NSString *)name;

- (void)requestSearch;

@end
