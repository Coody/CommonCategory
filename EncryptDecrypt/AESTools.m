//
//  AESTools.m
//  VWorld
//
//  Created by CoodyChou on 2018/1/17.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "AESTools.h"

// for Tools
#import "MIHAESKey.h"
#import "NSString+Base64.h"
#import "NSData+DataToHexString.h"
#import "NSData+NSString.h"
#import "NSDictionary+Json.h"

@interface AESTools()
@property (nonatomic , strong) MIHAESKey *aesKey;
@end

@implementation AESTools

#pragma mark
+(instancetype)sharedInstance{
    static AESTools *instance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once( &onceToken , ^{
        instance = [[AESTools alloc] init];
    });
    return instance;
}

-(void)setAESKey:(NSString *)key iv:(NSString *)iv{
    if( _aesKey == nil ){
        _aesKey = [[MIHAESKey alloc] initWithKey:[key encryptToBase64Data] 
                                              iv:[iv encryptToBase64Data]];
    }
    else{
#ifdef D_Debug
        NSLog(@"Please use \"resetAESKEy\" function !");
#endif
    }
}

-(void)resetAESKey{
    _aesKey = nil;
}

-(NSString *)encryptData:(NSData *)originalData{
    NSError *error;
    NSData *encryptData = [_aesKey encrypt:originalData error:&error];
    if( error ){
        encryptData = nil;
#ifdef D_Debug
        NSLog(@"AES encrypt fail !!");
#endif
    }
    return [encryptData dataToHexString];
}

-(NSString *)encryptString:(NSString *)originalString{
    NSData *originalData = [originalString encryptToBase64Data];
    return [self encryptData:originalData];
}

-(NSString *)encryptDic:(NSDictionary *)originalDic;{
    NSString *originalString = [originalDic convertToString];
    return [self encryptString:originalString];
}

@end
