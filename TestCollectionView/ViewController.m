//
//  ViewController.m
//  TestCollectionView
//
//  Created by MAC on 2024/10/22.
//

#import "ViewController.h"
#import "YTTestCollectionViewCell.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#import "TestCollectionReusableView.h"
#import "YTTestView.h"

/// 屏幕高度，会根据横竖屏的变化而变化
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collection registerNib:[UINib nibWithNibName:@"YTTestCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"YTTestCollectionViewCell"];
    [self.collection registerNib:[UINib nibWithNibName:@"TestCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"TestCollectionReusableView"];
    [self.collection registerNib:[UINib nibWithNibName:@"TestCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TestCollectionReusableView"];
    // 延迟 2 秒执行
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collectionViewFlowLayout.estimatedItemSize =  UICollectionViewFlowLayoutAutomaticSize;


//    self.collectionViewFlowLayout.footerReferenceSize = UICollectionViewFlowLayoutAutomaticSize;
//    self.collectionViewFlowLayout.itemSize =  UICollectionViewFlowLayoutAutomaticSize;
    // Do any additional setup after loading the view.
//    [self.collection registerNib:[UINib nibWithNibName:@"YTTestCollectionViewCell" bundle:nil] forCellReuseIdentifier:@"YTTestCollectionViewCell"];


    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YTTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YTTestCollectionViewCell" forIndexPath:indexPath];
//    cell.translatesAutoresizingMaskIntoConstraints = NO;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH, 100);
}


//// 返回 Footer 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    YTTestView *footerView =  [[YTTestView alloc] init];
    CGSize targetSize = CGSizeMake(collectionView.frame.size.width, UILayoutFittingCompressedSize.height);
    CGSize autoLayoutSize = [footerView systemLayoutSizeFittingSize:targetSize
                            withHorizontalFittingPriority:UILayoutPriorityRequired
                                  verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
    return CGSizeMake(collectionView.frame.size.width, autoLayoutSize.height); // 自动适应
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeZero;
}

// 返回 Footer 视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        TestCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"TestCollectionReusableView" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor lightGrayColor];
        return footerView;
    }
    return nil;
    TestCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"TestCollectionReusableView" forIndexPath:indexPath];
    // 在此配置 footerView，比如添加 label
    footerView.backgroundColor = [UIColor lightGrayColor];
    return footerView;
}
@end
