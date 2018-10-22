//
//  UIView+Badget.h
//  App
//
//  Created by Coody on 2016/4/1.
//

#import <UIKit/UIKit.h>

@interface UIView (Badget)

/**
 * @brief - 設定 Badget Image
 * @warning - 使用前請先設定 badgetImage
 */
@property (nonatomic , strong) UIImage *badgetImage;

/**
 * @brief - 給定要貼付的 View ，讓 Badget 靠齊右上角
 */
-(void)createBadget;

/**
 * @brief - 設定 Badget 的位置
 */
-(void)setBadgetPosition:(CGPoint)tempPoint;

/**
 * @brief - 是否需要「增加 Badget 數量」時的動畫效果？
 */
-(void)setBadgetAnimation:(BOOL)isNeedAnimation;

/**
 * @brief - 設定 badget 數量
 */
-(void)setBadgetNumber:(NSUInteger)tempBadgetNumber;

/**
 * @brief - 設定 badget 數量（沒有動畫）
 */
-(void)setBadgetNumberWithoutAnimation:(NSUInteger)tempBadgetNumber;

/**
 * @brief - 取得 Badget 數量( NSUInteger ) 
 */
-(NSUInteger)getBadgetNumber;

/**
 * @brief - 清除 Badget 相關設定
 */
-(void)cleanBadget;

/**
 * @brief - 設定某個 badget 顯示狀態（如果有的話）
 */
-(void)setShowBadget:(BOOL)isShow;

@end
