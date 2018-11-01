//
//  UIViewController+Navigation.m
//  TTQRCODE
//
//  Created by coodychou on 2018/10/31.
//  Copyright © 2018 coody. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)
-(void)initialNavigationLeftButton:(UIButton *)leftButton{
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:menuItem];
}


-(void)initialNavigationRightButton:(UIButton *)rightButton{
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:menuItem];
}
@end
