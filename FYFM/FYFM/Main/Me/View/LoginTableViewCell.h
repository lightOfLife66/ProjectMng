//
//  LoginTableViewCell.h
//  FYFM
//
//  Created by mac_123 on 2018/4/8.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginTableViewCell;

@protocol getTextFiledDelegate <NSObject>
//@required
//-(NSString*) getText:(NSString *)text;
@optional

/**  编辑资料 **/
- (void)editCell:(LoginTableViewCell *)cell indexPath:(NSIndexPath *)indexPath inputText:(NSString *)text;

@end

@interface LoginTableViewCell : UITableViewCell<UITextFieldDelegate,getTextFiledDelegate>



@property(nonatomic ,strong) UIImageView *iconImgV;
@property(nonatomic,strong) UIButton *regionBtn;

@property(nonatomic,strong) UITextField *textFiled;

@property(nonatomic,strong) UIButton *secretBtn;
@property(nonatomic,assign) BOOL isShowRegionBtn;

@property(nonatomic,strong) NSIndexPath *indexPath;

@property(nonatomic,weak) id<getTextFiledDelegate> getTextDelegat;


//监听+86，弹出按钮，暂时屏蔽
@property(nonatomic,copy) void(^regionBlock)(void);

//监听密码显示
@property(nonatomic,copy) void(^showPwdBlock)(UIButton *btn);


@end
