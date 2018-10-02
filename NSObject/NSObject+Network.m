//
//  NSObject+Network.m
//  TTQRCODE
//
//  Created by coodychou on 2018/10/2.
//  Copyright © 2018 coody. All rights reserved.
//

#import "NSObject+Network.h"

// for Network
#import <AFNetworking/AFNetworking.h>

// for Network
NSString *const kNSObjectService_NetworkOkKey = @"kNSObjectService_NetworkOkKey";
NSString *const kNSObjectService_NetworkFailKey = @"kNSObjectService_NetworkFailKey";

@implementation NSObject (Network)

+(void)addNetworkCheckService{
    static BOOL isFirstTime = YES;
    if( isFirstTime ){
        isFirstTime = NO;
        
        
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
            if( status == AFNetworkReachabilityStatusNotReachable ){
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:kNSObjectService_NetworkFailKey
                 object:self userInfo:nil];
                
            }
            else{
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:kNSObjectService_NetworkOkKey
                 object:self userInfo:nil];
            }
        }];
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
}

@end
