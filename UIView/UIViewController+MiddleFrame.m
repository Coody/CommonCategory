//
//  UIViewController+MiddleFrame.m
//  TTQRCODE
//
//  Created by coodychou on 2018/9/26.
//  Copyright © 2018 coody. All rights reserved.
//

#import "UIViewController+MiddleFrame.h"

// for Tools
#import "SafeAreaTool.h"

@implementation UIViewController (MiddleFrame)

-(CGRect)getMiddleFrame{
    CGRect tempFrame = [self getSafeAreaFrame];
    tempFrame = CGRectMake(tempFrame.origin.x,
                           tempFrame.origin.y +
                           self.navigationController.navigationBar.frame.size.height,
                           tempFrame.size.width,
                           tempFrame.size.height - 
                           self.navigationController.navigationBar.frame.size.height -
                           self.tabBarController.tabBar.frame.size.height +
                           [self getSafeAreaInsets].bottom);
    return tempFrame;
}

-(CGRect)getBottomFrame{
    CGRect tempFrame = [self getSafeAreaFrame];
    tempFrame = CGRectMake(tempFrame.origin.x,
                           tempFrame.origin.y +
                           self.navigationController.navigationBar.frame.size.height,
                           tempFrame.size.width,
                           tempFrame.size.height - 
                           self.navigationController.navigationBar.frame.size.height +
                           [self getSafeAreaInsets].bottom);
    return tempFrame;
}

#pragma mark - Private
-(UIEdgeInsets)getSafeAreaInsets{
    UIEdgeInsets safeInsets;
    if ( @available( iOS 11.0 , * ) ) {
        safeInsets = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;
    } else {
        safeInsets = [[[UIApplication sharedApplication] delegate] window].alignmentRectInsets;
    }
    return safeInsets;
}

-(CGRect)getSafeAreaFrame{
    CGRect safeFrame;
    if ( @available( iOS 11.0 , * ) ) {
        safeFrame = UIEdgeInsetsInsetRect([UIScreen mainScreen].bounds, [[[UIApplication sharedApplication] delegate] window].safeAreaInsets);
    } else {
        safeFrame = [UIScreen mainScreen].bounds;
    }
    return safeFrame;
}

@end
