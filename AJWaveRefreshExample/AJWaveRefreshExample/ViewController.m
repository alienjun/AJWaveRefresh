//
//  ViewController.m
//  AJWaveRefreshExample
//
//  Created by AlienJunX on 16/4/1.
//  Copyright © 2016年 com.alienjun. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "AJWaveRefreshHeader.h"
#import "AJWaveRefreshAutoStateFooter.h"

static const CGFloat MJDuration = 3.0;
/**
 * 随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] init];
    self.tableView.header = [AJWaveRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [AJWaveRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
}


- (void)loadNewData{
    for (int i = 0; i<5; i++) {
        [self.data insertObject:MJRandomData atIndex:0];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(MJDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
    });
}


#pragma mark - uitableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"index: %ld",(long)indexPath.row];
    return cell;
}

@end
