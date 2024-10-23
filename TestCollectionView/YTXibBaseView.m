#import "YTXibBaseView.h"
#import <Masonry/Masonry.h>
@implementation YTXibBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    NSString *xibName;
    
    // 检查子类是否实现了 xibName 方法
    if ([self respondsToSelector:@selector(xibName)]) {
        xibName = [(id)self xibName];  // 调用子类的 xibName
    } else {
        // 如果子类没有实现 xibName，使用类名作为默认的 xib 名称
        xibName = NSStringFromClass([self class]);
    }
    
    NSAssert(xibName != nil, @"Subclasses of YTXibBaseView must implement xibName or have a valid class name as XIB name.");
    
    // 加载 xib 文件
    if (xibName) {
        UIView *contentView = [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil].firstObject;
        NSAssert(contentView != nil, @"No XIB file found with name: %@", xibName);
        
        if (contentView) {
            contentView.frame = self.bounds;
            contentView.translatesAutoresizingMaskIntoConstraints = NO;
//            contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [self addSubview:contentView];
            [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        }
    }
    self.backgroundColor = [UIColor clearColor];

}

@end
