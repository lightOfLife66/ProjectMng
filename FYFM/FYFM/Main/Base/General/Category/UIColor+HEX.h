//
//  UIColor+HEX.h
//  演示
//
//  Created by Will on 2017/7/28.
//  Copyright © 2017年 Will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)
+ (UIColor *) colorWithHexString: (NSString *)color;

+(UIColor *)randomColor;
@end
