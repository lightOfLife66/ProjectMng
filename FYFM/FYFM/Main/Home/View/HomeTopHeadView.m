//
//  TopNavView.m
//  FYFM
//
//  Created by mac_123 on 2018/3/31.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "HomeTopHeadView.h"
#import <SDCycleScrollView.h>
#import "HomeClickHotView.h"
#import "HomeVerityLoopView.h"

@interface HomeTopHeadView()<SDCycleScrollViewDelegate,HomeHotClickViewDelegate,HomeVerityLoopViewDelegate>

@property (strong, nonatomic) SDCycleScrollView *cycleScrollView; //轮播
@property (strong,nonatomic) HomeHotClickView *homeHotClickView;
@property (strong,nonatomic) HomeVerityLoopView *homeLoopView;

@end

@implementation HomeTopHeadView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}

-(void) createUI{
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kmainScreenWidth, Factor_6(196)) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    // 情景二：采用网络图片实现
    self.imagesURLStrings = @[
                              @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                              @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                              @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522733750047&di=8f46c46929407b801a1061c1fd58435b&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F013fdb599bc5f3a8012156036305bd.jpg%402o.jpg"
                              ];
   
    
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.imageURLStringsGroup = self.imagesURLStrings;
    _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self addSubview:_cycleScrollView];
    //         --- 轮播时间间隔，默认2.0秒，可自定义
    _cycleScrollView.autoScrollTimeInterval = 1;
    _cycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        NSLog(@"点击了轮播图%ld",currentIndex);
    };
    _homeHotClickView = [[HomeHotClickView alloc] init];
    _homeHotClickView.cilckDelegate = self;

    [self addSubview:_homeHotClickView];
    
    _homeLoopView = [[HomeVerityLoopView alloc] init];
    _homeLoopView.clickDelegate = self;
    _homeLoopView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    [self addSubview:_homeLoopView];
    
    //添加约束
    [self createConstraint];
}

//
-(void) createConstraint{
    
    [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(Factor_6(398/2));
    }];
    [_homeHotClickView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(_cycleScrollView.mas_bottom);
        make.left.width.mas_equalTo(self);
        make.height.mas_equalTo(Factor_6(175/2));
    }];
    
    [_homeLoopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_homeHotClickView.mas_bottom);
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(Factor_6(120/2));
        make.width.mas_equalTo(kmainScreenWidth);
    }];
}



//四个按钮点击代理
- (void)homeHotCilckView:(HomeHotClickView *)hotView didSelectItemAtIndex:(NSInteger)index{
    
    NSLog(@"点击了第%ld个",index);
}


- (void)uploadADiMG {
//    if (self.viewModel.banarImages.count > 0) {
//
//        NSMutableArray *array = [NSMutableArray array];
//        for (HomeTopEntity *a in self.viewModel.banarImages) {
//            [array addObject:a.picpath];
//        }
//
//        _cycleScrollView.imageURLStringsGroup = array;
//    }
//
//    if (self.viewModel.adImages.count > 0) {
//        [_topHeaderADImageView sd_setImageWithURL:[NSURL URLWithString:self.viewModel.adImages[0].picpath] placeholderImage:[UIImage imageNamed:@"ad1"]];
//    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
