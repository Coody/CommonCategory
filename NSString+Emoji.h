//
//  NSString+Emoji.h
//  VWorld
//
//  Created by Coody on 2017/12/19.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Emoji)

/** 是否有包含中文、英文、以及數字組合以外的字串 */
+(BOOL)checknHasEmojiString:(NSString *)checkString;

/** 輸入轉成是否是中文字 */
+(BOOL)checkIsChinese:(int)checkChar;

-(BOOL)isIncludingEmoji;

-(instancetype)removedEmojiString;

@end
