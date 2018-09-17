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

static NSString *const kUIKeyboardAnimationCurveUserInfoKey = @"UIKeyboardAnimationCurveUserInfoKey";
static NSString *const kUIKeyboardAnimationDurationUserInfoKey = @"UIKeyboardAnimationDurationUserInfoKey";
static NSString *const kUIKeyboardBoundsUserInfoKey = @"UIKeyboardBoundsUserInfoKey";

@implementation UIView (Keyboard)
Dynamic_Property(UIScrollView *, mainScrollView, setMainScrollView:)
Dynamic_Property(NSNumber *, isAddKeyboardObser, setIsAddKeyboardObser:)
-(void)setIsAddObserverForKeyboard:(BOOL)isAddObserverForKeyboard{
    self.isAddKeyboardObser = [NSNumber numberWithBool:isAddObserverForKeyboard];
}

-(BOOL)isAddObserverForKeyboard{
    return [self.isAddKeyboardObser boolValue];
}

-(void)initialKeyboardHeightObserver{
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:self.frame];
    self.mainScrollView.contentSize = self.frame.size;
    UIView *superView = self.superview;
    [self.mainScrollView addSubview:self];
    [superView addSubview:self.mainScrollView];
    [self setIsAddObserverForKeyboard:NO];
}

-(void)addKeyboardObserver{
    if( self.isAddObserverForKeyboard == NO ){
        self.isAddObserverForKeyboard = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
}

-(void)removeKeyboardObserver{
    if( self.isAddObserverForKeyboard ){
        // 移除鍵盤監聽
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIKeyboardWillShowNotification
                                                      object:nil];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIKeyboardWillHideNotification
                                                      object:nil];
        self.isAddObserverForKeyboard = NO;
    }
}

-(void)keyboardShow:(NSNotification *)notification{
    
    NSDictionary *dictionary = notification.userInfo;
    
    UIViewAnimationCurve keyboardAnimationCurve =
    [[notification.userInfo objectForKey:kUIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    CGFloat keyboardAnimationDuration =
    [[notification.userInfo objectForKey:kUIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    CGRect keyboardBounds;
    [(NSValue *)[dictionary objectForKey:kUIKeyboardBoundsUserInfoKey] getValue:&keyboardBounds];
    
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:keyboardAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:
     ^{
         __strong __typeof(weakSelf)strongSelf = weakSelf;
         [UIView setAnimationCurve:keyboardAnimationCurve];
         
         [strongSelf.mainScrollView setFrame:CGRectMake(strongSelf.mainScrollView.frame.origin.x,
                                                        strongSelf.mainScrollView.frame.origin.y,
                                                        strongSelf.mainScrollView.frame.size.width,
                                                        strongSelf.mainScrollView.frame.size.height - keyboardBounds.size.height)];
     }completion:^(BOOL finished) {
         __strong __typeof(weakSelf)strongSelf = weakSelf;
         [strongSelf checkScroll];
     }];
    
}

- (void) keyboardHide: (NSNotification *)notification
{
    NSDictionary *dictionary = notification.userInfo;
    
    UIViewAnimationCurve keyboardAnimationCurve =
    [[notification.userInfo objectForKey:kUIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    CGFloat keyboardAnimationDuration =
    [[notification.userInfo objectForKey:kUIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    CGRect keyboardBounds;
    [(NSValue *)[dictionary objectForKey:kUIKeyboardBoundsUserInfoKey] getValue:&keyboardBounds];
    
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:keyboardAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:
     ^{
         __strong __typeof(weakSelf)strongSelf = weakSelf;
         [UIView setAnimationCurve:keyboardAnimationCurve];
         [strongSelf.mainScrollView setFrame:CGRectMake(strongSelf.mainScrollView.frame.origin.x,
                                                        strongSelf.mainScrollView.frame.origin.y,
                                                        strongSelf.mainScrollView.frame.size.width,
                                                        strongSelf.mainScrollView.frame.size.height + keyboardBounds.size.height)];
     }completion:^(BOOL finished) {
         __strong __typeof(weakSelf)strongSelf = weakSelf;
         [strongSelf checkScroll];
     }];
}

-(void)checkScroll{
    if( self.mainScrollView.contentSize.height >= self.mainScrollView.frame.size.height ){
        [self.mainScrollView setScrollEnabled:YES];
        // 關閉延遲響應事件
        self.mainScrollView.delaysContentTouches = NO;
    }
    else{
        [self.mainScrollView setScrollEnabled:NO];
    }
}

@end
