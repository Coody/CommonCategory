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
        __weak __typeof(self)weakSelf = self;
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
            if( status == AFNetworkReachabilityStatusNotReachable ){
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:kNSObjectService_NetworkFailKey
                 object:strongSelf userInfo:nil];
            }
            else{
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:kNSObjectService_NetworkOkKey
                 object:strongSelf userInfo:nil];
            }
        }];
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    }
}

@end
