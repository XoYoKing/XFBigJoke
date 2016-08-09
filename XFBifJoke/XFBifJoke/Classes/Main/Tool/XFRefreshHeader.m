//
//  XFRefreshHeader.m
//
//
//  Created by xiaofans on 16/6/29.
//  Copyright © 2016年 xiaofan. All rights reserved.
//


#import "XFRefreshHeader.h"

@implementation XFRefreshHeader

/**
 *  初始化
 */
- (void)prepare {
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;   // 自动切换透明度
    [self setTitle:@"下拉可以刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    //self.stateLabel.textColor = [UIColor orangeColor];
    //self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
}

@end









