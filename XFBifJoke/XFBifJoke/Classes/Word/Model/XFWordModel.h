//
//  XFWordModel.h
//  XFBifJoke
//
//  Created by xiaofans on 16/8/9.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XFWordModel : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *updatetime;
@property (nonatomic, assign) NSNumber *unixtime;

/** cell 高度 */
@property (nonatomic, assign) CGFloat  cellHeight;

@end
