//
//  UIView+Keyboard.h
//  
//
//  Created by coody on 2018/9/17.
//

#import <UIKit/UIKit.h>

@interface UIView (Keyboard)
@property (nonatomic , readonly) UIScrollView *mainScrollView;

-(void)initialKeyboardHeightObserver;

-(void)addKeyboardObserver;

-(void)removeKeyboardObserver;

@end
