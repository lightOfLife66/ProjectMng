//
//  RegisterViewController.m
//  FYFM
//
//  Created by mac_123 on 2018/4/9.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>{
    
    NSString *_userName;
    NSString *_phone;
    NSString *_pwd;
    NSString *_repwd;
    NSString *_email;
    NSString *_pwdpromptQ;
    NSString *_pwdpromptAN;
    BOOL _isAgree;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"注册";
    [self actionCustomLeftBtnWithNrlImage:@"fanhuijian" htlImage:@"" title:@"" action:^{
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self setUI];
    
    
}

-(void) setUI{
    
    //用户名
    UIImageView *userIconImgV  = [[UIImageView alloc] initWithFrame:CGRectZero];
    userIconImgV.image = [UIImage imageNamed:@"yonghuming"];
    [self.view addSubview:userIconImgV];
    
    UITextField *userNameTF = [[UITextField alloc] init];
    userNameTF.textColor = fontColor;
    userNameTF.delegate = self;
    userNameTF.placeholder = @"请输入用户名";
    userNameTF.tag = 1006;
    [self.view addSubview:userNameTF];
    
    UIImageView *line1ImgV = [[UIImageView alloc] init];
    line1ImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:line1ImgV];
    
    //手机号
    UIImageView *phoneImgV  = [[UIImageView alloc] init];
    phoneImgV.image = [UIImage imageNamed:@"shouji"];
    [self.view addSubview:phoneImgV];
    
    UIButton *regionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [regionBtn setImage:[UIImage imageNamed:@"86"] forState:UIControlStateNormal];
    [self.view addSubview:regionBtn];
    
    UIImageView *lineImgV = [[UIImageView alloc] init];
    lineImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:lineImgV];
    
    UITextField *phoneTF = [[UITextField alloc] init];
    phoneTF.textColor = fontColor;
    phoneTF.delegate = self;
    phoneTF.tag = 1007;
    phoneTF.placeholder = @"请输入手机号";
    [self.view addSubview:phoneTF];
    
    UIImageView *line2ImgV = [[UIImageView alloc] init];
    line2ImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:line2ImgV];
    
    //登录密码
    UIImageView *pwdImgV  = [[UIImageView alloc] init];
    pwdImgV.image = [UIImage imageNamed:@"suotou"];
    [self.view addSubview:pwdImgV];
    
    UIImageView *HlineImgV1 = [[UIImageView alloc] init];
    HlineImgV1.image = [UIImage imageNamed:@"shuxian"];
    [self.view addSubview:HlineImgV1];
    
    UITextField *pwdTF = [[UITextField alloc] init];
    pwdTF.textColor = fontColor;
    pwdTF.delegate = self;
    pwdTF.tag = 1008;
    pwdTF.placeholder = @"请输入登录密码";
    pwdTF.secureTextEntry = YES;
    [self.view addSubview:pwdTF];
    
    UIButton *secretBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [secretBtn setImage:[UIImage imageNamed:@"guangbi"] forState:UIControlStateNormal];
    [secretBtn addTarget:self action:@selector(pdwShowAction:) forControlEvents:UIControlEventTouchDown];
    secretBtn.tag = 1014;
    [self.view addSubview:secretBtn];
    
    UIImageView *line3ImgV = [[UIImageView alloc] init];
    line3ImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:line3ImgV];
    
    //确认登录密码
    UIImageView *confirmPwdImgV  = [[UIImageView alloc] init];
    confirmPwdImgV.image = [UIImage imageNamed:@"suotou"];
    [self.view addSubview:confirmPwdImgV];
    
    UIImageView *HlineImgV2 = [[UIImageView alloc] init];
    HlineImgV2.image = [UIImage imageNamed:@"shuxian"];
    [self.view addSubview:HlineImgV2];
    
    UITextField *confirmpwdTF = [[UITextField alloc] init];
    confirmpwdTF.textColor = fontColor;
    confirmpwdTF.delegate = self;
    confirmpwdTF.tag = 1009;
    confirmpwdTF.placeholder = @"再次输入登录密码";
    confirmpwdTF.secureTextEntry = YES;
    [self.view addSubview:confirmpwdTF];
    
    UIButton *secretBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [secretBtn2 setImage:[UIImage imageNamed:@"guangbi"] forState:UIControlStateNormal];
    secretBtn2.tag = 1013;
    [secretBtn2 addTarget:self action:@selector(pdwShowAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:secretBtn2];
    
    UIImageView *line4ImgV = [[UIImageView alloc] init];
    line4ImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:line4ImgV];
    
    //邮箱
    UIImageView *emailImgV  = [[UIImageView alloc] init];
    emailImgV.image = [UIImage imageNamed:@"youxiang"];
    [self.view addSubview:emailImgV];
    
    UITextField *emailTF = [[UITextField alloc] init];
    emailTF.textColor = fontColor;
    emailTF.delegate = self;
    emailTF.placeholder = @"请输入邮箱";
    emailTF.tag = 1010;
    [self.view addSubview:emailTF];
    
    UIImageView *line5ImgV = [[UIImageView alloc] init];
    line5ImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:line5ImgV];
    
    //密码提示问题
    UIImageView *pwdPromptQV  = [[UIImageView alloc] init];
    pwdPromptQV.image = [UIImage imageNamed:@"tishiwenti"];
    [self.view addSubview:pwdPromptQV];
    
    UITextField *pwdPromptQTF = [[UITextField alloc] init];
    pwdPromptQTF.textColor = fontColor;
    pwdPromptQTF.delegate = self;
    pwdPromptQTF.placeholder = @"请输入密码提示的问题";
    pwdPromptQTF.tag = 1011;
    [self.view addSubview:pwdPromptQTF];
    
    UIImageView *line6ImgV = [[UIImageView alloc] init];
    line6ImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:line6ImgV];
    
    //密码提示答案
    UIImageView *pwdPromptAV  = [[UIImageView alloc] init];
    pwdPromptAV.image = [UIImage imageNamed:@"wentidaan"];
    [self.view addSubview:pwdPromptAV];
    
    UITextField *pwdPromptATF = [[UITextField alloc] init];
    pwdPromptATF.textColor = fontColor;
    pwdPromptATF.delegate = self;
    pwdPromptATF.tag = 1012;
    pwdPromptATF.placeholder = @"请输入密码提示的答案";
    [self.view addSubview:pwdPromptATF];
    
    UIImageView *line7ImgV = [[UIImageView alloc] init];
    line7ImgV.image = [UIImage imageNamed:@"hengxian"];
    [self.view addSubview:line7ImgV];
    
    //许可协议
    UIButton *procotolBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [procotolBtn setImage:[UIImage imageNamed:@"gouxuan_normal"] forState:UIControlStateNormal];
    [procotolBtn addTarget:self action:@selector(agreeAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:procotolBtn];
    
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectZero];
    lab1.text = @"我已阅读并同意以下\n《阀门商城服务条款》《阀门商城隐私政策》";
    lab1.lineBreakMode = NSLineBreakByWordWrapping;
    lab1.numberOfLines = 0;
    lab1.textColor = fontColor;
    lab1.font = UIFontMake(Factor_6(24/2));
    [self.view addSubview:lab1];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchDown];
    confirmBtn.titleLabel.font = UIFontMake(Factor_6(36/2));
    confirmBtn.backgroundColor = navBarColor;
    [self.view addSubview:confirmBtn];
    
    NSInteger top = [Util navBarHeight] + Factor_6(74/2);
    //约束
    [userIconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(top);
            make.left.mas_equalTo(Factor_6(30/2));
            make.width.mas_equalTo(Factor_6(41/2));
            make.height.mas_equalTo(Factor_6(41/2));
    }];
    
    [userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(userIconImgV).mas_offset(Factor_6(6/2));
        make.left.mas_equalTo(userIconImgV.mas_right).mas_offset(Factor_6(14/2));
        make.right.mas_equalTo(-Factor_6(80/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    
    [line1ImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(userIconImgV.mas_bottom).mas_offset(Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(719/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    
    //约束
    [phoneImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(line1ImgV.mas_bottom).mas_offset(Factor_6(56/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];
    
   
    
    [regionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(phoneImgV).mas_offset(Factor_6(4/2));
        make.left.mas_equalTo(phoneImgV.mas_right).mas_offset(Factor_6(14/2));
        make.width.mas_equalTo(Factor_6(79/2));
        make.height.mas_equalTo(Factor_6(23/2));
    }];
    
    [phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(regionBtn.mas_top).mas_offset(-Factor_6(4/2));
        make.left.mas_equalTo(regionBtn.mas_right).mas_offset(Factor_6(12/2));
        make.right.mas_equalTo(-Factor_6(80/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    
    [line2ImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(phoneImgV.mas_bottom).mas_offset(Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(719/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    [pwdImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(line2ImgV.mas_bottom).mas_offset(Factor_6(56/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];
    
    [HlineImgV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(pwdImgV.mas_top).mas_offset(Factor_6(4/2));
        make.left.mas_equalTo(pwdImgV.mas_right).mas_offset(Factor_6(14/2));
        make.width.mas_equalTo(Factor_6(2/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    
    [pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(pwdImgV.mas_top);
        make.left.mas_equalTo(HlineImgV1.mas_right).mas_offset(Factor_6(4/2));
        make.right.mas_equalTo(-Factor_6(80/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    [secretBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(line2ImgV.mas_bottom).mas_offset(Factor_6(65/2));
        make.right.mas_equalTo(-Factor_6(40/2));
        make.width.mas_equalTo(Factor_6(31/2));
        make.height.mas_equalTo(Factor_6(22/2));
    }];
    
    [line3ImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(pwdImgV.mas_bottom).mas_offset(Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(719/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    [confirmPwdImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(line3ImgV.mas_bottom).mas_offset(Factor_6(56/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];
    
    [HlineImgV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(confirmPwdImgV.mas_top).mas_offset(Factor_6(4/2));
        make.left.mas_equalTo(pwdImgV.mas_right).mas_offset(Factor_6(14/2));
        make.width.mas_equalTo(Factor_6(2/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    
    [confirmpwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(confirmPwdImgV.mas_top);
        make.left.mas_equalTo(HlineImgV2.mas_right).mas_offset(Factor_6(4/2));
        make.right.mas_equalTo(-Factor_6(80/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    [secretBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(line3ImgV.mas_bottom).mas_offset(Factor_6(65/2));
        make.right.mas_equalTo(-Factor_6(40/2));
        make.width.mas_equalTo(Factor_6(31/2));
        make.height.mas_equalTo(Factor_6(22/2));
    }];
    
    [line4ImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(confirmPwdImgV.mas_bottom).mas_offset(Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(719/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    [emailImgV mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(line4ImgV.mas_bottom).mas_offset(Factor_6(56/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];

    [emailTF mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(emailImgV).mas_offset(Factor_6(4/2));
        make.left.mas_equalTo(emailImgV.mas_right).mas_offset(Factor_6(14/2));
        make.right.mas_equalTo(-Factor_6(80/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];

    [line5ImgV mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.mas_equalTo(emailImgV.mas_bottom).mas_offset(Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(719/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    [pwdPromptQV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(line5ImgV.mas_bottom).mas_offset(Factor_6(56/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];
    
    [pwdPromptQTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(pwdPromptQV).mas_offset(Factor_6(4/2));
        make.left.mas_equalTo(pwdPromptQV.mas_right).mas_offset(Factor_6(14/2));
        make.right.mas_equalTo(-Factor_6(80/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    
    [line6ImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(pwdPromptQV.mas_bottom).mas_offset(Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(719/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    [pwdPromptAV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(line6ImgV.mas_bottom).mas_offset(Factor_6(56/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];
    
    [pwdPromptATF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(pwdPromptAV).mas_offset(Factor_6(4/2));
        make.left.mas_equalTo(pwdPromptAV.mas_right).mas_offset(Factor_6(14/2));
        make.right.mas_equalTo(-Factor_6(80/2));
        make.height.mas_equalTo(Factor_6(30/2));
    }];
    
    [line7ImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(pwdPromptAV.mas_bottom).mas_offset(Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(719/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    [procotolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line7ImgV.mas_bottom).mas_offset(Factor_6(25/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];
    
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(procotolBtn.mas_top).mas_offset(-Factor_6(20/2));
        make.left.mas_equalTo(procotolBtn.mas_right).mas_offset(Factor_6(14/2));
        make.right.mas_equalTo(-Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(100/2));
    }];
    
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(procotolBtn.mas_bottom).mas_offset(Factor_6(50/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.right.mas_equalTo(-Factor_6(30/2));
        make.height.mas_equalTo(Factor_6(115/2));
    }];
}


#pragma  mark - 确定按钮
-(void) registerAction:(UIButton *)btn{
    
    [self.view endEditing:YES];
    if (![self checkText]) {
        return ;
    }
    NSDictionary *paramDic = @{
                               @"username":_userName,
                               @"password" : _pwd,
                               @"email" : _email,
                               @"phone" :_phone ,
                               @"question":_pwdpromptQ,
                               @"answer":_pwdpromptQ
                               };
    [MBProgressHUD zAlertProgress:@"正在注册……"];
    [NetWorkTool requestForRegisterWithParamDic:paramDic Success:^(id responseBody) {
        
        [MBProgressHUD zAlertHideHUD];
        if ([responseBody[@"status"] integerValue] == 0) {
            
            [MBProgressHUD zAlertSuccess:responseBody[@"msg"]];
            LoginViewController *loginVC = [[LoginViewController alloc] init];
            [self.navigationController pushViewController:loginVC animated:YES];
            
        }else{
            [MBProgressHUD zAlertError:responseBody[@"msg"]];
        }
    } Failure:^(NSError *error) {
        [MBProgressHUD zAlertHideHUD];
        [MBProgressHUD zAlertError:@"网络请求失败，请检查网络"];
    }];
    
    NSLog(@"单击了确定按钮");
}

-(BOOL) checkText{
    
    if (!_userName) {
        [MBProgressHUD zAlertError:@"用户名不能为空"];
        return NO;
    }else if (_userName.length < 6 || _userName.length > 18){
        [MBProgressHUD zAlertError:@"用户名长度为6~18位"];
        return NO;
    }
    else if (![NSObject checkUserName:_userName]){
        [MBProgressHUD zAlertError:@"用户名只能包含字母、数字、下划线"];
        return NO;
    }else if (!_phone){
        [MBProgressHUD zAlertError:@"手机号不能为空"];
        return NO;
    }
    else if (![NSObject checkTelNumber:_phone]){
        [MBProgressHUD zAlertError:@"手机号格式不正确"];
        return NO;
    }else if (!_pwd){
        [MBProgressHUD zAlertError:@"密码不能为空"];
        return NO;
    }
    else if (![NSObject checkPassword:_pwd]){
        [MBProgressHUD zAlertError:@"密码只能包含字母、数字、下划线，且长度为6~18"];
        return NO;
    }else if (!_repwd){
        [MBProgressHUD zAlertError:@"确认密码不能为空"];
        return NO;
    }
    else if (![NSObject checkPassword:_repwd]){
        [MBProgressHUD zAlertError:@"确认密码只能包含字母、数字、下划线，且长度为6~18"];
        return NO;
    }else if (![_repwd isEqualToString:_pwd]){
        
        [MBProgressHUD zAlertError:@"确认密码要与原密码一致"];
        return NO;
    }
    else if (_email.length == 0){
        [MBProgressHUD zAlertError:@"邮箱不能为空"];
        return NO;
    }
    else if (![NSObject validateEmail:_email]){
        [MBProgressHUD zAlertError:@"邮箱格式不正确"];
        return NO;
    }else if (!_pwdpromptQ){
        
        [MBProgressHUD zAlertError:@"密码提示的问题不能为空"];
        return NO;
    }else if (!_pwdpromptAN){
        [MBProgressHUD zAlertError:@"密码提示的答案不能为空"];
        return NO;
    }
    else if (!_isAgree){
        [MBProgressHUD zAlertError:@"您需要同意阀门商城协议来继续注册"];
        return NO;
    }
    return YES;
}
#pragma mark - 是否同意协议
-(void) agreeAction:(UIButton *) btn{
    
     btn.selected = !btn.selected;
    if (btn.selected) {
        _isAgree = YES;
        [btn setImage:[UIImage imageNamed:@"gouxuan_selected"] forState:UIControlStateNormal];
    }else{
        _isAgree = NO;
         [btn setImage:[UIImage imageNamed:@"gouxuan_normal"] forState:UIControlStateNormal];
    }
   
    
}

#pragma mark - 显示/隐藏密码
-(void) pdwShowAction:(UIButton *) sender{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        [sender setImage:[UIImage imageNamed:@"yanjing"] forState:UIControlStateNormal];
        if (sender.tag == 1013) {
            UITextField *pwdTF = [self.view viewWithTag:1009];
            pwdTF.secureTextEntry = NO;
        }else if (sender.tag == 1014){
            UITextField *pwdTF = [self.view viewWithTag:1008];
            pwdTF.secureTextEntry = NO;
        }
        NSLog(@"显示");
    }else{
        [sender setImage:[UIImage imageNamed:@"guangbi"] forState:UIControlStateNormal];
        if (sender.tag == 1013) {
            UITextField *pwdTF = [self.view viewWithTag:1009];
            pwdTF.secureTextEntry = YES;
        }else if (sender.tag == 1014){
            UITextField *pwdTF = [self.view viewWithTag:1008];
            pwdTF.secureTextEntry = YES;
        }
        NSLog(@"隐藏");
    }
    
   
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    
    switch (textField.tag) {
        case 1006:
             _userName = textField.text;
            break;
        case 1007:
            _phone = textField.text;
            break;
        case 1008:
            _pwd = textField.text;
            break;
        case 1009:
            _repwd = textField.text;
            break;
        case 1010:
            _email = textField.text;
            break;
        case 1011:
            _pwdpromptQ = textField.text;
            break;
        case 1012:
            _pwdpromptAN = textField.text;
            break;
        default:
            break;
    }
}
//-(void) viewWillAppear:(BOOL)animated{
//
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
