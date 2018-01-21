//
//  UITableViewCell+Bg.m
//  VWorld
//
//  Created by Chou Coody on 2018/1/21.
//  Copyright © 2018年 Coody. All rights reserved.
//

#import "UITableViewCell+Bg.h"

// for Tools
#import "App_Tools.h"

@implementation UITableViewCell (Bg)

-(void)setBg{
    UIImage *tempBg = [[App_Tools getImageWithString:@"" withImageName:@"cellBG"] resizableImageWithCapInsets:UIEdgeInsetsMake( 10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    UIImageView *tempBgImageView = [[UIImageView alloc] initWithFrame:self.frame];
    [tempBgImageView setImage:tempBg];
    [self addSubview:tempBgImageView];
}

@end
