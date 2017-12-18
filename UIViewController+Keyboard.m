//
//  UIViewController+Keyboard.m
//
//  Created by Coody on 2017/10/30.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "UIViewController+Keyboard.h"

#import "AppConstant.h"
#include <objc/runtime.h>

@implementation UIViewController (Keyboard)

CATEGORY_PROPERTY_GET_SET(UITapGestureRecognizer*, tapGesture, setTapGesture:)

-(void)addTap{
    if ( self.tapGesture == nil ) {
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.tapGesture setCancelsTouchesInView:NO];
    }
    [self.view addGestureRecognizer:self.tapGesture];
}

-(void)tap:(id)sender{
    [self.view endEditing:YES];
}

@end
