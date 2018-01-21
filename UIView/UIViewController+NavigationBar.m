//
//  UIViewController+NavigationBar.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/20.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "UIViewController+PopVC.h"

// for Tools
#import "ViewTools.h"
#import "ContainerView.h"
#import "App_Tools.h"
#import "Constants.h"
#import <objc/runtime.h>

@implementation UIViewController (NavigationBar)
CATEGORY_PROPERTY_GET_SET(UIView*, navigationView, setNavigationView:)
CATEGORY_PROPERTY_GET_SET(UIView*, bottomView, setBottomView:)
CATEGORY_PROPERTY_GET_SET(UILabel*, titleLabel, setTitleLabel:)
CATEGORY_PROPERTY_GET_SET(UIButton*, backBtn, setBackBtn:)

-(UIView *)getNavigationView{
    return self.navigationView;
}

-(UIView *)getBottomView{
    return self.bottomView;
}

-(UILabel *)getTitleLabel{
    return self.titleLabel;
}

-(UIButton *)getBackBtn{
    return self.backBtn;
}

-(void)addNavigationView{
    if( self.navigationView == nil ){
        UIImage *image = [App_Tools getImageWithString:@"" withImageName:@"navigationBg"];
        self.navigationView = [[UIView alloc] initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, image.size.height * 1.3)];
        UIImageView *bg = [[UIImageView alloc] initWithFrame:self.navigationView.frame];
        [bg setImage:image];
        [self.navigationView addSubview:bg];
        [self.view addSubview:self.navigationView];
        [self.navigationView setBackgroundColor:[UIColor clearColor]];
    }
}

-(void)addBottomView{
    if( self.bottomView == nil ){
        self.bottomView = [[UIView alloc] 
                           initWithFrame:CGRectMake(0,
                                                    self.navigationView.frame.origin.y + self.navigationView.frame.size.height,
                                                    self.navigationView.frame.size.width,
                                                    [UIScreen mainScreen].bounds.size.height - self.navigationView.frame.origin.y - self.navigationView.frame.size.height)];
        [self.view addSubview:self.bottomView];
        [self.bottomView setBackgroundColor:[UIColor clearColor]];
    }
}

-(void)setNavigationTitle:(NSString *)title{
    if( self.titleLabel == nil ){
        self.titleLabel = [[UILabel alloc] initWithFrame:self.navigationView.frame];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setTextAlignment:(NSTextAlignmentCenter)];
        [self.titleLabel setFrame:CGRectMake(0, 6.0, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height)];
        [self.navigationView addSubview:self.titleLabel];
        [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    }
    self.titleLabel.text = title;
}

-(void)addBackBtn{
    if( self.backBtn == nil ){
        UIImage *backImage = [App_Tools getImageWithString:@"" withImageName:@"back"];
        self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(3,
                                                                  [App_Tools statusBarHeight],
                                                                  backImage.size.width*2,
                                                                  backImage.size.height)];
        UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
        [backImageView setFrame:CGRectMake((self.backBtn.frame.size.width - backImage.size.width)*0.5,
                                           (self.backBtn.frame.size.height - backImage.size.height)*0.5,
                                           backImageView.frame.size.width,
                                           backImageView.frame.size.height)];
        [self.backBtn addSubview:backImageView];
        [self.navigationView addSubview:self.backBtn];
    }
    [self.backBtn addTarget:self action:@selector(pressedBack) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)pressedBack{
    [self popVC];
}

-(void)addRightBtn:(UIButton *)rightButton{
    [rightButton setFrame:CGRectMake(self.navigationView.frame.size.width - rightButton.frame.size.width - 4,
                                     self.navigationView.frame.size.height - rightButton.frame.size.height - 6,
                                     rightButton.frame.size.width, rightButton.frame.size.height)];
    [self.view addSubview:rightButton];
}

@end
