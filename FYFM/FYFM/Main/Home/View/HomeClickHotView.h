//
//  HomeClickHotView.h
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "BaseView.h"

@class HomeHotClickView;

@protocol HomeHotClickViewDelegate<NSObject>
- (void)homeHotCilckView:(HomeHotClickView *)hotView didSelectItemAtIndex:(NSInteger)index;
@end

@interface HomeHotClickView : BaseView
@property (strong, nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (assign, nonatomic) UIEdgeInsets colletionViewContentInset;
@property (assign, nonatomic) BOOL isAddHomeView; //是否是加载在homeView 上面 默认 YES
@property (weak, nonatomic) id<HomeHotClickViewDelegate> cilckDelegate;
@property (strong, nonatomic, readonly) NSArray *dataSource;
@end

