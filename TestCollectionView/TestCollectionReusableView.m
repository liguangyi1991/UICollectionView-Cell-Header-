//
//  TestCollectionReusableView.m
//  TestCollectionView
//
//  Created by MAC on 2024/10/23.
//

#import "TestCollectionReusableView.h"
#import <Masonry/Masonry.h>

@implementation TestCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
//{
//    // 计算合适的大小
//    CGSize targetSize = CGSizeMake(layoutAttributes.frame.size.width, UILayoutFittingCompressedSize.height);
//    CGSize autoLayoutSize = [self systemLayoutSizeFittingSize:targetSize
//                            withHorizontalFittingPriority:UILayoutPriorityRequired
//                                  verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
//    
//    // 更新布局属性
//    CGRect newFrame = layoutAttributes.frame;
//    newFrame.size.height = autoLayoutSize.height;
//    layoutAttributes.frame = newFrame;
//
//    return layoutAttributes;
//}
//- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
//{
//    NSLog(@"测试");
//}
//- (CGFloat)getCellHeightWithWidth:(CGFloat)width
//{
//    CGSize targetSize = CGSizeMake(width, UILayoutFittingCompressedSize.height);
//    CGSize autoLayoutSize = [self systemLayoutSizeFittingSize:targetSize
//                            withHorizontalFittingPriority:UILayoutPriorityRequired
//                                  verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
//    return targetSize.height;
//}
@end
