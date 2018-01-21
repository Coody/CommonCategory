//
//  UIViewController+NavigationBar.h
//  VWorld
//
//  Created by Chou Coody on 2018/1/20.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBar)
-(UIView *)getNavigationView;
-(UIView *)getBottomView;
-(UILabel *)getTitleLabel;
-(UIButton *)getBackBtn;

-(void)addNavigationView;
-(void)addBottomView;
-(void)setNavigationTitle:(NSString *)title;

// Buttons
-(void)addBackBtn;
-(void)addRightBtn:(UIButton *)rightButton;
@end
