//
//  NSString+Common.m
//  VWorld
//
//  Created by Coody on 2017/12/19.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

+(BOOL)isNotEmptyString:(NSString *)checkString{
    BOOL isEmpty = NO;
    if( checkString == nil || [checkString isEqualToString:@""] ){
        isEmpty = YES;
    }
    return !isEmpty;
}

-(BOOL)isNotEmpty{
    return [NSString isNotEmptyString:self];
}

@end
