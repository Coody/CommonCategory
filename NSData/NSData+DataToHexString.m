//
//  NSData+DataToHexString.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/18.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "NSData+DataToHexString.h"

@implementation NSData (DataToHexString)

-(NSString *)dataToHexString{
    const unsigned char *bytes = [self bytes];
    NSMutableString *hexString = [NSMutableString stringWithCapacity:[self length] * 2];
    for ( int i = 0 ; i < [self length] ; i++ ) {
        [hexString appendFormat:@"%02X" , (NSUInteger)bytes[i]];
    }
    return [NSString stringWithString:hexString];
    
    
    
//    const unsigned char *dbytes = [data bytes];
//    NSMutableString *hexStr =
//    [NSMutableString stringWithCapacity:[data length]*2];
//    int i;
//    for (i = 0; i < [data length]; i++) {
//        [hexStr appendFormat:@"%02x ", dbytes[i]];
//    }
//    return [NSString stringWithString: hexStr];
}

@end
