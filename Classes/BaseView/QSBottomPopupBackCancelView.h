//
//  QSBottomPopupBackCancelView.h
//  AddressBook
//
//  Created by itwenet on 2018/9/29.
//  Copyright © 2018年 itwenet. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,QSPopBackViewAnimationType) {
    QSPopBackViewAnimationTypeExpansion = 1, // 展开动画
};

@interface QSBottomPopupBackCancelView : UIView

/** 动画时间 */
@property (nonatomic, assign) CGFloat duration;

/** 详情视图 */
@property (nonatomic, strong) UIView *contentView;

/** 是否支持点击灰色区域取消弹框，默认为NO */
@property (nonatomic, assign) BOOL  isSupportCancelClick;

/** contentView 手势点击事件 */
@property (nonatomic, copy) dispatch_block_t contentViewClickBlock;

/** 消失 手势点击事件 */
@property (nonatomic, copy) dispatch_block_t dismissClickBlock;

/** 展开动画显示，根据那个Y坐标 */
- (void)showExpansionAnimationWithY:(CGFloat)y;
- (void)showExpansionAnimationWithY:(CGFloat)y andViewHeight:(CGFloat)height;
/** 显示，从下面弹出来 */
- (void)show;
/** 显示，从下面弹出来,没有背景色的变化 */
- (void)showWithNoBackViewAnimation;
/** 显示在 最上层window */
- (void)showInLastWindow;

/** 没有动画的显示*/
- (void)showWithNoAnimation;

/** 显示，透明度从0到1.显示在屏幕中间 */
- (void)showWithAlphaAnimation;
/** 显示在最上层window */
- (void)showWithAlphaAnimationWithTopWindow;
/** 显示在屏幕中间 */
- (void)showWithAlphaAnimationWithWindowCenter;
- (void)showWithAlphaAnimationWithTopWindowCenter;
/** 显示，透明度从0到1.显示在指定位置 */
- (void)showAlphaAnimationWithCenter:(CGPoint)centerPoint;
/** 消失 */
- (void)dismiss;

/** 显示在指定视图上面 */
- (void)showInView:(UIView *)view;

/** 显示在指定坐标 */
- (void)showAlphaAnimationWithPoint:(CGPoint)point;
- (void)showNoBackColorAlphaAnimationWithPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
