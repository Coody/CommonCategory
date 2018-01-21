//
//  NSString+Json.m
//  VWorld
//
//  Created by Coody on 2017/12/25.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "NSString+Json.h"

@implementation NSString (Json)

-(NSData *)convertJsonData{
    id jsonData = nil;
    NSError *error = nil;
    @try
    {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        jsonData = [NSJSONSerialization JSONObjectWithData:data 
                                                   options:kNilOptions 
                                                     error:&error];
    }
    @catch (NSException *exception)
    {
        NSLog(@"\n\nClass: %@\nMethods: %@\n got Error:\n%@\n\n" , NSStringFromClass([self class]) , NSStringFromSelector(_cmd) , exception );
        jsonData = nil;
    }
    return jsonData;
}

@end
