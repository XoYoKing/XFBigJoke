//
//  XFWordCell.h
//  XFBifJoke
//
//  Created by xiaofans on 16/8/9.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XFDataModel;

@interface XFWordCell : UITableViewCell

@property (nonatomic, strong) XFDataModel *model;

/** cell 高度 */
@property (nonatomic, assign) CGFloat  cellHeight;

@end
