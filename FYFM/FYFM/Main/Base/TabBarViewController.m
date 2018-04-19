//
//  TabBarViewController.m
//  FYFM
//
//  Created by mac_123 on 2018/3/27.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "CartViewController.h"
#import "MeViewController.h"
#import "ContastViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    CartViewController *cartVC = [[CartViewController alloc] init];
    MeViewController *meVC = [[MeViewController alloc] init];
    ContastViewController *contastVC = [[ContastViewController alloc] init];
    
    //为两个视图控制器添加导航栏控制器
    UINavigationController *navHome = [[UINavigationController alloc]initWithRootViewController:homeVC];
    UINavigationController *navCart = [[UINavigationController alloc]initWithRootViewController:cartVC];
    UINavigationController *navMe = [[UINavigationController alloc]initWithRootViewController:meVC];
    UINavigationController *navContact = [[UINavigationController alloc] initWithRootViewController:contastVC];
    
    NSArray *VCMArr = [NSArray arrayWithObjects:navHome,navCart,navContact,navMe, nil];
    NSMutableArray *VCS = [[NSMutableArray alloc] init];
    NSArray *titleArr = [NSArray arrayWithObjects:@"首页",@"购物车",@"咨询",@"我的", nil];
    for (int i = 0; i < VCMArr.count; i++) {
        
        UINavigationController *navVC = VCMArr[i];
        switch (i) {
            case 0:
                navHome.tabBarItem.image = [[UIImage imageNamed:@"home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navHome.tabBarItem.selectedImage = [[UIImage imageNamed:@"home_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navHome.title = titleArr[i];
                
                break;
            case 1:
                navCart.tabBarItem.image = [[UIImage imageNamed:@"cart_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navCart.tabBarItem.selectedImage = [[UIImage imageNamed:@"cart_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navCart.title = titleArr[i];
                break;
            case 2:
                navContact.tabBarItem.image = [[UIImage imageNamed:@"Contast_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navContact.tabBarItem.selectedImage = [[UIImage imageNamed:@"Contast_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navContact.title = titleArr[i];
                break;
            case 3:
                navMe.tabBarItem.image = [[UIImage imageNamed:@"me_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navMe.tabBarItem.selectedImage = [[UIImage imageNamed:@"me_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                navMe.title = titleArr[i];
                break;
                
            default:
                break;
        }
        [VCS addObject:navVC];
    }
    //改变tabbarController 文字选中颜色(默认渲染为蓝色)
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#076d91"]} forState:UIControlStateSelected];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    self.viewControllers = VCS;
    
    //去掉tabbar黑线
//    [UITabBar appearance].clipsToBounds = YES;
//    [UINavigationBar appearance].clipsToBounds = YES;
    
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
