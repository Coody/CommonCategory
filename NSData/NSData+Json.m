//
//  NSData+Json.m
//  TTQRCODE
//
//  Created by coodychou on 2018/9/28.
//  Copyright © 2018 coody. All rights reserved.
//

#import "NSData+Json.h"

@implementation NSData (Json)

-(NSDictionary *)toJsonObject{
    NSError* error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:self
                                                         options:kNilOptions
                                                           error:&error];
    if( error && json ){
        NSLog(@" NSData (%@) is not a Json Data!!!\n\n Error: (%ld)%@\n\n" , self , (long)error.code , error.description);
        return nil;
    }
    else{
        return json;
    }
}

@end
