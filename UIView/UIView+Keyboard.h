//
//  UIView+Keyboard.h
//  
//
//  Created by coody on 2018/9/17.
//

@interface UIView (Keyboard)
@property (nonatomic , assign) BOOL isAddObserverForKeyboard;

-(void)addKeyboardObserver;

-(void)removeKeyboardObserver;

@end
