//
//  VerityLoopView.h
//  FYFM
//
//  Created by mac_123 on 2018/4/3.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "BaseView.h"

@class HomeVerityLoopView;

@protocol HomeVerityLoopViewDelegate<NSObject>
- (void)homeVerityLoopView:(HomeVerityLoopView *)loopView isClickUp:(BOOL)isUp didSelectItemAtIndex:(NSInteger)index;
@end

@interface HomeVerityLoopView : BaseView


@property(weak,nonatomic) id<HomeVerityLoopViewDelegate> clickDelegate;

@end
