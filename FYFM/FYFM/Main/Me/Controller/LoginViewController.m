//
//  LoginViewController.m
//  FYFM
//
//  Created by mac_123 on 2018/4/8.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginTableViewCell.h"
#import "RegisterViewController.h"

@interface LoginViewController ()<UITableViewDataSource,UITableViewDelegate,getTextFiledDelegate>

@property(nonatomic,strong) UITableView *myTableView;

@property(nonatomic,copy) NSString *phone;
@property(nonatomic,copy) NSString *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView* stateView = [[UIView alloc] initWithFrame:CGRectMake(0,-Factor_6(20), kmainScreenWidth, Factor_6(20))];
    stateView.backgroundColor = statusColor;
    
//    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.myTableView];
    [self.myTableView addSubview:stateView];
    self.myTableView.scrollEnabled = NO;
    UIView *footView = [UIView new];
    self.myTableView.tableFooterView = footView;
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.width.mas_equalTo(kmainScreenWidth);
        make.height.mas_equalTo(Factor_6(674/2));
    }];
    
    [self setHeadView];
    
    [self createBottomView];
}

#pragma mark - 底部视图
-(void) createBottomView{
    
    UIButton *forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [forgetPwdBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPwdBtn setTitleColor:midGrayColor forState:UIControlStateNormal];
    forgetPwdBtn.titleLabel.font = UIFontMake(Factor_6(24/2));
    [forgetPwdBtn addTarget:self action:@selector(fogetPwdAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:forgetPwdBtn];
    [forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.myTableView.mas_bottom).mas_offset(Factor_6(53/2));
        make.right.mas_equalTo(-Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(112/2));
        make.height.mas_equalTo(Factor_6(24/2));
    }];
    
    //login
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setImage:[UIImage imageNamed:@"denglu"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.myTableView.mas_bottom).mas_offset(Factor_6(136/2));
        make.right.mas_equalTo(-Factor_6(30/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.height.mas_equalTo(Factor_6(88/2));
    }];
    
    //3方登录
    UILabel *leftLab = [[UILabel alloc] initWithFrame:CGRectZero];
    leftLab.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self.view addSubview:leftLab];
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(loginBtn.mas_bottom).mas_offset(Factor_6(106/2));
        make.width.mas_equalTo(Factor_6(275/2));
        make.left.mas_equalTo(self.view);
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    UILabel *midLab = [[UILabel alloc] initWithFrame:CGRectZero];
    midLab.text = @"其他方式登录";
    midLab.textColor = midGrayColor;
    midLab.font = UIFontMake(Factor_6(24/2));
    [self.view addSubview:midLab];
    [midLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(leftLab.mas_top).mas_offset(-Factor_6(14/2));
        make.width.mas_equalTo(Factor_6(148/2));
        make.left.mas_equalTo(leftLab.mas_right).mas_offset(Factor_6(30/2));
        make.height.mas_equalTo(Factor_6(24/2));
    }];
    
    UILabel *rightLab = [[UILabel alloc] initWithFrame:CGRectZero];
    rightLab.backgroundColor = [UIColor colorWithHexString:@"e1e1e1"];
    [self.view addSubview:rightLab];
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(leftLab);
        make.right.mas_equalTo(self.view);
        make.left.mas_equalTo(midLab.mas_right).mas_offset(Factor_6(30/2));
        make.height.mas_equalTo(Factor_6(2/2));
    }];
    
    //qq
    UIButton *qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [qqBtn setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    [qqBtn addTarget:self action:@selector(AtherLoginAction:) forControlEvents:UIControlEventTouchDown];
    qqBtn.tag = 1003;
    [self.view addSubview:qqBtn];
    [qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(leftLab.mas_bottom).mas_offset(Factor_6(47/2));
        make.left.mas_equalTo(Factor_6(120/2));
        make.width.mas_equalTo(Factor_6(68/2));
        make.height.mas_equalTo(Factor_6(68/2));
    }];
    
    //微信
    UIButton *weixinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [weixinBtn setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    [weixinBtn addTarget:self action:@selector(AtherLoginAction:) forControlEvents:UIControlEventTouchDown];
    weixinBtn.tag = 1004;
    [self.view addSubview:weixinBtn];
    [weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(qqBtn);
        make.left.mas_equalTo(qqBtn.mas_right).mas_offset(Factor_6(150/2));
        make.width.mas_equalTo(Factor_6(68/2));
        make.height.mas_equalTo(Factor_6(68/2));
    }];
    
    //微博
    UIButton *weiboBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [weiboBtn setImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    [weiboBtn addTarget:self action:@selector(AtherLoginAction:) forControlEvents:UIControlEventTouchDown];
    weiboBtn.tag = 1005;
    [self.view addSubview:weiboBtn];
    [weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(qqBtn);
        make.left.mas_equalTo(weixinBtn.mas_right).mas_offset(Factor_6(150/2));
        make.width.mas_equalTo(Factor_6(68/2));
        make.height.mas_equalTo(Factor_6(68/2));
    }];
}

