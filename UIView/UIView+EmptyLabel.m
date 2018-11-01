//
//  UIView+EmptyLabel.m
//  TTQRCODE
//
//  Created by coodychou on 2018/10/23.
//  Copyright © 2018 coody. All rights reserved.
//

#import "UIView+EmptyLabel.h"

#include <objc/runtime.h>

#pragma makr - Dynamic Property
////////////////////////////////
#define Dynamic_Property( ObjectType , property , setProperty )\
Dynamic_Property_Getter( ObjectType , property)\
Dynamic_Property_Setter( ObjectType , property , setProperty , OBJC_ASSOCIATION_RETAIN_NONATOMIC )
//////// Getter ////////
#define Dynamic_Property_Getter( ObjectType , property )\
-(ObjectType)property\
{\
return objc_getAssociatedObject( self, @selector(property) );\
}
//////// Setter ////////
#define Dynamic_Property_Setter( ObjectType , property , setProperty , associationFlag) \
-(void)setProperty(ObjectType)property\
{\
objc_setAssociatedObject(self, @selector(property), property, associationFlag);\
}
////////////////////////////////

CGFloat const kEmptyLabel_DefaultTopMargin = 20.0f;

@implementation UIView (EmptyLabel)
Dynamic_Property(UILabel *, emptyLabel, setEmptyLabel:)
Dynamic_Property(UIFont *, emptyFont, setEmptyFont:)
Dynamic_Property(NSNumber *, emptyLabelTopMargin, setEmptyLabelTopMargin:)

-(CGFloat)emptyTopMargin{
    return [self.emptyLabelTopMargin floatValue];
}

-(void)setEmptyTopMargin:(CGFloat)emptyTopMargin{
    self.emptyLabelTopMargin = @(emptyTopMargin);
}

-(void)showEmptyLabel:(nonnull NSString *)context{
    self.emptyLabelTopMargin = self.emptyLabelTopMargin ? self.emptyLabelTopMargin : @(kEmptyLabel_DefaultTopMargin);
    self.emptyFont = self.emptyFont ? self.emptyFont : D_EmptyLabel_DefaultFont;
    if( !self.emptyLabel ){
        CGSize size = [UIView getTextSizeWithWidth:self.frame.size.width withText:context withFont:self.emptyFont];
        self.emptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 
                                                                    [self.emptyLabelTopMargin floatValue],
                                                                    [UIScreen mainScreen].bounds.size.width, size.height)];
        [self.emptyLabel setTextColor:[UIColor blackColor]];
        [self.emptyLabel setTextAlignment:(NSTextAlignmentCenter)];
        self.emptyLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | 
        UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | 
        UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
    self.emptyLabel.text = context;
    [self.emptyLabel setHidden:NO];
    [self addSubview:self.emptyLabel];
}

-(void)hideEmptyLabel{
    [self.emptyLabel setHidden:YES];
}

-(void)resize{
    // TODO:
}

#pragma mark - Private
// 求一般 NSString 的 frame
+(CGSize)getTextSizeWithWidth:(float)tempWidth 
                     withText:(NSString *)tempText 
                     withFont:(UIFont *)tempFont
{
    return ([tempText boundingRectWithSize:CGSizeMake(tempWidth, CGFLOAT_MAX) 
                                   options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                attributes:@{NSFontAttributeName:tempFont} 
                                   context:nil].size);
}

@end
