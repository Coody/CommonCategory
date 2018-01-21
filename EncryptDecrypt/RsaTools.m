//
//  RsaTools.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/14.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "RsaTools.h"

// for Rsa
#import "SSCrypto.h"
#import "MIHKeyPair.h"
#import "MIHRSAKeyFactory.h"
#import "MIHRSAPublicKey.h"
#import "MIHRSAPublicKey+SeparateKey.h"
#import "MIHRSAPrivateKey.h"
#import "MIHRSAPrivateKey+Decrypt.h"

// for Tools
#import "NSData+NSString.h"
#import "NSString+Base64.h"
#import "NSString+HexStringToData.h"

@interface RsaTools()
@property (nonatomic , strong) NSData *publicKey;
@property (nonatomic , strong) NSData *privateKey;
@property (nonatomic , strong) SSCrypto *crypto;
@property (nonatomic , strong) MIHRSAKeyFactory *key;
@property (nonatomic , strong) MIHKeyPair *keyPair;
@end

@implementation RsaTools

-(instancetype)init{
    self = [super init];
    if( self ){
        _publicKey = nil;
        _privateKey = nil;
        _crypto = [[SSCrypto alloc] init];
        _key = nil;
    }
    return self;
}

-(NSString *)getPublicKeyString{
//    NSMutableString *cleanPublicKey = [[NSMutableString alloc] init];
//    NSString *key = [_publicKey utf8String];
//    NSArray *stringArray = [key componentsSeparatedByString:@"\n"];
//    for( NSString *appendString in stringArray ){
//        if([appendString containsString:@"BEGIN PUBLIC KEY"] ||
//           [appendString containsString:@"END PUBLIC KEY"] ||
//           [appendString isEqualToString:@""]){
//            // pass
//        }
//        else{
//            [cleanPublicKey appendFormat:@"\n"];
//            [cleanPublicKey appendString:appendString];
//        }
//    }
//    NSMutableString *noNewlineString = [[NSMutableString alloc] init];
//    for( NSString *appendString in [ componentsSeparatedByString:@"\n"] ){
//        [noNewlineString appendString:appendString];
//    }
//    
    
    MIHRSAPublicKey *public = _keyPair.public;
    return [[public getKey] encryptToBase64];
}

-(NSString *)getPrivateKeyString{
    return [_privateKey utf8String];
}

#pragma mark
+(instancetype)sharedInstance{
    static RsaTools *instance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once( &onceToken , ^{
        instance = [[RsaTools alloc] init];
    });
    return instance;
}

-(void)generateKeyWithLength:(int)length{
    if( _privateKey == nil || _publicKey == nil ){
        _privateKey = [SSCrypto generateRSAPrivateKeyWithLength:length];
        _publicKey = [SSCrypto generateRSAPublicKeyFromPrivateKey:_privateKey];
        [_crypto setPrivateKey:_privateKey];
        [_crypto setPublicKey:_publicKey];
    }
    else{
#ifdef D_Debug
        NSLog(@"Please call \"resetKey\" !!");
#endif
    }
}

-(void)generate1024Key{
    if( _key == nil && _keyPair == nil ){
        _key = [MIHRSAKeyFactory new];
        _key.preferedKeySize = MIHRSAKey1024;
        _keyPair = [_key generateKeyPair];
    }
    else{
#ifdef D_Debug
        NSLog(@"Please call \"resetKey\" !!");
#endif
    }
}

-(NSData *)decrypt:(NSString *)encryptString{
//    return [_crypto decrypt:encryptString];
    MIHRSAPrivateKey *privateKey = _keyPair.private;
    NSData *encryptData = [encryptString dataFromHexString];
    NSError *error = nil;
    NSData *decryptData = [privateKey decrypt:encryptData 
                                      padding:RSA_PKCS1_PADDING 
                                        error:&error];
    if( error ){
#ifdef D_Debug
        NSLog(@"Decrypt error!!!");
#endif
        decryptData = nil;
    }
    return decryptData;
}

-(void)resetKey{
//    _privateKey = nil;
//    _publicKey = nil;
    _key = nil;
    _keyPair = nil;
}

@end
