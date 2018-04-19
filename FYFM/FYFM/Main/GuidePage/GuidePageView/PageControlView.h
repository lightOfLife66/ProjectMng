//
//  PageControlView.h
//  CCPageControl
//
//  Created by hhf on 2018/4/17.
//  Copyright © 2018年 cccc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControlView : UIView
+(PageControlView *)instance;
- (instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionV;
@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UIPageControl *pageV;

@property (weak, nonatomic) IBOutlet UIButton *skipBtn;

@property(nonatomic,copy) void(^finish)(void);

@end
