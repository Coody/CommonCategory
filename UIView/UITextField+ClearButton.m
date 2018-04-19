//
//  UITextField+ClearButton.m
//  TextFieldTool
//
//  Created by CoodyChou on 2018/4/16.
//

#import "UITextField+ClearButton.h"

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

static CGFloat const kXSGTextFieldClearButtonRightMargin = 6.0f;

@implementation UITextField (ClearButton)
Dynamic_Property(UIButton*,clearBtn,setClearBtn:)
Dynamic_Property(UIImage*, clearButtonImg, setClearButtonImg:)
Dynamic_Property(UIImageView*, clearButtonImageView, setClearButtonImageView:)
Dynamic_Property(NSNumber*, isShow, setIsShow:)
Dynamic_Property(NSNumber*, customClearButtonMode, setCustomClearButtonMode:)
Dynamic_Property(NSNumber*, rightMargin , setRightMargin:)

-(void)initialCustomClearButton{
    self.isShow = @NO;// 目前沒用到
    self.clearButtonImageView = nil;
    // 設定 Clear Button Mode
    self.customClearButtonMode = @(self.clearButtonMode);
    self.rightMargin = @(kXSGTextFieldClearButtonRightMargin);
    self.clearButtonMode = UITextFieldViewModeNever;
    [self resetClearButton];
    [self addTarget:self action:@selector(editTextField:) forControlEvents:(UIControlEventEditingChanged)];
}

-(void)setRightMarginDistance:(CGFloat )tempRightMargin{
    if( tempRightMargin < 0 ){
        NSLog(@"Can't set right margin negative number !!");
    }
    else{
        self.rightMargin = @(tempRightMargin);
    }
}

-(void)setClearButtonImage:(UIImage *)tempClearButtonImage{
    if( tempClearButtonImage == nil ){
        NSLog(@"Can't set Clear Button Image to nil !!");
    }
    else{
        self.clearButtonImg = tempClearButtonImage;
        if( self.clearButtonImageView == nil ){
            self.clearButtonImageView = [[UIImageView alloc] initWithImage:self.clearButtonImg];
            
        }
        else{
            [self.clearButtonImageView setImage:self.clearButtonImg];
        }
        // 調整位置
        [self resetImagePosition];
        [self.clearBtn addSubview:self.clearButtonImageView];
        [self editTextField:self];
    }
}

-(void)setClearButton:(UIButton *)tempClearButton{
    if( self.clearBtn != nil ){
        [self.clearBtn removeTarget:self action:@selector(pressedClearBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    self.clearBtn = tempClearButton;
    [self.clearBtn addSubview:self.clearButtonImageView];
    
    // 設定 frame 調整位置
    [self resetClearButton];
    [self resetImagePosition];
}

#pragma mark - Private
-(BOOL)checkTextField{
    BOOL isOK = YES;
    if( self.text == nil || [self.text isEqualToString:@""] ){
        isOK = NO;
    }
    return isOK;
}

-(void)resetClearButton{
    if( self.clearBtn == nil ){
        self.clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - self.frame.size.height - [self.rightMargin floatValue],
                                                                   0,
                                                                   self.frame.size.height,
                                                                   self.frame.size.height)];
    }
    else{
        [self.clearBtn setFrame:CGRectMake(self.frame.size.width - self.clearBtn.frame.size.width - [self.rightMargin floatValue],
                                           0,
                                           self.clearBtn.frame.size.width,
                                           self.clearBtn.frame.size.height)];
        [self.clearBtn removeTarget:self action:@selector(pressedClearBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    [self.clearBtn addTarget:self action:@selector(pressedClearBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    self.rightView = self.clearBtn;
    self.rightViewMode = UITextFieldViewModeAlways;
    [self editTextField:self];
}

-(void)resetImagePosition{
    // 調整位置
    [self.clearButtonImageView setFrame:CGRectMake((self.clearBtn.frame.size.width - self.clearButtonImg.size.width)*0.5,
                                                   (self.clearBtn.frame.size.height - self.clearButtonImg.size.height)*0.5,
                                                   self.clearButtonImg.size.width,
                                                   self.clearButtonImg.size.height)];
}

-(void)pressedClearBtn:(id)sender{
    self.text = @"";
    // 隱藏圖片、 disable button
    [self editTextField:self];
}

#pragma mark - 加入監聽
-(void)editTextField:(id)sender{
    if( sender == self ){
        if( [self checkTextField] ){
            // 顯示圖片、 enable button
            [self.clearBtn setEnabled:YES];
            [self.clearBtn setHidden:NO];
            [self.clearButtonImageView setHidden:NO];
            self.isShow = @YES;
        }
        else{
            // 隱藏圖片、 disable button
            [self.clearBtn setEnabled:NO];
            [self.clearBtn setHidden:YES];
            [self.clearButtonImageView setHidden:YES];
            self.isShow = @NO;
        }
    }
}

@end
