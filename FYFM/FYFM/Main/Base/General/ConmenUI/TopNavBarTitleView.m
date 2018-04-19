//
//  TopNavBarTitleView.m
//  cxfShopiOSApp
//
//  Created by 袁涛 on 2017/12/11.
//  Copyright © 2017年 Y_T. All rights reserved.
//

#import "TopNavBarTitleView.h"

#import "BaseButton.h"

@interface TopNavBarTitleView ()
@property (strong, nonatomic) UIImageView *bgImageView;
//@property (strong, nonatomic) CustomButton *locationsButton;
//@property (strong, nonatomic) CustomButton *messageButton;
@property (strong, nonatomic) BaseButton *searchClickButton;

@end


@implementation TopNavBarTitleView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
   
    _bgImageView = [[UIImageView alloc] init];
//    [_bgImageView setImage:[Util navBarBackgoundImage]];
    _bgImageView.backgroundColor = [UIColor colorWithHexString:@"#076d91"];
    [self addSubview:_bgImageView];
    
    _IconButton = [[UIButton alloc] init];
    
//    [_IconButton setImage:[UIImage imageNamed:@"home_location"] forState:UIControlStateNormal];
//    [_locationsButton setTitle:@"广州" forState:UIControlStateNormal];
    _IconButton.titleLabel.font = UIFontMake(11);
    _IconButton.backgroundColor = [UIColor purpleColor];
    [self addSubview:_IconButton];
    
    
    _searchTextField = [[SearchTextFiled alloc] init];
//    [_searchTextField setLeftImage:[UIImage imageNamed:@"home_search"]];
//    [_searchTextField setRightImage:[UIImage imageNamed:@"home_search"]];
//    [_searchTextField setRightImage:[UIImage imageNamed:@"home_QRCode"]];
    _searchTextField.backgroundColor = [UIColor whiteColor];
    _searchTextField.placeholderColor = [UIColor whiteColor];
    _searchTextField.textColor = [UIColor darkGrayColor];
    _searchTextField.placeholder = @"搜索您感兴趣的商品";
    _searchTextField.font = UIFontMake(13);
    
    [self addSubview:_searchTextField];
    
    _listButton = [[UIButton alloc] init];
    [_listButton setImage:[UIImage imageNamed:@"mine_news"] forState:UIControlStateNormal];
    _listButton.titleLabel.font = UIFontMake(11);
    _listButton.backgroundColor = [UIColor redColor];
    [self addSubview:_listButton];
    
//    _searchClickButton = [[BaseButton alloc] init];
//    [_searchClickButton addTarget:self action:@selector(searchButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [_searchClickButton setDefaultImage:[UIImage imageNamed:@"home_search"]];
//    [self addSubview:_searchClickButton];
//
//    _QRCodeButton = [[BaseButton alloc] init];
//    [_QRCodeButton addTarget:self action:@selector(QRCodeButtomClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [_QRCodeButton setDefaultImage:[UIImage imageNamed:@"home_QRCode"]];
//    [self addSubview:_QRCodeButton];
//    _QRCodeButton.frame = CGRectMake(6, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
    
    
//    [self layoutUI];
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutUI];
}

- (void)layoutUI {
    
    CGFloat bottomMargin = -8;
    
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_IconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(20);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(self).mas_equalTo(bottomMargin);
    }];
    
    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        if (!_isLeftViewHidden) {
           make.left.equalTo(_IconButton.mas_right).mas_offset(20);
        }else {
            make.left.equalTo(self).mas_offset(20);
        }
        make.right.equalTo(self).mas_equalTo(-60);
        make.bottom.equalTo(_IconButton.mas_bottom);
        make.height.equalTo(_IconButton.mas_height);
    }];
    
//    [_searchClickButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.bottom.equalTo(_searchTextField);
//        make.right.equalTo(_searchTextField.mas_right).mas_offset(-25);
//    }];
//    
//    [_QRCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
    
    [_listButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).mas_offset(-20);
        make.width.height.bottom.equalTo(_IconButton);
    }];

    
}

#pragma mark - on click
- (void)searchButtonClick:(UIButton *)sender {
    NSLog(@"进入搜索页面");
}

- (void)QRCodeButtomClicked:(BaseButton *)sender {
    NSLog(@"单击了列表按钮");
}



- (void)setIsLeftViewHidden:(BOOL)isLeftViewHidden {
    _isLeftViewHidden = isLeftViewHidden;
    _IconButton.hidden = isLeftViewHidden;
    [self layoutIfNeeded];
}



@end
