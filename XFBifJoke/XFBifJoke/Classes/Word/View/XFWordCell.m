//
//  XFWordCell.m
//  XFBifJoke
//
//  Created by xiaofans on 16/8/9.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFWordCell.h"


@interface XFWordCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;

@end

@implementation XFWordCell

#pragma mark - 初始化

- (void)awakeFromNib {
    self.backgroundColor = [UIColor whiteColor];
}

- (void)setModel:(XFDataModel *)model {
    _model = model;
    
    self.contentLabel.text = model.content;
    
    if (model.updatetime.length) {
        self.timeLabel.text = model.updatetime;
    }
    
    if (model.url.length) {
        self.imgView.hidden = NO;
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    }
    
}

- (IBAction)dingClick:(UIButton *)sender {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    [XFAlert showAlertInViewController:vc alertTitle:@"恭喜你" btnTitle:@"好高兴呀" message:@"笑一笑,十年少, 你又年轻了一岁!"];
    
}
- (IBAction)caiClick:(UIButton *)sender {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    [XFAlert showAlertInViewController:vc alertTitle:@"我的天呐!" btnTitle:@"好笑, 是我点错了" message:@"你竟然觉得不好笑! 你是怎么想的?"];
}


/**
 *  重写 setFrame 方法,拦截系统设置的 frame
 */
- (void)setFrame:(CGRect)frame {
    
    frame.size.height -= 10;
    frame.origin.y += 10;
    frame.size.width -= 10;
    frame.origin.x += 5;
    
    [super setFrame:frame];
}


@end
















