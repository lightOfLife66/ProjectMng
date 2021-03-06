//
//  PageControlView.m
//  CCPageControl
//
//  Created by hhf on 2018/4/17.
//  Copyright © 2018年 cccc. All rights reserved.
//

#import "PageControlView.h"
#import "PageControlCollectionViewCell.h"

#define  kHighlighted [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]
#define kAfterDelayTime 0.3 //最后按钮显示的延迟时间
static NSString *reuseIdentifier = @"PageControlCollectionViewCell";
@interface PageControlView()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UIScrollViewDelegate
>
@property (strong , nonatomic) NSArray *imageArr;
@end

@implementation PageControlView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(PageControlView *)instance
{
    NSArray *nibView=[[NSBundle mainBundle]loadNibNamed:@"PageControlView" owner:self options:nil];
    return [nibView objectAtIndex:0];
}


- (instancetype)initWithFrame:(CGRect)frame andImageList:(NSArray *)arr{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置默认值
        self.frame = frame;
        self.backgroundColor = [UIColor brownColor];
        
        self.imageArr = arr;
        
        
        
        [self setViews];
        
    }
    return self;
}

- (void)setViews
{
    self.collectionV.frame = self.frame;
    self.collectionV.dataSource = self;
    self.collectionV.delegate = self;
    self.collectionV.pagingEnabled = YES;
    self.collectionV.showsHorizontalScrollIndicator = NO;
    
    self.collectionV.contentInset = UIEdgeInsetsMake(0, 0, 0, kmainScreenWidth);

    self.collectionV.bounces = NO;
    self.collectionV.showsVerticalScrollIndicator = NO;
    self.collectionV.showsHorizontalScrollIndicator = NO;
    [self.collectionV registerClass:[PageControlCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.skipBtn.backgroundColor = [UIColor clearColor];
    self.skipBtn.layer.masksToBounds = YES;
    self.skipBtn.layer.cornerRadius = 4;
    self.skipBtn.hidden = NO;
    self.skipBtn.layer.borderWidth = 1.0;
    self.skipBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    [self.skipBtn addTarget:self action:@selector(removeViewBtn:) forControlEvents:UIControlEventTouchDown];
    
    
    self.btn.frame = CGRectMake(0, 0, self.frame.size.width * 0.5, self.frame.size.height * 0.05);
    self.btn.center = CGPointMake(self.frame.size.width/2, kmainScreenHeight - Factor_6(280/2));
    self.btn.hidden = YES;
    self.btn.backgroundColor = [UIColor clearColor];
    self.btn.layer.masksToBounds = YES;

    self.btn.layer.cornerRadius = self.btn.frame.size.height/2;
    self.btn.layer.borderWidth = 1.0;
    self.btn.layer.borderColor=[UIColor whiteColor].CGColor;
    [self.btn addTarget:self action:@selector(buttonBackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
    [self.btn addTarget:self action:@selector(removeViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.btn setTitle:@"立即体验" forState:UIControlStateNormal];
}

-(void)btnHidden:(UIButton *)btn
{

    self.btn.hidden = NO;
    self.skipBtn.hidden = YES;
}

-(void)removeViewBtn:(UIButton *)sender
{
//    sender.backgroundColor = [UIColor clearColor];
    if (self.finish) {
        self.finish();
    }
    [self removeFromSuperview];
    
}

- (void)buttonBackGroundHighlighted:(UIButton *)sender
{
    sender.backgroundColor = kHighlighted;
}

#pragma mark - UICollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.imageArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UINib *nib = [UINib nibWithNibName:@"PageControlCollectionViewCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    PageControlCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

 
    cell.imageV.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    cell.imageV.image = [UIImage imageNamed:self.imageArr[indexPath.row]];
    
      return cell;
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
// 两行之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0;
    
}

// 两个cell之间的最小间距，是由API自动计算的，只有当间距小于该值时，cell会进行换行
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
}

#pragma mark - UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    

    if ((scrollView.contentOffset.x/self.frame.size.width)==self.imageArr.count-1){
        [self performSelector:@selector(btnHidden:) withObject:self.btn afterDelay:kAfterDelayTime];
    }
    else
    {
        self.btn.hidden=YES;
        self.skipBtn.hidden = NO;
    }
    
    if ((scrollView.contentOffset.x/self.frame.size.width)>self.imageArr.count-1) {
        if (self.finish) {
            self.finish();
        }
    }
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    if (self.collectionV.contentOffset.x == self.collectionV.contentSize.width) {
        if (self.finish) {
            self.finish();
        }
        [self removeFromSuperview];
    }
}


@end
