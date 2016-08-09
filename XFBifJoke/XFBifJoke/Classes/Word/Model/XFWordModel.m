//
//  XFWordModel.m
//  XFBifJoke
//
//  Created by xiaofans on 16/8/9.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFWordModel.h"

@implementation XFWordModel

- (CGFloat)cellHeight {
    // 如果已经计算好 cell 高度，就直接返回
    if (_cellHeight) return _cellHeight;
    
    // 文字内容
    CGFloat textMaxW = SCREEN.width - 2 * 10;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
    CGSize textSize = [self.content boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16]} context:nil].size;
    _cellHeight = textSize.height;
    
    // 时间
    _cellHeight += 40;
    
    // 底部工具条
    _cellHeight += 85;
    
    return _cellHeight;
}

@end












