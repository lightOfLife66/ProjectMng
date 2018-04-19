//
//  VerityLoopView.m
//  FYFM
//
//  Created by mac_123 on 2018/4/3.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "HomeVerityLoopView.h"
#import <SDCycleScrollView.h>


@interface HomeVerityLoopView ()<SDCycleScrollViewDelegate>
@property (strong, nonatomic) UIView *lineView;
//@property (nonatomic,strong) UIImageView *newsImgV;
@property (strong, nonatomic) SDCycleScrollView *titleCycleScrollView; //文字滚动轮播
@property (strong, nonatomic) SDCycleScrollView *bottomCycleScrollView;
@property (strong, nonatomic) UIButton *newsShowBtn;
@property (strong, nonatomic) UIButton *noticeButton;
@property (strong, nonatomic) UIButton *bottomNoticeButton;
@end

@implementation HomeVerityLoopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}

-(void) setUI{
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor colorWithHexString:@"#cccccc"];
//    _lineView.frame = CGRectMake(0, 0, [Util mainScreenWidth], 1);
    [self addSubview:_lineView];
    
    _newsShowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _newsShowBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_newsShowBtn setTitle:@"资讯\n热点" forState:UIControlStateNormal];
    [_newsShowBtn setTitleColor:[UIColor colorWithHexString:@"f89185"] forState:UIControlStateNormal];
    _newsShowBtn.titleLabel.font = UIFontMake(Factor_6(24/2));
    _newsShowBtn.backgroundColor = [UIColor whiteColor];
    [self addSubview:_newsShowBtn];
    
    _noticeButton = [[UIButton alloc] init];
    _noticeButton.titleLabel.font = UIFontMake(Factor_6(24/2));
    [self addSubview:_noticeButton];
    _noticeButton.layer.cornerRadius = Factor_6(6);
    _noticeButton.layer.borderColor = [UIColor colorWithHexString:@"f89185"].CGColor;
    _noticeButton.layer.borderWidth = Factor_6(1);
    [_noticeButton setTitle:@"超赞" forState:UIControlStateNormal];
    [_noticeButton setTitleColor:[UIColor colorWithHexString:@"f89185"] forState:UIControlStateNormal];
    _noticeButton.backgroundColor = [UIColor whiteColor];
    
    _bottomNoticeButton = [[UIButton alloc] init];
    _bottomNoticeButton.backgroundColor = [UIColor whiteColor];
    _bottomNoticeButton.titleLabel.font = _noticeButton.titleLabel.font;
    _bottomNoticeButton.layer.borderColor = [UIColor colorWithHexString:@"f89185"].CGColor;
    _bottomNoticeButton.layer.borderWidth = Factor_6(1);
    [_bottomNoticeButton setTitleColor:[UIColor colorWithHexString:@"f89185"] forState:UIControlStateNormal];
    
    [_bottomNoticeButton setTitle:@"热议" forState:UIControlStateNormal];
    [self addSubview:_bottomNoticeButton];
    _bottomNoticeButton.layer.cornerRadius = Factor_6(6);
    
    _titleCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(Factor_6(60), Factor_6(16.5), [Util mainScreenWidth] - Factor_6(140), Factor_6(15)) delegate:self placeholderImage:[UIImage new]];
    _titleCycleScrollView.tag = 1001;
    _titleCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    _titleCycleScrollView.onlyDisplayText = YES;
    _titleCycleScrollView.showPageControl = NO;
    _titleCycleScrollView.titleLabelTextColor = [UIColor blackColor];
    //    _titleCycleScrollView.titleLabelHeight
    //    _titleCycleScrollView.titleLabelTextFont
    _titleCycleScrollView.titleLabelBackgroundColor = [UIColor clearColor];
    _titleCycleScrollView.titleLabelTextAlignment = NSTextAlignmentLeft;
    _titleCycleScrollView.titlesGroup = @[@"111111111111",@"2222222222222",@"3333333333",@"4444444444"];
    [_titleCycleScrollView disableScrollGesture];
    [self addSubview:_titleCycleScrollView];
    
    _bottomCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(Factor_6(60), Factor_6(16.5)+Factor_6(20
                                                                                                                           ), [Util mainScreenWidth] - Factor_6(140), Factor_6(15)) delegate:self placeholderImage:[UIImage new]];
    _bottomCycleScrollView.tag = 1002;
    _bottomCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    _bottomCycleScrollView.onlyDisplayText = YES;
    _bottomCycleScrollView.showPageControl = NO;
    _bottomCycleScrollView.titleLabelTextColor = [UIColor blackColor];
    
    
    //    _titleCycleScrollView.titleLabelHeight
    //    _titleCycleScrollView.titleLabelTextFont
    _bottomCycleScrollView.titleLabelBackgroundColor = [UIColor clearColor];
    _bottomCycleScrollView.titleLabelTextAlignment = NSTextAlignmentLeft;
    _bottomCycleScrollView.titlesGroup = @[@"111111111111",@"2222222222222",@"3333333333",@"4444444444"];
//    [_bottomCycleScrollView disableScrollGesture];
    [self addSubview:_bottomCycleScrollView];
    
    _titleCycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        NSLog(@"点击了第一个轮播图%ld",currentIndex);
    };
    _bottomCycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        NSLog(@"点击了第二个轮播图%ld",currentIndex);

    };
    
    [self layoutUI];
}

-(void) cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    if (cycleScrollView.tag == 1001) {
            NSLog(@"点击了第一个的%ld张图",index);
        }else{
            NSLog(@"点击了第二个的%ld张图",index);
        }
}

-(void) layoutUI{
    
    [_newsShowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.top.equalTo(self).mas_offset(Factor_6(20));
        make.left.equalTo(self).mas_offset(Factor_6(20));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(Factor_6(90/2));
        make.height.mas_equalTo(Factor_6(90/2));
    }];
    
    [_noticeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_newsShowBtn.mas_right).mas_equalTo(Factor_6(18));
        make.top.equalTo(_newsShowBtn);
        make.width.mas_equalTo(Factor_6(45));
        make.height.mas_equalTo(Factor_6(20));
    }];
    
    [_bottomNoticeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.height.equalTo(_noticeButton);
        make.top.equalTo(_noticeButton.mas_bottom).mas_offset(Factor_6(5));
    }];
    
    [_titleCycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_noticeButton.mas_right).mas_equalTo(Factor_6(10));
        //        make.centerY.equalTo(_shopStatusIocnImage);
        make.top.equalTo(_newsShowBtn);
        make.height.equalTo(_noticeButton.mas_height);
        make.right.equalTo(self).mas_offset(-Factor_6(20));
    }];
    [_bottomCycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(_titleCycleScrollView);
        //        make.top.equalTo(_titleCycleScrollView.mas_bottom).mas_offset(Factor_6(5));
        make.bottom.equalTo(_newsShowBtn);
    }];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
