//
//  AppToast.h
//  TTQRCODE
//
//  Created by coodychou on 2018/9/19.
//  Copyright © 2018年 coody. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM( NSInteger , EnumAppToastPosition ){
    EnumAppToastPosition_Top,
    EnumAppToastPosition_Middle,
    EnumAppToastPosition_Bottom,
    EnumAppToastPosition_Custom
};

extern CGFloat const kAppToastDefault_Duration;
extern EnumAppToastPosition const kAppToastDefault_Position;
extern CGFloat const kAppToastDefault_Alpha;
extern CGFloat const kAppToastDefault_CornerRadius;
extern CGFloat const kAppToastDefault_FontSize;

@interface AppToast : UIView
+(AppToast *)getShortToast;
+(AppToast *)getForeverToast;
-(instancetype)initWithText:(NSString *)tempText withIsForever:(BOOL)isForever;
-(void)show;
-(void)showForever;
-(void)hide;
-(void)hideForeverTemplate;
-(void)setShowDuration:(NSUInteger)duration;
-(void)setShowPosition:(EnumAppToastPosition)toastPosition;
-(void)setShowAlpha:(CGFloat)alpha;
-(void)setShowCornerRadius:(CGFloat)cornerRadius;
-(void)setShowFontSize:(CGFloat)fontSize;

@end
