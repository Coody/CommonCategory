//
//  NSString+Base64.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/11.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

-(NSString *)decryptFromBase64String:(NSString *)encryptBase64String{
    NSString *decryptString = nil;
    BOOL isOK = NO;
    if( encryptBase64String != nil && 
        ![encryptBase64String isEqualToString:@""] ){
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:encryptBase64String 
                                                                  options:NSDataBase64DecodingIgnoreUnknownCharacters];
        decryptString = [[NSString alloc] initWithData:decodedData 
                                              encoding:NSUTF8StringEncoding];
        if( decryptString != nil && ![decryptString isEqualToString:@""] ){
            isOK = YES;
        }
    }
    if( isOK == NO ){
        NSLog(@"You enter wrong Base64 String!! Please recheck it!!");
    }
    else{
        NSLog(@"Decrypt base64 string success.");
    }
    return [decryptString cpoy];
}

-(NSString *)encryptToBase64{
    NSData *encodeData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return [base64String copy];
}

@end
