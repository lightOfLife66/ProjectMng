//
//  LoginTableViewCell.m
//  FYFM
//
//  Created by mac_123 on 2018/4/8.
//  Copyright © 2018年 mac_123. All rights reserved.
//

#import "LoginTableViewCell.h"

@interface LoginTableViewCell(){
    UIImageView *_shuXianImgV;
}
@end

@implementation LoginTableViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
     self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     
        [self createUI];
    }
    return self;
}

-(void) createUI{
    
    _iconImgV = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_iconImgV];
    
    _regionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_regionBtn setImage:[UIImage imageNamed:@"86"] forState:UIControlStateNormal];
    [self.contentView addSubview:_regionBtn];
    [_regionBtn addTarget:self action:@selector(clickRegion:) forControlEvents:UIControlEventTouchDown];
    
    _shuXianImgV = [[UIImageView alloc] init];
    _shuXianImgV.image = [UIImage imageNamed:@"shuxian"];
    [self.contentView addSubview:_shuXianImgV];
    _textFiled = [[UITextField alloc] initWithFrame:CGRectZero];
    _textFiled.font = UIFontMake(Factor_6(30/2));
    _textFiled.textColor = [UIColor colorWithHexString:@"#666666"];
    _textFiled.delegate = self;
    _textFiled.tag = 1015;
    self.getTextDelegat = self;
    [self.contentView addSubview:_textFiled];
    _secretBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_secretBtn setImage:[UIImage imageNamed:@"guangbi"] forState:UIControlStateNormal];
    [_secretBtn addTarget:self action:@selector(showPwdActon:) forControlEvents:UIControlEventTouchDown];
    [self.contentView addSubview:_secretBtn];
    [self setConstraints];
    
}

-(void) showPwdActon:(UIButton *)btn{
    
    if (self.showPwdBlock) {
        self.showPwdBlock(btn);
    }
}

-(void) clickRegion:(UIButton *)btn {
    
    if (self.regionBlock) {
        
        self.regionBlock();
    }
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    
    if (self.getTextDelegat && [self.getTextDelegat respondsToSelector:@selector(editCell:indexPath:inputText:)]) {
        [self.getTextDelegat editCell:self indexPath:_indexPath inputText:textField.text];
    }
}

-(void) setIndexPath:(NSIndexPath *)indexPath{
    
    _indexPath = indexPath;
}


-(void) setConstraints{
    
    [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.mas_equalTo(-Factor_6(20/2));
        make.left.mas_equalTo(Factor_6(30/2));
        make.width.mas_equalTo(Factor_6(41/2));
        make.height.mas_equalTo(Factor_6(41/2));
    }];
    [_regionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(Factor_6(94/2));
        make.left.mas_equalTo(_iconImgV.mas_right).mas_offset(Factor_6(13/2));
        make.width.mas_equalTo(Factor_6(79/2));
        make.height.mas_equalTo(Factor_6(23/2));
    }];
    
    [_shuXianImgV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(Factor_6(90/2));
        make.left.mas_equalTo(_regionBtn.mas_right).mas_offset(Factor_6(21/2));
        make.width.mas_equalTo(Factor_6(2/2));
        make.height.mas_equalTo(Factor_6(29/2));
    }];
    
    [_secretBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(Factor_6(66/2));
        make.right.mas_equalTo(-Factor_6(40/2));
        make.width.mas_equalTo(Factor_6(31/2));
        make.height.mas_equalTo(Factor_6(22/2));
    }];
    
    [_textFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-Factor_6(26/2));
        make.left.mas_equalTo(_shuXianImgV.mas_right).mas_offset(Factor_6(3/2));
        make.height.mas_equalTo(Factor_6(30/2));
        make.right.mas_equalTo(-Factor_6(101/2));
    }];
}

-(void) setIsShowRegionBtn:(BOOL)isShowRegionBtn{
    
    if (isShowRegionBtn) {
        _regionBtn.hidden = NO;
        _secretBtn.hidden = YES;
        
        _iconImgV.image = [UIImage imageNamed:@"shouji"];
      
        [_shuXianImgV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Factor_6(90/2));
            make.left.mas_equalTo(_regionBtn.mas_right).mas_offset(Factor_6(21/2));
            make.width.mas_equalTo(Factor_6(2/2));
            make.height.mas_equalTo(Factor_6(29/2));
        }];
        [_textFiled mas_updateConstraints:^(MASConstraintMaker *make) {
           
            
        }];
        

    }else{
        _regionBtn.hidden = YES;
        _secretBtn.hidden = NO;
        
        _iconImgV.image = [UIImage imageNamed:@"suotou"];
        [_secretBtn setImage:[UIImage imageNamed:@"guangbi"] forState:UIControlStateNormal];
        _textFiled.secureTextEntry = YES;
        [_shuXianImgV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(Factor_6(63/2));
            make.left.mas_equalTo(_iconImgV.mas_right).mas_offset(Factor_6(8/2));
            make.width.mas_equalTo(Factor_6(2/2));
            make.height.mas_equalTo(Factor_6(29/2));
        }];
    }
}


#pragma mark - UITextFieldDelegate


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
