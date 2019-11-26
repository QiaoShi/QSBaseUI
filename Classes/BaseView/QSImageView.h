//
//  QSImageView.h
//  VCServiceProvider
//
//  Created by SQ on 2019/8/26.
//  Copyright © 2019 vica. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class QSImageView;
@protocol QSImageViewDelegate <NSObject>

@optional
- (void)qs_imageViewDidClickDeleteButton:(QSImageView*)imgView;
- (void)qs_imageViewDidClick:(QSImageView*)imgView;
@end

@interface QSImageView : UIImageView

/** 标签 */
@property (nonatomic, copy) NSString *tagStr;
/** 删除按钮 */
@property (nonatomic ,strong) UIButton *btnDelete;
/** 代理 */
@property (nonatomic ,weak)id <QSImageViewDelegate>delegate;

/** 删除按钮点击的Block事件 */
@property (nonatomic ,copy) void (^BlockBtnDeleteClick)(UIImageView *imgView);
/** 图片点击的Block事件 */
@property (nonatomic ,copy) void (^BlockImgViewClick)(UIImageView *imgView);
@end

NS_ASSUME_NONNULL_END
