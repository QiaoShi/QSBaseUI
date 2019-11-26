//
//  QSBottomPopupBackCancelView.m
//  AddressBook
//
//  Created by itwenet on 2018/9/29.
//  Copyright © 2018年 itwenet. All rights reserved.
//

#import "QSBottomPopupBackCancelView.h"
#import "UIView+Utils.h"

#define wc_alph 0.7f

@interface QSBottomPopupBackCancelView ()<UIGestureRecognizerDelegate>

/** 是否透明度显示 */
@property (nonatomic, assign) BOOL isAlpha;
/** 取消手势 */
@property (nonatomic, strong) UITapGestureRecognizer *tap;
/** 弹框手势，为了抵消点击背景消失 */
@property (nonatomic, strong) UITapGestureRecognizer *contenTap;

/** 显示的动画类型 */
@property (nonatomic, assign) QSPopBackViewAnimationType  animationType;

@end

@implementation QSBottomPopupBackCancelView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

#pragma mark - pubulic method

- (void)setContentView:(UIView *)contentView
{
    if (contentView) {
        if (_contentView) {
            [_contentView removeFromSuperview];
        }
        [self addSubview:contentView];
    }
    _contentView = contentView;
}

- (void)show
{
    self.isAlpha = NO;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        CGRect cFrame = self.contentView.frame;
        cFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.contentView.frame = cFrame;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            CGRect cFrame = self.contentView.frame;
            cFrame.origin.y = [UIScreen mainScreen].bounds.size.height - cFrame.size.height;
            self.contentView.frame = cFrame;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showWithNoBackViewAnimation
{
    self.isAlpha = NO;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    if (self.contentView) {
        CGRect cFrame = self.contentView.frame;
        cFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.contentView.frame = cFrame;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        if (self.contentView) {
            CGRect cFrame = self.contentView.frame;
            cFrame.origin.y = [UIScreen mainScreen].bounds.size.height - cFrame.size.height;
            self.contentView.frame = cFrame;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showWithNoAnimation
{
    self.isAlpha = NO;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
}
- (void)showInLastWindow
{
    self.isAlpha = NO;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
//    if (wind) {
//        wind = [UIApplication sharedApplication].keyWindow;
//    }
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        CGRect cFrame = self.contentView.frame;
        cFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.contentView.frame = cFrame;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            CGRect cFrame = self.contentView.frame;
            cFrame.origin.y = [UIScreen mainScreen].bounds.size.height - cFrame.size.height;
            self.contentView.frame = cFrame;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showInView:(UIView *)view
{
    self.isAlpha = NO;
    [view addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        CGRect cFrame = self.contentView.frame;
        cFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
        self.contentView.frame = cFrame;
    }
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            CGRect cFrame = self.contentView.frame;
            cFrame.origin.y = [UIScreen mainScreen].bounds.size.height - cFrame.size.height;
            self.contentView.frame = cFrame;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showWithAlphaAnimation
{
    self.isAlpha = YES;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        self.contentView.alpha = 0.0f;
        self.contentView.centerY = [UIScreen mainScreen].bounds.size.height / 2.0 - 40;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            self.contentView.alpha = 1.0f;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showWithAlphaAnimationWithWindowCenter
{
    self.isAlpha = YES;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        self.contentView.alpha = 0.0f;
        self.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0f, [UIScreen mainScreen].bounds.size.height / 2.0f);
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            self.contentView.alpha = 1.0f;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showWithAlphaAnimationWithTopWindowCenter
{
    self.isAlpha = YES;
    UIWindow *wind = [[UIApplication sharedApplication].windows lastObject];
    wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        self.contentView.alpha = 0.0f;
        self.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0f, [UIScreen mainScreen].bounds.size.height / 2.0f);
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            self.contentView.alpha = 1.0f;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showWithAlphaAnimationWithTopWindow
{
    self.isAlpha = YES;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        self.contentView.alpha = 0.0f;
        self.contentView.centerY = CGRectGetHeight([UIScreen mainScreen].bounds) / 2.0 - 40;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            self.contentView.alpha = 1.0f;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showAlphaAnimationWithCenter:(CGPoint)centerPoint
{
    self.isAlpha = YES;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        self.contentView.alpha = 0.0f;
        self.contentView.center =centerPoint;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0f];
        if (self.contentView) {
            self.contentView.alpha = 1.0f;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showNoBackColorAlphaAnimationWithPoint:(CGPoint)point
{
    self.isAlpha = YES;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        self.contentView.alpha = 0.0f;
        self.contentView.origin = point;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        if (self.contentView) {
            self.contentView.alpha = 1.0f;
        }
    } completion:^(BOOL finished) {
    }];
}

- (void)showAlphaAnimationWithPoint:(CGPoint)point
{
    self.isAlpha = YES;
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        self.contentView.alpha = 0.0f;
        self.contentView.origin = point;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            self.contentView.alpha = 1.0f;
        }
    } completion:^(BOOL finished) {
    }];
}

- (void)showExpansionAnimationWithY:(CGFloat)y
{
    [self showExpansionAnimationWithY:y andViewHeight:200];
}

- (void)showExpansionAnimationWithY:(CGFloat)y andViewHeight:(CGFloat)height
{
    self.isAlpha = NO;
    self.animationType = QSPopBackViewAnimationTypeExpansion;
    self.frame = CGRectMake(0, y, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - y);
    UIWindow *wind = [UIApplication sharedApplication].keyWindow;
    [wind addSubview:self];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
    if (self.contentView) {
        CGRect cFrame = self.contentView.frame;
        cFrame.origin.y = 0;
        cFrame.size.height = 0.01f;
        self.contentView.frame = cFrame;
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:wc_alph];
        if (self.contentView) {
            CGRect cFrame = self.contentView.frame;
            cFrame.size.height = height;
            self.contentView.frame = cFrame;
        }
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss
{
    switch (self.animationType) {
        case QSPopBackViewAnimationTypeExpansion:
        {
            [UIView animateWithDuration:self.duration animations:^{
                self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0f];
                if (self.contentView) {
                    CGRect cFrame = self.contentView.frame;
                    cFrame.size.height = 0.01f;
                    self.contentView.frame = cFrame;
                }
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
            
        default:
        {
            [UIView animateWithDuration:self.duration animations:^{
                self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0f];
                if (self.contentView) {
                    if (self.isAlpha) {
                        self.contentView.alpha = 0.0f;
                    } else {
                        CGRect cFrame = self.contentView.frame;
                        cFrame.origin.y = [UIScreen mainScreen].bounds.size.height;
                        self.contentView.frame = cFrame;
                    }
                }
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
    }
    
    
}


#pragma mark - SetUpUI

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.frame = [UIScreen mainScreen].bounds;
    self.duration = 0.3f;
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:self.tap];
}

#pragma mark - Event Method

- (void)setIsSupportCancelClick:(BOOL)isSupportCancelClick
{
    _isSupportCancelClick = isSupportCancelClick;
    if (_isSupportCancelClick) {
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:self.tap];
        [self.contentView addGestureRecognizer:self.contenTap];
    } else {
        if (_tap) {
            [self removeGestureRecognizer:_tap];
        }
    }
}

#pragma mark - Delegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.contentView]) {
        return NO;
    }
    return YES;
}


#pragma mark - Notification

#pragma mark - Private Method
- (void)contentViewTap {
    if (self.contentViewClickBlock) {
        self.contentViewClickBlock();
    }
}

- (void)cancelTap
{
    [self dismiss];
    if (self.dismissClickBlock) {
        self.dismissClickBlock();
    }
}

#pragma mark - Getter

- (UITapGestureRecognizer *)tap
{
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelTap)];
        _tap.delegate = self;
    }
    return _tap;
}

- (UITapGestureRecognizer *)contenTap
{
    if (!_contenTap) {
        _contenTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTap)];
    }
    return _contenTap;
}

@end
