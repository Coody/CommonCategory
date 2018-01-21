//
//  ModelManager.h
//  VWorld
//
//  Created by Coody on 2017/10/22.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelProtocol <NSObject>
@required
-(void)clearModel;
@end

@interface ModelManager : NSObject

+(instancetype)sharedInstance;

/**
 * @brief Get Model
 * @sa    ModelKey.h
 */
-(id <ModelProtocol> )getModelWithKey:(NSString *)modelKey;

/**
 * @brief 設定 Model
 * @details 可覆蓋前一個，但是會給 Warning
 */
-(BOOL)setModelWithKey:(NSString *)modelKey
             withModel:(id <ModelProtocol> )Model;

/**
 * @brief 清除所有 Model 內的資料（但是不會把存在的實體 nil 掉）
 */
-(void)clearModels;

@end
