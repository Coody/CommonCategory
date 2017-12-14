//
//  NSArray+RevertArray.m
//  WebViewApp
//
//  Created by CoodyChou on 2017/12/14.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "NSArray+RevertArray.h"

@implementation NSArray (RevertArray)

- (NSArray *)revertArray{
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    /* 反轉陣列的方法（目前沒用到，但留著做記錄，未來可能會用到） */
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for ( id unit in enumerator ) {
        [newArray addObject:unit];
    }
    return newArray;
}

@end
