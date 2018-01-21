//
//  NSData+NSString.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/14.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "NSData+NSString.h"

@implementation NSData (NSString)

-(NSString *)utf8String{
    NSString *utf8String = [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    return utf8String;
}

@end
