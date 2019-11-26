//
//  QSImageView.m
//  VCServiceProvider
//
//  Created by SQ on 2019/8/26.
//  Copyright © 2019 vica. All rights reserved.
//

#import "QSImageView.h"
#import <Masonry/Masonry.h>

@interface QSImageView ()

/** 半透明背景图 */
@property (nonatomic, strong) UIView *tagBackView;
/** 标签 */
@property (nonatomic, strong) UILabel *lblTag;

@end

@implementation QSImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    _btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnDelete addTarget:self action:@selector(btnDeletePressed:) forControlEvents:UIControlEventTouchUpInside];
    //[_btnDelete setImage:[UIImage imageNamed:@"btn_add_photo__del"] forState:UIControlStateNormal];
    [_btnDelete setBackgroundImage:[UIImage imageNamed:@"btn_add_photo__del"] forState:UIControlStateNormal];
    [self addSubview:_btnDelete];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickAction)];
    [self addGestureRecognizer:tap];
    
    _tagBackView = [[UIView alloc] init];
    _tagBackView.hidden = YES; // 默认没有标签,只有设置了标签才有
    _tagBackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self addSubview:_tagBackView];
    
    _lblTag =  [[UILabel alloc] init];
    _lblTag.textColor = [UIColor whiteColor];
    _lblTag.font = [UIFont systemFontOfSize:12.0f];
    [_tagBackView addSubview:_lblTag];
    
    [_btnDelete mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_tagBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(@20);
    }];
    [_lblTag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tagBackView.mas_left).offset(6);
        make.right.equalTo(self.tagBackView.mas_right).offset(-6);
        make.centerY.equalTo(self.tagBackView);
    }];
}

- (void)setTagStr:(NSString *)tagStr
{
    if (tagStr) {
        _tagStr = [tagStr copy];
        self.tagBackView.hidden = NO;
        self.lblTag.text = _tagStr;
    }else {
        self.tagBackView.hidden = YES;
    }
}

- (void)btnDeletePressed:(UIButton *)btn
{
    if (self.BlockBtnDeleteClick) {
        self.BlockBtnDeleteClick(self);
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(qs_imageViewDidClickDeleteButton:)]) {
        [self.delegate qs_imageViewDidClickDeleteButton:self];
    }
}

- (void)tapClickAction
{
    if (self.BlockImgViewClick) {
        self.BlockImgViewClick(self);
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(qs_imageViewDidClick:)]) {
        [self.delegate qs_imageViewDidClick:self];
    }
}

@end