#pragma mark - 表头部视图
-(void) setHeadView{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kmainScreenWidth, Factor_6(368/2))];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:headView.frame];
    imageView.image = [UIImage imageNamed:@"headImg"];
    [headView addSubview:imageView];
    self.myTableView.tableHeaderView = headView;
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setImage:[UIImage imageNamed:@"zhuce"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchDown];
    [headView addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(Factor_6(62/2));
        make.right.mas_equalTo(-Factor_6(30/2));
        make.height.mas_equalTo(Factor_6(50/2));
        make.height.mas_equalTo(Factor_6(85/2));
    }];
    
}

#pragma mark - qq、微信、微博登录
-(void) AtherLoginAction:(UIButton *) btn{
    
    switch (btn.tag) {
        case 1003:
            NSLog(@"点击了qq登录");
            break;
        case 1004:
            NSLog(@"点击了微信登录");
            break;
        case 1005:
            NSLog(@"点击了微博登录");
        default:
            break;
    }
}

#pragma mark - 登录
-(void) loginAction:(UIButton *) btn{
    
    if (!_phone) {
        [MBProgressHUD zAlertError:@"用户名不能为空"];
        return ;
    }else if (!_password){
        [MBProgressHUD zAlertError:@"密码不能为空"];
        return ;
    }
    NSDictionary *paramDic = @{
                               @"username" : _phone,
                               @"password" : _password
                               };
    [MBProgressHUD zAlertProgress:@"正在登录……"];
    [NetWorkTool requestForLoginWithParamDic:paramDic Success:^(id responseBody) {
        
        [MBProgressHUD zAlertHideHUD];
        if ([responseBody[@"status"] integerValue] == 0) {
//            [UserDefaultsTool setValue:_phone forKey:phone];
//            [UserDefaultsTool setValue:_password forKey:password];
            [MBProgressHUD zAlertSuccess:responseBody[@"msg"]];
        }else{
            [MBProgressHUD zAlertSuccess:responseBody[@"msg"]];
        }
    } Failure:^(NSError *error) {
        [MBProgressHUD zAlertHideHUD];
        [MBProgressHUD zAlertError:@"网络请求失败，请检查网络"];
    }];
    NSLog(@"点击了登录");
}


#pragma mark - 跳转到修改密码界面
-(void) fogetPwdAction:(UIButton *) btn{
    
    NSLog(@"点击了修改密码");
}

#pragma mark - 注册
-(void) registerAction:(UIButton *) btn{
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
    NSLog(@"点击了注册");
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


#pragma mark - UITableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoginCellId"];
    if (cell == nil) {
        cell = [[LoginTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LoginCellId"];
    }
    cell.indexPath = indexPath;
    cell.getTextDelegat = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        cell.isShowRegionBtn = YES;
        cell.textFiled.placeholder = @"请输入手机号码";
    }else{
        cell.isShowRegionBtn = NO;
        cell.textFiled.placeholder = @"请输入登录密码";
        __weak typeof(LoginTableViewCell) *weakCell = cell;
        cell.showPwdBlock = ^(UIButton *btn) {
            
            btn.selected = !btn.selected;
            UITextField *pwdTF = [weakCell viewWithTag:1015];
            if (btn.selected) {
                [btn setImage:[UIImage imageNamed:@"yanjing"] forState:UIControlStateNormal];
                pwdTF.secureTextEntry = NO;
                
            }else{
                [btn setImage:[UIImage imageNamed:@"guangbi"] forState:UIControlStateNormal];
                pwdTF.secureTextEntry = YES;
            }
        };
    }
    return cell;
}


//-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//    return Factor_6(368);
//}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        
        return Factor_6(149/2);
    }else{
        return Factor_6(118/2);
    }
}

#pragma mark - getTextFiledDelegate
- (void)editCell:(LoginTableViewCell *)cell indexPath:(NSIndexPath *)indexPath inputText:(NSString *)text {
    
    if (indexPath.row == 0) {
        _phone = text;
    }else{
        _password = text;
    }
}

#pragma mark - lazyer
-(UITableView *) myTableView{
    
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
    }
    return _myTableView;
}

-(UIStatusBarStyle) preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
