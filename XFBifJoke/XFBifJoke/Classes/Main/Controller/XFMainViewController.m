//
//  XFMainViewController.m
//  XFBifJoke
//
//  Created by xiaofans on 16/8/8.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFMainViewController.h"
#import "XFWordViewController.h"
#import "XFPicViewController.h"
#import "XFRandViewController.h"
#import "XFNavigationController.h"

@interface XFMainViewController ()

@end

@implementation XFMainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setupChildViewController];
    
}

/**
 *  添加子控制器
 */
- (void)setupChildViewController {
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFWordViewController alloc] init]] title:@"看笑话" image:@"tabbar_word_normal"];
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFPicViewController alloc] init]] title:@"赏趣图" image:@"tabbar_pic_normal"];
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFRandViewController alloc] init]] title:@"大杂烩" image:@"tabbar_random_normal"];
}

/**
 *  创建tabBar控制器
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image {
    vc.tabBarItem.title = title;
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
    }
    [self addChildViewController:vc];
    
}

@end













