//
//  XFAlert.m
//  
//
//  Created by xiaofans on 16/8/1.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "XFAlert.h"

#define OVERIOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

@implementation XFAlert

+ (void)showAlertInViewController:(UIViewController *)viewController alertTitle:(NSString *)alertTitle btnTitle:(NSString *)btnTitle message:(NSString *)message {
    
    if (OVERIOS9) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:message preferredStyle:UIAlertControllerStyleAlert];
        //  创建 action.
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleCancel handler:nil];
        // 增加 action
        [alertController addAction:cancelAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:alertTitle message:message delegate:nil cancelButtonTitle:btnTitle otherButtonTitles:nil];
        [alert show];
    }
}





@end
