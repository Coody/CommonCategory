//
//  NSDictionary+Json.m
//  VWorld
//
//  Created by Coody on 2017/12/25.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "NSDictionary+Json.h"

@implementation NSDictionary (Json)

-(NSString *)convertToString{
    NSString *jsonString = nil;
    NSError *error = nil;
    @try
    {
        if ([NSJSONSerialization isValidJSONObject:self])
        {
            NSData *myData = [NSJSONSerialization dataWithJSONObject:self 
                                                             options:NSJSONWritingPrettyPrinted 
                                                               error:&error];
            jsonString = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
        }
        else
        {
            NSLog(@"\n\nClass: %@\nMethods: %@\n jsonObj(%@) is illgeal.", NSStringFromClass([self class]), NSStringFromSelector(_cmd), self);
        }
    }
    @catch (NSException *exception)
    {
        NSLog(@"\n\nClass: %@\nMethods: %@\n got Error:\n%@\n\n" , NSStringFromClass([self class]) , NSStringFromSelector(_cmd) , exception );
        jsonString = nil;
    }
    
    return jsonString;
}

@end
