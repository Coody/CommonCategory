//
//  UIViewController+Alert.h
//  VWorld
//
//  Created by Coody on 2017/10/23.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

// Normal
-(void)showAlertWithMsg:(NSString *)msg;

-(void)showAlertWithMsg:(NSString *)msg 
              withTitle:(NSString *)title;

-(void)showAlertWithMsg:(NSString *)msg 
      withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

-(void)showAlertWithMsg:(NSString *)msg 
              withTitle:(NSString *)title 
      withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

// Error
-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg;

-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
               withAlertTitle:(NSString *)title;

-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
            withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
               withAlertTitle:(NSString *)title
            withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

@end
