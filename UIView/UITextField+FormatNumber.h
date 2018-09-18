//
//  UITextField+FormatNumber.h
//  TTQRCODE
//
//  Created by coodychou on 2018/9/18.
//  Copyright © 2018年 coody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (FormatNumber)<UITextFieldDelegate>
-(void)isNeedFormatNumber:(BOOL)isNeed;
@end
