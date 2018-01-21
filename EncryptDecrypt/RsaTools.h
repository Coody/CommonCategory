//
//  RsaTools.h
//  VWorld
//
//  Created by Chou Coody on 2018/1/14.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RsaTools : NSObject

+(instancetype)sharedInstance;

//-(void)generateKeyWithLength:(int)length;
-(void)generate1024Key;

-(NSString *)getPublicKeyString;

-(NSString *)getPrivateKeyString;

-(NSData *)decrypt:(NSString *)encryptString;

-(void)resetKey;

@end
