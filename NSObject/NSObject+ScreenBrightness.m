//
//  NSObject+ScreenBrightness.m
//  TTQRCODE
//
//  Created by coodychou on 2018/10/5.
//  Copyright © 2018 coody. All rights reserved.
//

#import "NSObject+ScreenBrightness.h"

CGFloat kCommonCategoryScreenBrightness;

@implementation NSObject (ScreenBrightness)

-(void)setScreenBrightnessToHightness{
    kCommonCategoryScreenBrightness = [UIScreen mainScreen].brightness;
    [[UIScreen mainScreen] setBrightness:1.0f];
}

-(void)restoreScreenBrightnessToUserDefault{
    if( kCommonCategoryScreenBrightness < 0.0f || kCommonCategoryScreenBrightness > 1.0f ){
        kCommonCategoryScreenBrightness = [UIScreen mainScreen].brightness;
    }
    [[UIScreen mainScreen] setBrightness:kCommonCategoryScreenBrightness];
}

@end
