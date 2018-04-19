//
//  HomeViewController.m
//  FYFM
//
//  Created by mac_123 on 2018/3/27.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTopHeadView.h"
#import <WebKit/WebKit.h>

@interface HomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) HomeTopHeadView *topNavView;
@property(nonatomic,strong) UIScrollView *myScrollView;

@property(nonatomic,strong) WKWebView *webView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加注释
    

    
    self.title = @"首页";

//    [self.view addSubview:self.myScrollView];
//    [self.myScrollView addSubview:self.topNavView];
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kmainScreenWidth, kmainScreenHeight)];
//    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
//    _webView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://116.62.200.11/Mobile/"]];
    [_webView loadRequest:request];
}



#pragma mark - lazyers
-(HomeTopHeadView *) topNavView{
    if (!_topNavView) {
        _topNavView = [[HomeTopHeadView alloc] initWithFrame:CGRectMake(0,0,kmainScreenWidth,Factor_6(400))];
    }
    return _topNavView;
}

-(UIScrollView *) myScrollView{
    
    if (!_myScrollView) {
        
        _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0 ,[Util navBarHeight] ,kmainScreenWidth, kmainScreenHeight)];
//        _myScrollView.backgroundColor = [UIColor cyanColor];
        _myScrollView.contentSize = CGSizeMake(kmainScreenWidth, kmainScreenHeight*2);
    }
    return _myScrollView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle) preferredStatusBarStyle{

    return UIStatusBarStyleLightContent;
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
