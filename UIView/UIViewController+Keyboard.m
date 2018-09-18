//
//  UIViewController+Keyboard.m
//  VWorld
//
//  Created by Coody on 2017/10/30.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "UIViewController+Keyboard.h"

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

@implementation UIViewController (Keyboard)
Dynamic_Property(NSNumber *, isNeedIgnore, setIsNeedIgnore:)
Dynamic_Property(UITapGestureRecognizer*, tapGesture, setTapGesture:)

-(void)addTap:(BOOL)isNeedIgnoreTouch{
    self.isNeedIgnore = @(isNeedIgnoreTouch);
    if ( self.tapGesture == nil ) {
        self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    }
    [self.tapGesture setCancelsTouchesInView:![self.isNeedIgnore boolValue]];
    [self.view addGestureRecognizer:self.tapGesture];
}

-(void)addTap{
    [self addTap:YES];
}

-(void)tap:(id)sender{
    [self.view endEditing:YES];
}

@end
