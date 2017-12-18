//
//  UIViewController+Alert.m
//  VWorld
//
//  Created by Coody on 2017/10/23.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

-(void)showAlertWithMsg:(NSString *)msg{
    [self showAlertWithErrorCode:nil
                    withErrorMsg:msg
                  withAlertTitle:@""
               withResponseBlock:nil];
}

-(void)showAlertWithMsg:(NSString *)msg 
              withTitle:(NSString *)title{
    [self showAlertWithErrorCode:nil
                    withErrorMsg:msg
                  withAlertTitle:title
               withResponseBlock:nil];
}

-(void)showAlertWithMsg:(NSString *)msg 
      withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock{
    [self showAlertWithErrorCode:nil
                    withErrorMsg:msg
                  withAlertTitle:@""
               withResponseBlock:responseBlock];
}

-(void)showAlertWithMsg:(NSString *)msg 
              withTitle:(NSString *)title 
      withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock{
    [self showAlertWithErrorCode:nil
                    withErrorMsg:msg
                  withAlertTitle:title
               withResponseBlock:responseBlock];
}

-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg{
    [self showAlertWithErrorCode:number
                    withErrorMsg:msg
                  withAlertTitle:@""
               withResponseBlock:nil];
}

-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
               withAlertTitle:(NSString *)title{
    [self showAlertWithErrorCode:number
                    withErrorMsg:msg
                  withAlertTitle:title
               withResponseBlock:nil];
}

-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
            withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock{
    [self showAlertWithErrorCode:number
                    withErrorMsg:msg
                  withAlertTitle:@""
               withResponseBlock:responseBlock];
}

-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
               withAlertTitle:(NSString *)title
            withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock{
    NSString *totalMsg;
    if( number == nil ){
        totalMsg = msg;
    }
    else{
        totalMsg = [NSString stringWithFormat:@"%@(%@)" , msg , number];
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:totalMsg
                                                            preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {
                                                         if( responseBlock != nil ){
                                                             responseBlock(0);
                                                         }
                                                     }];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
