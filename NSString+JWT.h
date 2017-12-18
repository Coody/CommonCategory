//
//  NSString+JWT.h
//  VWorld
//
//  Created by Coody on 2017/10/29.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JWT)

-(NSDictionary *)decodeWithHS256;

@end
