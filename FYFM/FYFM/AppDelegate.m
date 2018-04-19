//
//  AppDelegate.m
//  FYFM
//
//  Created by mac_123 on 2018/3/27.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "GuideViewController.h"
#import "PageControlView.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
   
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    TabBarViewController *tabVC = [[TabBarViewController alloc] init];
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    weakselfly(self);
    if (![UserAccount sharedUserAccount].isNotFirstLogin) {
        
        [UserAccount sharedUserAccount].isNotFirstLogin = YES;
        GuideViewController *guideVC = [[GuideViewController alloc] init];
        NSArray *arr = [NSArray arrayWithObjects:@"750x1334@2x_01",@"750x1334@2x_02",@"750x1334@2x_03", nil];
//        PageControlView *guidePageView = [[PageControlView alloc] initWithFrame:guideVC.view.frame andImageList:arr];
        PageControlView *guidePageView = [[PageControlView instance] initWithFrame:guideVC.view.frame andImageList:arr];
        [guideVC.view addSubview:guidePageView];
        self.window.rootViewController = guideVC;
        guidePageView.finish = ^{
            weakSelf.window.rootViewController = homeVC;
        };
    }else{
        self.window.rootViewController = homeVC;
    }
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
