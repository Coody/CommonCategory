//
//  UITextField+FormatNumber.m
//  TTQRCODE
//
//  Created by coodychou on 2018/9/18.
//  Copyright © 2018年 coody. All rights reserved.
//

#import "UITextField+FormatNumber.h"

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

@implementation UITextField (FormatNumber)
Dynamic_Property(NSNumber*, isNeed, setIsNeed:)

-(void)isNeedFormatNumber:(BOOL)isNeed{
    self.isNeed = @(isNeed);
    if( self.isNeed ){
        self.delegate = self;
    }
    else{
        self.delegate = nil;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if( [self.isNeed boolValue] ){
        if (([string isEqualToString:@"0"] || [string isEqualToString:@""]) && [textField.text rangeOfString:@"."].location < range.location) {
            return YES;
        }
        
        // First check whether the replacement string's numeric...
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        bool isNumeric = [string isEqualToString:filtered];
        
        // Then if the replacement string's numeric, or if it's
        // a backspace, or if it's a decimal point and the text
        // field doesn't already contain a decimal point,
        // reformat the new complete number using
        // NSNumberFormatterDecimalStyle
        if (isNumeric ||
            [string isEqualToString:@""] ||
            ([string isEqualToString:@"."] &&
             [textField.text rangeOfString:@"."].location == NSNotFound)) {
                
                // Create the decimal style formatter
                NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
                [formatter setMaximumFractionDigits:10];
                
                // Combine the new text with the old; then remove any
                // commas from the textField before formatting
                NSString *combinedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
                NSString *numberWithoutCommas = [combinedText stringByReplacingOccurrencesOfString:@"," withString:@""];
                NSNumber *number = [formatter numberFromString:numberWithoutCommas];
                
                NSString *formattedString = [formatter stringFromNumber:number];
                
                // If the last entry was a decimal or a zero after a decimal,
                // re-add it here because the formatter will naturally remove
                // it.
                if ([string isEqualToString:@"."] &&
                    range.location == textField.text.length) {
                    formattedString = [formattedString stringByAppendingString:@"."];
                }
                
                textField.text = formattedString;
                
            }
        
        // Return no, because either the replacement string is not
        // valid or it is and the textfield has already been updated
        // accordingly
        return NO;
    }
    else{
        return YES;
    }
}

@end
