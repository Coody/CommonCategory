//
//  UITextField+ClearButton.h
//  TextFieldTool
//
//  Created by CoodyChou on 2018/4/16.
//  Copyright © 2018年 CoodyChou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ClearButton)

/**
 * @brief 初始化
 *
 * @warning 一定要呼叫否則 clear button 會沒作用
 */
-(void)initialCustomClearButton;

/**
 * @brief 設定按鈕距離右邊的邊界多少，沒設定的話預設為 6.0f
 *
 * @param tempRightMargin : 不得為負數，請輸入 >= 0 的 CGFloat
 */
-(void)setRightMarginDistance:(CGFloat )tempRightMargin;

/**
 * @brief 設定 clear button 的 Image
 *
 * @detail 此按鈕的 frame 會依據 UITextField 的高度來做成 (width: textField.frame.size.height , height: textField.frame.size.height) 長寬相等的正方體
 */
-(void)setClearButtonImage:(UIImage *)tempClearButtonImage;

/**
 * @brief 直接設定 clear button
 *
 * @detail 此按鈕的 frame 會依據你的按鈕 frame 來設定大小
 */
-(void)setClearButton:(UIButton *)tempClearButton;

#pragma mark - 請加入監聽
/**
 * @brief 請加入 UITextField 的 UIControlEventEditingChanged
 *
 * @detail 加入 exp: [_textField addTarget:_textField action:@selector(editTextField:) forControlEvents:(UIControlEventEditingChanged)];
 *
 * @warning 如果不加入輸入字串會無法判斷。
 */
-(void)editTextField:(id)sender;

@end
