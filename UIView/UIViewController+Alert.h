//
//  UIViewController+Alert.h
//  VWorld
//
//  Created by Coody on 2017/10/23.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

#pragma mark - Normal Alert
/**
 * @brief - (NSString *)msg
 */
-(void)showAlertWithMsg:(NSString *)msg;

/**
 * @brief - (NSString *)msg , (NSString *)title
 */
-(void)showAlertWithMsg:(NSString *)msg 
              withTitle:(NSString *)title;

/**
 * @brief - (NSString *)msg , (void(^)(NSInteger buttonIndex))responseBlock
 */
-(void)showAlertWithMsg:(NSString *)msg 
      withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

/**
 * @brief - (NSString *)msg , (NSString *)title , (void(^)(NSInteger buttonIndex))responseBlock
 */
-(void)showAlertWithMsg:(NSString *)msg 
              withTitle:(NSString *)title 
      withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

/**
 * @brief - (NSString *)msg , (NSString *)title , (NSArray<NSString *> *)buttonArray , (void(^)(NSInteger buttonIndex))responseBlock
 */
-(void)showAlertWithMsg:(NSString *)msg 
              withTitle:(NSString *)title 
          withBtnTitles:(NSArray<NSString *>*)btnArray 
      withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

#pragma mark - Error Alert
/**
 * @brief - (NSNumber *)errorCode , (NSString *)errorMsg
 */
-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg;

/**
 * @brief - (NSNumber *)errorCode , (NSString *)errorMsg , (NSString *)title
 */
-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
               withAlertTitle:(NSString *)title;

/**
 * @brief - (NSNumber *)errorCode , (NSString *)errorMsg , responseBlock
 */
-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
            withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

/**
 * @brief - (NSNumber *)errorCode , (NSString *)errorMsg , (NSString *)title , responseBlock
 */
-(void)showAlertWithErrorCode:(NSNumber *)number
                 withErrorMsg:(NSString *)msg
               withAlertTitle:(NSString *)title
            withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

/**
 * @brief - Action Sheet Alert : (NSString *)title , (NSString *)msg , (NSArray *)actionSheetArray , responseBlock
 */
-(void)showAlertWithActionSheetWithTitle:(NSString *)title 
                                 withMsg:(NSString *)msg 
                        withActionSheets:(NSArray<NSString *> *)actionSheetArray 
                       withResponseBlock:(void(^)(NSInteger buttonIndex))responseBlock;

@end
