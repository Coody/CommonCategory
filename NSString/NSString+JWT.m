//
//  NSString+JWT.m
//  VWorld
//
//  Created by Coody on 2017/10/29.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "NSString+JWT.h"

#import "JWT.h"
#import "JWTAlgorithm.h"

@implementation NSString (JWT)

-(NSDictionary *)decodeWithHS256{
    
    // => "eyJmb28iOiJiYXIifQ"

    
//    NSString *jwtResultOrError = [self copy];
////    NSString *secret = @"secret";
//    JWTCodingResultType *decodedResult = [JWTDecodingBuilder decodeMessage:yourJwt].claimsSet(claimsSet).addHolder(holder).options(options).and.result;

//    JWTBuilder *builder = [JWT decodeMessage:jwtResultOrError].secret(@"secret").whitelist(@[@"HS256", @"JWT"]);
    
    NSArray *segments = [self componentsSeparatedByString:@"."];
    NSString *base64String = [segments objectAtIndex: 1];
    NSLog(@"%@", base64String);
    
    int requiredLength = (int)(4 * ceil((float)[base64String length] / 4.0));
    int nbrPaddings = requiredLength - [base64String length];
    
    if (nbrPaddings > 0) {
        NSString *padding =
        [[NSString string] stringByPaddingToLength:nbrPaddings
                                        withString:@"=" startingAtIndex:0];
        base64String = [base64String stringByAppendingString:padding];
    }
    
    base64String = [base64String stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    
    NSData *decodedData =
    [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    NSString *decodedString =
    [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", decodedString);
    // => "{\"foo\":\"bar\"}"
    
    NSDictionary *decoded = [NSJSONSerialization JSONObjectWithData:[decodedString dataUsingEncoding:NSUTF8StringEncoding] 
                                                            options:0 
                                                              error:nil];
    
    if ( decoded == nil || [decoded count] <= 0) {
        NSLog(@"JWT parser Error!!! Please check it!!");
        return nil;
    }
    else {
        return decoded;
    }
}


@end
