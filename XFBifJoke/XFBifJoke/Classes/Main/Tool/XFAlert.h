//
//  XFAlert.h
//  
//
//  Created by xiaofans on 16/8/1.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XFAlert : NSObject

+ (void)showAlertInViewController:(UIViewController *)viewController alertTitle:(NSString *)alertTitle btnTitle:(NSString *)btnTitle message:(NSString *)message;


@end
