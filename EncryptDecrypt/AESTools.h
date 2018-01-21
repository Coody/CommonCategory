//
//  AESTools.h
//  VWorld
//
//  Created by CoodyChou on 2018/1/17.
//  Copyright © 2018年 Coody. All rights reserved.
//

@interface AESTools : NSObject

+(instancetype)sharedInstance;

-(void)setAESKey:(NSString *)key iv:(NSString *)iv;
-(void)resetAESKey;

-(NSString *)encryptData:(NSData *)originalData;

-(NSString *)encryptString:(NSString *)originalString;

-(NSString *)encryptDic:(NSDictionary *)originalDic;

@end
