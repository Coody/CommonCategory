//
//  NSString+Base64.h
//  VWorld
//
//  Created by Chou Coody on 2018/1/11.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Base64)

-(NSString *)decryptFromBase64;

-(NSString *)encryptToBase64;

@end
