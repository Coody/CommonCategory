//
//  NSString+MD5.m
//  VWorld
//
//  Created by Coody on 2017/12/23.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "NSString+MD5.h"

#import <CommonCrypto/CommonDigest.h>

#import <Openssl/md5.h>

@implementation NSString (MD5)

- (NSString*)MD5
{
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, sizeof(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x",md5Buffer[i]];
    }
    
    return output;
}

- (NSString* )openSSLMd5
{
    // 输入参数 1 ：要生成 md5 值的字符串， NSString-->uchar*
    unsigned char *inStrg = ( unsigned char *)[[self dataUsingEncoding : NSASCIIStringEncoding ] bytes];
    
    // 输入参数 2 ：字符串长度
    unsigned long lngth = [self length];
    
    // 输出参数 3 ：要返回的 md5 值， MD5_DIGEST_LENGTH 为 16bytes ， 128 bits
    unsigned char result[ MD5_DIGEST_LENGTH ];
    
    // 临时 NSString 变量，用于把 uchar* 组装成可以显示的字符串： 2 个字符一 byte 的 16 进制数
    NSMutableString *outStrg = [ NSMutableString string ];
    
    // 调用 OpenSSL 函数
    MD5 (inStrg, lngth, result);
    unsigned int i;
    for (i = 0 ; i < MD5_DIGEST_LENGTH ; i++)
    {
        [outStrg appendFormat : @"%02x" , result[i]];
    }
    NSLog ( @"input string: %@" ,self);
    NSLog ( @"md5: %@" ,outStrg);
    return [outStrg copy];
}

@end
