//
//  NSObject+ScreenBrightness.h
//  TTQRCODE
//
//  Created by coodychou on 2018/10/5.
//  Copyright © 2018 coody. All rights reserved.
//

#import <Foundation/Foundation.h>

extern CGFloat kCommonCategoryScreenBrightness;

@interface NSObject (ScreenBrightness)

-(void)setScreenBrightnessToHightness;

-(void)restoreScreenBrightnessToUserDefault;

@end
