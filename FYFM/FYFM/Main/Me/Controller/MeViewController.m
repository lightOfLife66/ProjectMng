//
//  MeViewController.m
//  FYFM
//
//  Created by mac_123 on 2018/3/27.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "MeViewController.h"
#import "LoginViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    button.layer.cornerRadius = Factor_6(6);
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Factor_6(80));
        make.left.mas_equalTo(Factor_6(60));
        make.width.mas_equalTo(Factor_6(60));
        make.height.mas_equalTo(Factor_6(30));
    }];
    [button addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchDown];
}

-(void) loginAction:(UIButton *) btn{
    
    NSLog(@"点击了登录");
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self pushViewController:loginVC];
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
