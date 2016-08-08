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
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFWordViewController alloc] init]] title:@"看笑话" image:@"tabbar_word" selectedImage:@"tabbar_word"];
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFPicViewController alloc] init]] title:@"赏趣图" image:@"tabbar_pic" selectedImage:@"tabbar_pic"];
    
    [self setupOneChildViewController:[[XFNavigationController alloc] initWithRootViewController:[[XFRandViewController alloc] init]] title:@"大杂烩" image:@"tabbar_random" selectedImage:@"tabbar_randow"];
}

/**
 *  创建tabBar控制器
 */
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    vc.tabBarItem.title = title;
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
    
}


@end













