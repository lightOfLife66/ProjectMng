//
//  BaseSearchViewController.m
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "BaseSearchViewController.h"
#import "HomeTopHeadView.h"

@interface BaseSearchViewController ()

@end

@implementation BaseSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setBaseUpUI];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBaseUpUI {
    UIView* stateView = [[UIView alloc] initWithFrame:CGRectMake(0,0, kmainScreenWidth, Factor_6(20))];
    stateView.backgroundColor = statusColor;
    [self.view addSubview:stateView];
    _navBarView = [[TopNavBarTitleView alloc] init];
    _navBarView.frame = CGRectMake(0, Factor_6(20), [Util mainScreenWidth], [Util navBarHeight] - Factor_6(20));
    _navBarView.searchTextField.delegate = self;
    [_navBarView.searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_navBarView.searchTextField.rightButton addTarget:self action:@selector(searchClicked:) forControlEvents:UIControlEventTouchUpInside];

    //    [_navBarView.searchTextField addTarget:self action:@selector(textFieldWillChange:) forControlEvents:UIControlEventEditingDidBegin];
    [self.navBarView.listButton addTarget:self action:@selector(listClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_navBarView];
    
    _navBarView.searchTextField.placeholder = [self isKindOfClass:NSClassFromString(@"HomeViewController")] ? @"搜索您感兴趣的商品" : @"档口名";
    
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;

    
}

- (void)setSearchLeftImageView:(NSString *)name {
    [_navBarView.searchTextField setLeftImage:[UIImage imageNamed:name]];
}

#pragma mark -
//- (void)textFieldWillChange:(UITextField *)textField {
//
//}

- (void)textFieldDidChange:(UITextField *)textField {
    if (!_isShowKeyboard) {
        return;
    }
}

#pragma mark -
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    if (!_isShowKeyboard) {
//
//        NSLog(@"跳转到搜索");
//        return NO;
//    }
    NSLog(@"跳转到搜索");
    return YES;
}


#pragma mark - on click
- (void)searchClicked:(UIButton *)sender {
   
    NSLog(@"跳转到搜索页面");

}

#pragma mark - UIImagePickerControllerDelegate
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    UIImage *image = [UIImage yt_imageSizeWithScreenImage:info[UIImagePickerControllerOriginalImage]];
//    //info[UIImagePickerControllerOriginalImage]
//    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];
//    NSData *data = UIImagePNGRepresentation(image);
//    NSArray *features = [detector featuresInImage:[CIImage imageWithData:data]];
//    if (features.count == 0 || features == nil) {
//        [picker dismissViewControllerAnimated:YES completion:nil];
//    }else {
//        for (int i = 0; i < features.count; i++) {
//            CIQRCodeFeature *feature = [features objectAtIndex:i];
//            NSString *resultStr = feature.messageString;
//            YTLog(@"%@",resultStr);
//        }
//        [picker dismissViewControllerAnimated:YES completion:nil];
//    }
//}

//列表按钮响应方法
- (void)listClicked:(UIButton *) sender {
    NSLog(@"单击了列表按钮");
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
