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

#include <objc/runtime.h>

#pragma makr - Dynamic Property
////////////////////////////////
#define Dynamic_Property( ObjectType , property , setProperty )\
Dynamic_Property_Getter( ObjectType , property)\
Dynamic_Property_Setter( ObjectType , property , setProperty , OBJC_ASSOCIATION_RETAIN_NONATOMIC )
//////// Getter ////////
#define Dynamic_Property_Getter( ObjectType , property )\
-(ObjectType)property\
{\
return objc_getAssociatedObject( self, @selector(property) );\
}
//////// Setter ////////
#define Dynamic_Property_Setter( ObjectType , property , setProperty , associationFlag) \
-(void)setProperty(ObjectType)property\
{\
objc_setAssociatedObject(self, @selector(property), property, associationFlag);\
}
////////////////////////////////

@implementation UIViewController (MiddleFrame)
Dynamic_Property(NSNumber*, statusBarHeight, setStatusBarHeight: )

-(CGRect)getMiddleFrame{
    CGRect tempFrame = [self getSafeAreaFrame];
    CGFloat statusBarHeight = ([self getSafeAreaInsets].top > 40 ? [self getSafeAreaInsets].top : 20);
    tempFrame = CGRectMake(tempFrame.origin.x,
                           statusBarHeight + 
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
    CGFloat statusBarHeight = ([self getSafeAreaInsets].top > 40 ? [self getSafeAreaInsets].top : 20);
    tempFrame = CGRectMake(tempFrame.origin.x,
                           statusBarHeight + 
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
