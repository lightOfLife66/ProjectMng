//
//  UIImageView+UIExtension.m
//  ClassificationDemo
//
//  Created by 袁涛 on 2017/11/30.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import "UIImageView+UIExtension.h"

@implementation UIImageView (UIExtension)
#ifdef DEBUG
+ (UIImageView *)createCenterImageOfImageView {
    UIImageView *imageView = [[[self class] alloc] init];
    [imageView setContentScaleFactor:ScreenScale];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingNone;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"zhanwei"];
//    imageView.backgroundColor = [UIColor blueColor];

    return imageView;
}
#else
+ (UIImageView *)createCenterImageOfImageView {
    UIImageView *imageView = [[[self class] alloc] init];
    [imageView setContentScaleFactor:ScreenScale];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingNone;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"zhanwei"];
    return imageView;
}
#endif

+ (UIImageView *)createImageViewToImageName:(NSString *)imageName {
    UIImageView *imageView = [[[self class] alloc] init];
    [imageView setImage:[UIImage imageNamed:imageName]];
    return imageView;
}


@end
