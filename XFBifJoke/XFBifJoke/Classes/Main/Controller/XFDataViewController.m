//
//  XFDataViewController.m
//  XFBifJoke
//
//  Created by xiaofans on 16/8/9.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFDataViewController.h"

@interface XFDataViewController ()
@property (nonatomic, strong) XFHttpManager *httpManager;
@property (nonatomic, strong) NSMutableArray <XFDataModel *>*wordModelArray;

@property (nonatomic, assign) NSInteger page;


@end

static NSString * const XFWordCellID = @"XFWordCell";
static NSInteger const pageSize = 15;

@implementation XFDataViewController

#pragma mark - 懒加载

- (XFHttpManager *)httpManager {
    if (!_httpManager) {
        _httpManager = [[XFHttpManager alloc] init];
        _httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
    }
    return _httpManager;
}

- (NSInteger)page {
    if (!_page) {
        _page = 1;
    }
    return _page;
}

#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupRefresh];
    
    [self setupView];
    
}

- (void)setupView {
    self.view.backgroundColor = XFBaseBgColor;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    //self.tableView.estimatedRowHeight = 200;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XFWordCell class]) bundle:nil] forCellReuseIdentifier:XFWordCellID];
    
}

- (void)setupRefresh {
    self.tableView.mj_header = [XFRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [XFRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

#pragma mark - 加载数据
- (void)loadNewData {
    
    __weak typeof(self) weakSelf = self;
    
    NSString *url = [NSString stringWithFormat:@"%@&page=%ld&pagesize=%ld", self.url, (long)self.page, pageSize];
    
    [self.httpManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        weakSelf.wordModelArray = [XFDataModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"][@"data"]];
        
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XFLog(@"error:%@", error);
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    
}

- (void)loadMoreData {
    
    self.page++;
    
    __weak typeof(self) weakSelf = self;
    
    NSString *url = [NSString stringWithFormat:@"%@&page=%ld&pagesize=%ld", self.url, (long)self.page, pageSize];
    
    [self.httpManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *moreArray = [XFDataModel mj_objectArrayWithKeyValuesArray:responseObject[@"result"][@"data"]];
        [weakSelf.wordModelArray addObjectsFromArray:moreArray];
        
        [weakSelf.tableView reloadData];
        [weakSelf.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        XFLog(@"error:%@", error);
        [weakSelf.tableView.mj_footer endRefreshing];
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wordModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XFWordCell *cell = [tableView dequeueReusableCellWithIdentifier:XFWordCellID];
    cell.model = self.wordModelArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.wordModelArray[indexPath.row].cellHeight;
}

#pragma mark - UITableView delegate




@end















