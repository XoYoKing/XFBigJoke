//
//  XFSeeBigViewController.m
//  XFBifJoke
//
//  Created by xiaofans on 16/8/12.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFSeeBigViewController.h"

@interface XFSeeBigViewController ()<UIScrollViewDelegate>

/** imageView */
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, assign) CGSize imgViewSize;

@end

@implementation XFSeeBigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = [UIScreen mainScreen].bounds;
    [self.view insertSubview:scrollView atIndex:0];
    scrollView.delegate = self;
    self.scrollView = scrollView;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [scrollView addSubview:imageView];
    self.imageView = imageView;
    
    
    //imageView.center = self.view.center;
    
    //imageView.xf_width = SCREEN.width;
    //imageView.xf_height = 220;
    
}

- (void)setModel:(XFDataModel *)model {
    _model = model;
    
    [self cacheImages:model];
    
}

- (void)cacheImages:(XFDataModel *)dataModel {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager downloadImageWithURL:[NSURL URLWithString:dataModel.url] options:SDWebImageRetryFailed progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
                
                self.imgViewSize = [self calculatePicViewSize:dataModel];
                
                self.imageView.xf_x = kMargin;
                
                if (self.imgViewSize.height >= SCREEN.height) {
                    self.imageView.xf_y = kMargin;
                } else {
                    self.imageView.xf_centerY = self.view.xf_centerY;
                }
                
                self.imageView.xf_width = self.imgViewSize.width;
                self.imageView.xf_height = self.imgViewSize.height;
                
                self.scrollView.contentSize = CGSizeMake(0, self.imageView.xf_height);
                
            });
        }];
    });
    
}

- (CGSize)calculatePicViewSize:(XFDataModel *)model {
    // 取出图片
    UIImage *image = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:model.url];
    return CGSizeMake(image.size.width, image.size.height);
}

#pragma mark - <UIScrollViewDelegate>

// 返回一个scrollView的子控件进行缩放
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

#pragma mark - 事件监听
- (IBAction)backBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end











