//
//  UIView+EmptyLabel.h
//  TTQRCODE
//
//  Created by coodychou on 2018/10/23.
//  Copyright © 2018 coody. All rights reserved.
//

#import <UIKit/UIKit.h>

#define D_EmptyLabel_DefaultFont [UIFont boldSystemFontOfSize:18.0f]

extern CGFloat const kEmptyLabel_DefaultTopMargin;

@interface UIView (EmptyLabel)
@property (nonatomic , strong) UILabel *emptyLabel;
@property (nonatomic , assign) CGFloat emptyTopMargin;
@property (nonatomic , strong) UIFont *emptyFont;
-(void)showEmptyLabel:(nonnull NSString *)context;
-(void)hideEmptyLabel;
-(void)resize;

@end
