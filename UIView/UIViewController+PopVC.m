//
//  UIViewController+PopVC.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/21.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "UIViewController+PopVC.h"

@implementation UIViewController (PopVC)

-(void)popVC{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.4;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromLeft;
    [self.view.window.layer addAnimation:transition forKey:nil];
    [self dismissViewControllerAnimated:NO completion:nil]; 
}

@end
