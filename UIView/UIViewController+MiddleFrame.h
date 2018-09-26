//
//  UIViewController+MiddleFrame.h
//  TTQRCODE
//
//  Created by coodychou on 2018/9/26.
//  Copyright © 2018 coody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MiddleFrame)

/**
 * @brief - 取得 middle frame , 排除 NavigationBar , TabBar , StatusBar
 */
-(CGRect)getMiddleFrame;

@end

