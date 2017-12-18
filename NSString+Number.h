//
//  NSString+Number.h
//  VWorld
//
//  Created by Coody on 2017/12/19.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Number)

/** 產生數字 format (例： 10000 => 10,000 的字串) */
+(NSString *)formatNumberWithValue:(NSInteger)value;

/** 給定數字 format （如：@"###,###,###,###.##" ），產生數字 format (例： 10000 => 10,000.00 的字串) */
+(NSString *)formatNumberWithValue:(float)value 
                        withFormat:(NSString *)format;

@end
