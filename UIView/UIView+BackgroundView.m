//
//  UIView+BackgroundView.m
//  VWorld
//
//  Created by Coody on 2017/12/20.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "UIView+BackgroundView.h"

// for Tools
#import "Constants.h"
#include <objc/runtime.h>

@implementation UIView (BackgroundView)
CATEGORY_PROPERTY_GET_SET(UIImageView*, bgImageView, setBgImageView:)

-(void)initialBackgroundView:(UIImage *)bgImage{
    if( self.bgImageView == nil ){
        self.bgImageView = [[UIImageView alloc] initWithImage:bgImage];
        [self.bgImageView setFrame:[UIScreen mainScreen].bounds];
    }
    [self addSubview:self.bgImageView];
}

@end
