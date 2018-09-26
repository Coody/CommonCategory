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
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    tempFrame = CGRectMake(tempFrame.origin.x,
                           tempFrame.origin.y +
                           statusBarSize.height +
                           self.navigationController.navigationBar.frame.size.height,
                           tempFrame.size.width,
                           tempFrame.size.height -
                           statusBarSize.height -
                           self.navigationController.navigationBar.frame.size.height -
                           self.tabBarController.tabBar.frame.size.height);
    return tempFrame;
}

@end
