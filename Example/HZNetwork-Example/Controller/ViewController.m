//
//  ViewController.m
//  HZNetwork-Example
//
//  Created by xzh on 2017/8/7.
//  Copyright © 2017年 GeniusBrother. All rights reserved.
//

#import "ViewController.h"
#import <HZFoundation/HZFoundation.h>
#import "ViewModel.h"
#import "UIScrollView+HZRefresh.h"
#import "UDCollectionModel.h"
#import "UDSerializationDetailCell.h"
@interface ViewController ()<HZViewModelDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) ViewModel *viewModel;
@property(nonatomic, weak) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self loadSubViews];
    [self requestRemoteData];
}

#pragma mark - UI
- (void)loadSubViews
{
    self.title = @"Demo";
    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, HZNavBarHeight, HZDeviceWidth, HZDeviceHeight-HZNavBarHeight) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 140;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    __weak HZSessionTask *weakTask = self.viewModel.task;
    [tableView addRefreshHeader:[HZRefreshHeaderView headerWithRefreshingBlock:^{
        [weakTask.params setObject:@1 forKey:@"page"];
        [weakTask start];
    }]];
    
    [tableView addRefreshFooter:[HZRefreshAutoFooter footerWithRefreshingBlock:^{
        NSInteger page = [weakTask.params integerValueForKeyPath:@"page" def:0];
        [weakTask.params setObject:@(page+1) forKey:@"page"];
        [weakTask start];
    }]];
}

#pragma mark - Data
- (void)setupData
{
    _viewModel = [ViewModel viewModelWithDelegate:self];
}

- (void)requestRemoteData
{
    [self.tableView headerBeginRefreshing];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UDSerializationDetailCell *cell = [UDSerializationDetailCell cellForTableView:tableView];
    cell.collectionModel = [self.viewModel.modelArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - HZViewModelDelegate
- (void)viewModel:(HZViewModel *)viewModel taskDidSend:(HZSessionTask *)task
{
    if (HZSessionTaskCacheImportStateSuccess == task.cacheImportState) {
        [self.tableView reloadData];
    }
}

- (void)viewModel:(HZViewModel *)viewModel taskDidCompleted:(HZSessionTask *)task
{
    if (HZSessionTaskStateSuccess == task.state) {
        [self.tableView reloadData];
    }else if(task.error.code == NSURLErrorNotConnectedToInternet) { //The network connection is broken.
        
    }else { // Other Reasons cause the request failed.

    }
    
    [self.tableView endAllRefreshWithExistMoreData:YES];
}


@end
