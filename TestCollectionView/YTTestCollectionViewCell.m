//
//  YTTestCollectionViewCell.m
//  TestCollectionView
//
//  Created by MAC on 2024/10/22.
//

#import "YTTestCollectionViewCell.h"
#import <Masonry/Masonry.h>
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

@implementation YTTestCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
//    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(SCREEN_WIDTH);
//    }];
    // Initialization code
}
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{

    // 计算合适的大小
    CGSize targetSize = CGSizeMake(layoutAttributes.frame.size.width, UILayoutFittingCompressedSize.height);
    CGSize autoLayoutSize = [self.contentView systemLayoutSizeFittingSize:targetSize
                            withHorizontalFittingPriority:UILayoutPriorityRequired
                                  verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
    
    // 更新布局属性
    CGRect newFrame = layoutAttributes.frame;
    newFrame.size.height = autoLayoutSize.height;
    layoutAttributes.frame = newFrame;
    
    return layoutAttributes;
}
@end
