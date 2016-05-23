//
//  PCWaterFlowLayout.h
//  PCGuokrChoice
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 pc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PCWaterFlowLayout;

@protocol PCWaterFlowLayoutDelegate <NSObject>
@required
/**
 *  用于根据cell宽度获取cell高度
 *  @param index           cell对应的index
 *  @param itemWidth       cell的宽度(在PCWaterFlowLayout.m 中根据列数、列间距算出)
 */
- (CGFloat)waterflowLayout:(PCWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
/** 瀑布流列数 */
- (CGFloat)columnCountInWaterflowLayout:(PCWaterFlowLayout *)waterflowLayout;
/** 瀑布流列间距 */
- (CGFloat)columnMarginInWaterflowLayout:(PCWaterFlowLayout *)waterflowLayout;
/** 瀑布流行间距 */
- (CGFloat)rowMarginInWaterflowLayout:(PCWaterFlowLayout *)waterflowLayout;
/** 瀑布流edgeInsets(边缘) */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(PCWaterFlowLayout *)waterflowLayout;
@end


@interface PCWaterFlowLayout : UICollectionViewLayout
/** 代理 */
@property (nonatomic, weak) id<PCWaterFlowLayoutDelegate> delegate;
@end