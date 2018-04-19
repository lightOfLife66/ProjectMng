//
//  HomeClickHotView.m
//  FYFM
//
//  Created by mac_123 on 2018/4/2.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "HomeClickHotView.h"
#import "HomeHotCollectionViewCell.h"
//#import "MineListHeadStatusCollectionCell.h"

@interface HomeHotClickView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *hotColletionView;

@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation HomeHotClickView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _isAddHomeView = YES;
        [self setUI];
    }
    return self;
}

-(void) setUI{
    
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.itemSize = CGSizeMake(Factor_6(50), Factor_6(60));
    //    flowLayout.minimumLineSpacing = Factor_6(40);
    
    _flowLayout.minimumInteritemSpacing = Factor_6(40);
    //    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _hotColletionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [Util mainScreenWidth], Factor_6(100)) collectionViewLayout:_flowLayout];
    _hotColletionView.contentInset = UIEdgeInsetsMake(Factor_6(20), Factor_6(24), Factor_6(20), Factor_6(26));
    _hotColletionView.backgroundColor = [UIColor whiteColor];
    [_hotColletionView registerClass:[HomeHotCollectionViewCell class] forCellWithReuseIdentifier:@"HomeHotCollectionViewCellID"];
//    [_hotColletionView registerClass:[MineListHeadStatusCollectionCell class] forCellWithReuseIdentifier:@"MineListHeadStatusCollectionCellID"];
    
    _hotColletionView.delegate = self;
    _hotColletionView.dataSource = self;
    _hotColletionView.scrollEnabled = NO;
    [self addSubview:_hotColletionView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_hotColletionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

        HomeHotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeHotCollectionViewCellID" forIndexPath:indexPath];
        cell.dic = self.dataSource[indexPath.row];
        return cell;
    
    
}

- (void)setColletionViewContentInset:(UIEdgeInsets)colletionViewContentInset {
    _colletionViewContentInset = colletionViewContentInset;
    _hotColletionView.contentInset = colletionViewContentInset;
    [_hotColletionView reloadData];
}

- (void)setFlowLayout:(UICollectionViewFlowLayout *)flowLayout {
    _flowLayout = flowLayout;
    if (_flowLayout.collectionView != nil) {
        [_hotColletionView reloadData];
    }
}

- (void)setIsAddHomeView:(BOOL)isAddHomeView {
    if (isAddHomeView == YES ) return;
    _isAddHomeView = isAddHomeView;
    [_hotColletionView reloadData];
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    if (self.cilckDelegate && [self.cilckDelegate respondsToSelector:@selector(homeHotCilckView:didSelectItemAtIndex:)]) {
        [self.cilckDelegate homeHotCilckView:self didSelectItemAtIndex:indexPath.row];
    }
}



- (NSArray *)dataSource {
//    if (_isAddHomeView) {
        return @[@{
                     @"title" : @"新品上架",
                     @"imageName" : @"xinpin",
//                     @"vc" : @"HomeLookStyleViewController"
                     },
                 @{
                     @"title" : @"店长推荐",
                     @"imageName" : @"tuijian",
//                     @"vc" : @"HomeNewMarketViewController"
                     },
                 @{
                     @"title" : @"热卖好评",
                     @"imageName" : @"haoping",
                     //                     @"vc" : @"HomeMarketViewController"
//                     @"vc" : @"MineVeotViewController"
                     },
                 @{
                     @"title" : @"商品分类",
                     @"imageName" : @"fenlei",
//                     @"vc" : @"WebViewController"
                     }];
//    }
    
//    return @[@{
//                 @"title" : @"待付款",
//                 @"imageName" : @"mine_payment",
//                 @"vc" : @"HomeMarketViewController"
//                 },
//             @{
//                 @"title" : @"待发货",
//                 @"imageName" : @"mine_received",
//                 @"vc" : @"HomeMarketViewController"
//                 },
//             @{
//                 @"title" : @"待收货",
//                 @"imageName" : @"mine_distribution",
//                 @"vc" : @"HomeMarketViewController"
//                 },
//             @{
//                 @"title" : @"待退款",
//                 @"imageName" : @"mine_return",
//                 @"vc" : @"HomeMarketViewController"
//                 }];
//
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
