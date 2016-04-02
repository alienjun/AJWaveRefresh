//
//  ExampleCollectionView.m
//  AJWaveRefreshExample
//
//  Created by AlienJunX on 16/4/2.
//  Copyright © 2016年 com.alienjun. All rights reserved.
//

#import "ExampleCollectionView.h"
#import "UIScrollView+AJWaveRefresh.h"
static const CGFloat MJDuration = 3.0;
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface ExampleCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource,AJWaveRefreshProtocol>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation ExampleCollectionView

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UICollectionView";
    self.data = [[NSMutableArray alloc] init];
    [self.collectionView setupRefresh:self];
    //    [self.collectionView setupRefreshFooter:self];
    //    [self.collectionView setupRefreshHeader:self];
    
    [self.collectionView startHeaderRefreshing];
}

#pragma mark - AJWaveRefreshProtocol
- (void)headerRereshing {
    [self loadNewData];
}

- (void)footerRereshing {
    [self loadNewData];
}

- (void)loadNewData {
    for (int i = 0; i<5; i++) {
        [self.data insertObject:MJRandomData atIndex:0];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //刷新表格
        [self.collectionView reloadData];
        
        //拿到当前的下拉刷新控件，结束刷新状态
        [self.collectionView endRefreshing];
    });
}


#pragma mark - UICollectionViewDataSource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:10];
    titleLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

@end
