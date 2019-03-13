//
//  NSLocale+CountryEmoji.m
//  CountryEmoji
//
//  Created by coodychou on 2019/3/13.
//  Copyright © 2019 coodychou. All rights reserved.
//

#import "NSLocale+CountryEmoji.h"

@implementation NSLocale (CountryEmoji)
+ (NSString *)emojiFlagForISOCountryCode:(NSString *)countryCode {
    NSAssert(countryCode.length == 2, @"Expecting ISO country code");
    
    int base = 127462 -65;
    
    wchar_t bytes[2] = {
        base +[countryCode characterAtIndex:0],
        base +[countryCode characterAtIndex:1]
    };
    
    return [[NSString alloc] initWithBytes:bytes
                                    length:countryCode.length *sizeof(wchar_t)
                                  encoding:NSUTF32LittleEndianStringEncoding];
}
@end
