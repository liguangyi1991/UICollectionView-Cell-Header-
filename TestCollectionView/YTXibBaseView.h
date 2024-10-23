//
//  YTXibBaseView.h
//  eyutong
//
//  Created by MAC on 2024/10/14.
//  Copyright © 2024 Zhengzhou Yutong Bus Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface YTXibBaseView : UIView 
//如果子类需要用其他的名字则需要实现此方法
- (NSString *)xibName;
- (void)commonInit;
@end

