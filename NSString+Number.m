//
//  NSString+Number.m
//  VWorld
//
//  Created by Coody on 2017/12/19.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

+(NSString *)formatNumberWithValue:(NSInteger)value{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *reVal = [formatter stringFromNumber:[NSNumber numberWithLongLong:value]];
    return reVal;
}

+(NSString *)formatNumberWithValue:(float)value 
                        withFormat:(NSString *)format{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:format];
    NSString *reVal = [formatter stringFromNumber:[NSNumber numberWithFloat:value]];
    return reVal;
}

@end
