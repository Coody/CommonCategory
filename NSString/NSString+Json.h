//
//  NSString+Json.h
//  VWorld
//
//  Created by Coody on 2017/12/25.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Json)

-(NSData *)convertJsonData;

-(NSDictionary *)convertToJsonDic;

@end
