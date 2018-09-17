//
//  UIView+Keyboard.m
//  
//
//  Created by coody on 2018/9/17.
//

#import "UIView+Keyboard.h"

#include <objc/runtime.h>

#pragma mark - Dynamic Property
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

@implementation UIView (Keyboard)

-(void)addKeyboardObserver{
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardShow:)
                                                 name: UIKeyboardWillShowNotification
                                               object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardHide:)
                                                 name: UIKeyboardWillHideNotification
                                               object: nil];
}

-(void)removeKeyboardObserver{
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardShow:)
                                                 name: UIKeyboardWillShowNotification
                                               object: nil];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(keyboardHide:)
                                                 name: UIKeyboardWillHideNotification
                                               object: nil];
}

@end
