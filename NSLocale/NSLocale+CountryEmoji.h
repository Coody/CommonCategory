//
//  NSLocale+CountryEmoji.h
//  CountryEmoji
//
//  Created by coodychou on 2019/3/13.
//  Copyright © 2019 coodychou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSLocale (CountryEmoji)
+ (NSString *)emojiFlagForISOCountryCode:(NSString *)countryCode;
@end

