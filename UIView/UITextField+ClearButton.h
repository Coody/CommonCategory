//
//  UITextField+ClearButton.h
//  TextFieldTool
//
//  Created by CoodyChou on 2018/4/16.
//

#import <UIKit/UIKit.h>

@interface UITextField (ClearButton)

/**
 * @brief Initialize Custon clear button
 *
 * @warning must call this methods or clear button can't work.
 */
-(void)initialCustomClearButton;

/**
 * @brief set right margin, default is 6.0f
 *
 * @param tempRightMargin : no negative number, please use >= 0 CGFloat value.
 */
-(void)setRightMarginDistance:(CGFloat )tempRightMargin;

/**
 * @brief set Image for clear button
 *
 * @detail 此按鈕的 frame 會依據 UITextField 的高度來做成 (width: textField.frame.size.height , height: textField.frame.size.height) 長寬相等的正方體
 *
 * @detail button's frame is (width: textField.frame.size.height , height: textField.frame.size.height)
 *
 */
-(void)setClearButtonImage:(UIImage *)tempClearButtonImage;

/**
 * @brief Set your custom clear button
 *
 * @detail 此按鈕的 frame 會依據你的按鈕 frame 來設定大小
 * @detail This button's frame will use your button's frame.
 *
 */
-(void)setClearButton:(UIButton *)tempClearButton;

#pragma mark -
/**
 * @brief 請加入 UITextField 的 UIControlEventEditingChanged
 * @brief ckeck TextField
 */
-(void)editTextField:(id)sender;

@end
