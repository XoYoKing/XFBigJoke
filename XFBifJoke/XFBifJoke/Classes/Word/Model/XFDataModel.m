//
//  XFWordModel.m
//  XFBifJoke
//
//  Created by xiaofans on 16/8/9.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFDataModel.h"

@implementation XFDataModel

- (CGFloat)cellHeight {
    // 如果已经计算好 cell 高度，就直接返回
    if (_cellHeight) return _cellHeight;
    
    // 文字内容
    CGFloat textMaxW = SCREEN.width - 2 * kMargin;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
    CGSize textSize = [self.content boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size;
    _cellHeight = textSize.height;
    
    // 图片
    if (self.url.length) {
        _cellHeight += SCREEN.width;
    }
    
    // 时间
    if (self.updatetime.length) {
        _cellHeight += 40;
    }
    
    // 底部工具条
    _cellHeight += 85;
    
    return _cellHeight;
}

@end












