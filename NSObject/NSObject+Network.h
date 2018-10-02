//
//  NSObject+Network.h
//  TTQRCODE
//
//  Created by coodychou on 2018/10/2.
//  Copyright © 2018 coody. All rights reserved.
//

#import <Foundation/Foundation.h>

// for Network
extern NSString *const kNSObjectService_NetworkOkKey;
extern NSString *const kNSObjectService_NetworkFailKey;

@interface NSObject (Network)

+(void)addNetworkCheckService;

@end
