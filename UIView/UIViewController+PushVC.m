//
//  UIViewController+PushVC.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/20.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "UIViewController+PushVC.h"

@implementation UIViewController (PushVC)
-(void)pushVC:(UIViewController *)vc{
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = 0.5;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    [self presentViewController:vc animated:false completion:nil];
}

@end
