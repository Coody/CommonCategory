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
    CGRect tempFrame = [SafeAreaTool getSafeAreaFrame];
    CGFloat statusBarHeight = ( ([SafeAreaTool getSafeAreaInsets].top > 0) ? 0.0f : [[UIApplication sharedApplication] statusBarFrame].size.height);
    tempFrame = CGRectMake(tempFrame.origin.x,
                           tempFrame.origin.y +
                           statusBarHeight +
                           self.navigationController.navigationBar.frame.size.height,
                           tempFrame.size.width,
                           tempFrame.size.height -
                           statusBarHeight -
                           self.navigationController.navigationBar.frame.size.height -
                           self.tabBarController.tabBar.frame.size.height +
                           [SafeAreaTool getSafeAreaInsets].bottom);
    return tempFrame;
}

@end
