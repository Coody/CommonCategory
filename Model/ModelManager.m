//
//  ModelManager.m
//  VWorld
//
//  Created by Coody on 2017/10/22.
//  Copyright © 2017年 Coody. All rights reserved.
//

#import "ModelManager.h"

@interface ModelManager()
@property (nonatomic , strong) NSMutableDictionary *modelDic;
@end

@implementation ModelManager

+(instancetype)sharedInstance{
    static ModelManager *instance = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once( &onceToken , ^{
        instance = [[ModelManager alloc] init];
    });
    return instance;
}

-(instancetype)init{
    self = [super init];
    if( self ){
        _modelDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(id <ModelProtocol> )getModelWithKey:(NSString *)modelKey{
    id model = nil;
    if( modelKey == nil || [modelKey isEqualToString:@""] ){
        NSLog(@"Model Key is EMPTY !!");
    }
    else{
        model = [self.modelDic objectForKey:modelKey];
    }
    return model;
}

-(BOOL)setModelWithKey:(NSString *)modelKey
             withModel:(id <ModelProtocol> )Model{
    BOOL isOK = NO;
    if( modelKey == nil || [modelKey isEqualToString:@""] ){
        NSLog(@"Model Key is EMPTY !!");
    }
    else{
        id model = [self.modelDic objectForKey:modelKey];
        if( model != nil){
            NSLog(@"Model is set before!");
        }
        [self.modelDic setValue:Model forKey:modelKey];
        isOK = YES;
    }
    return isOK;
}

-(void)clearModels{
    for( NSString *key in self.modelDic.allKeys ){
        id <ModelProtocol> model = [self.modelDic objectForKey:key];
        [model clearModel];
    }
}

@end
