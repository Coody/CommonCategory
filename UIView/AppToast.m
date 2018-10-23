//
//  AppToast.m
//  TTQRCODE
//
//  Created by coodychou on 2018/9/19.
//  Copyright © 2018年 coody. All rights reserved.
//

#import "AppToast.h"

// Private
static const NSTimeInterval kAppToastFadeInAndOutAnimation = 0.2;

// Public
CGFloat const kAppToastDefault_Duration = 3.0f;
EnumAppToastPosition const kAppToastDefault_Position = EnumAppToastPosition_Bottom;
CGFloat const kAppToastDefault_Alpha = 0.7f;
CGFloat const kAppToastDefault_CornerRadius = 5.0f;
CGFloat const kAppToastDefault_FontSize = 16.0f;

#pragma mark - AppToastManager
@interface AppToastManager : NSObject
@property (nonatomic , strong) UIWindow *keyWindow;
@property (nonatomic , strong) AppToast *recentToast;
@property (nonatomic , strong) AppToast *foreverToast;
+(instancetype)sharedManager;
@end

@implementation AppToastManager

+(instancetype)sharedManager{
    static AppToastManager *instance = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        instance = [[AppToastManager alloc] init];
    });
    return instance;
}

-(instancetype)init{
    self = [super init];
    if( self ){
        _keyWindow = [UIApplication sharedApplication].keyWindow;
        _recentToast = nil;
        _foreverToast = nil;
    }
    return self;
}

@end

#pragma mark - AppToast
@interface AppToast()
@property (nonatomic , weak) AppToastManager *manager;
@property (nonatomic , assign) CGPoint customPosition;
@property (nonatomic , assign) CGFloat showAnimationDuration;
@property (nonatomic , assign) EnumAppToastPosition showPosition;
@property (nonatomic , assign) CGFloat showAlpha;
@property (nonatomic , assign) CGFloat showCornerRadius;
@property (nonatomic , assign) CGFloat showFontSize;
@property (nonatomic , strong) UILabel *textLabel;
@property (nonatomic , strong) UIButton *toastBtn;
@property (nonatomic , assign) BOOL isForeverToast;
@property (nonatomic , assign) BOOL isShow;
@end

@implementation AppToast

#pragma mark - Public Methods
+(AppToast *)getShortToast{
    return [AppToastManager sharedManager].recentToast;
}

+(AppToast *)getForeverToast{
    return [AppToastManager sharedManager].foreverToast;
}

-(instancetype)initWithText:(NSString *)tempText withIsForever:(BOOL)isForever{
    if( isForever && [AppToastManager sharedManager].foreverToast ){
        AppToast *foreverToast = [AppToastManager sharedManager].foreverToast;
        if( ![tempText isEqualToString:foreverToast.textLabel.text] ){
            [foreverToast setText:tempText];
        }
        return foreverToast;
    }
    else{
        self = [super init];
        if( self ){
            _manager = [AppToastManager sharedManager];
            [self setDefaultSetting];
            [self initialUI:tempText];
        }
        return self;
    }
}

-(void)show{
    if( _isShow == NO ){
        BOOL isNeedDelay = NO;
        if( [AppToastManager sharedManager].recentToast &&
            [AppToastManager sharedManager].recentToast.isShow == YES){
            [[AppToastManager sharedManager].recentToast hide];
            isNeedDelay = YES;
        }
        if( [AppToastManager sharedManager].foreverToast &&
            [AppToastManager sharedManager].foreverToast.isShow == YES ){
            [[AppToastManager sharedManager].foreverToast hideForeverTemplate];
            isNeedDelay = YES;
        }
        
        if( isNeedDelay ){
            [self performSelector:@selector(showToast) withObject:self afterDelay:kAppToastFadeInAndOutAnimation];
        }
        else{
            [self showToast];
        }
        
    }
}

-(void)showToast{
    
    if( self.isForeverToast ){
        [AppToastManager sharedManager].foreverToast = self;
    }
    else{
        [AppToastManager sharedManager].recentToast = self;
    }
    
    __weak __typeof(self)weakSelf = self;
    [[AppToastManager sharedManager].keyWindow addSubview:self];
    [UIView animateWithDuration:kAppToastFadeInAndOutAnimation animations:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf setAlpha:1.0f];
    }completion:^(BOOL finished) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if( !strongSelf.isForeverToast ){
            [strongSelf performSelector:@selector(hide) withObject:nil afterDelay:(strongSelf.showAnimationDuration)];
        }
        strongSelf.isShow = YES;
    }];
}

-(void)showForever{
    self.isForeverToast = YES;
    [self setHidden:NO];
    [self show];
}

-(void)setShowDuration:(NSUInteger)duration{
    _showAnimationDuration = duration;
}

-(void)setShowPosition:(EnumAppToastPosition)toastPosition{
    _showPosition = toastPosition;
    self.center = [self exchangePosition:_showPosition];
}

-(void)setShowAlpha:(CGFloat)alpha{
    _showAlpha = alpha;
}

-(void)setShowCornerRadius:(CGFloat)cornerRadius{
    _showCornerRadius = cornerRadius;
}

-(void)setShowFontSize:(CGFloat)fontSize{
    _showFontSize = fontSize;
}

-(void)setText:(NSString *)text{
    CGSize size = [AppToast getTextSizeWithWidth:CGRectGetWidth(_manager.keyWindow.frame)
                                        withText:text
                                        withFont:[UIFont systemFontOfSize:self.showFontSize]];
    self.textLabel.text = text;
    [self.textLabel setFrame:CGRectMake(0, 0, size.width, size.height)];
    [self setFrame:CGRectMake(0, 0, size.width + 15, size.height + 15)];
    [self.toastBtn setFrame:self.frame];
    self.center = [self exchangePosition:self.showPosition];
}

#pragma mark - Private Methods
-(void)initialUI:(NSString *)tempText{
    UIFont *tempFont = [UIFont systemFontOfSize:self.showFontSize];
    CGSize size = [AppToast getTextSizeWithWidth:CGRectGetWidth(_manager.keyWindow.frame)
                                        withText:tempText
                                        withFont:tempFont];
    [self setFrame:CGRectMake(0, 0, size.width + 15, size.height + 15)];
    _textLabel = [[UILabel alloc] init];
    
    _textLabel = [[UILabel alloc] initWithFrame:self.frame];
    [_textLabel setTextAlignment:NSTextAlignmentCenter];
    [_textLabel setText:tempText];
    [_textLabel setFont:tempFont];
    [_textLabel setTextColor:[UIColor whiteColor]];
    [_textLabel setNumberOfLines:0];
    _textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    _textLabel.shadowColor = [UIColor darkGrayColor];
    _textLabel.shadowOffset = CGSizeMake(1, 1);
    _toastBtn = [[UIButton alloc] initWithFrame:self.frame];
    _toastBtn.autoresizingMask = UIViewAutoresizingNone;
    [_toastBtn setTitle:@"" forState:UIControlStateNormal];
    [_toastBtn.titleLabel setFont:tempFont];
    [_toastBtn setBackgroundColor:[UIColor grayColor]];
    
    _toastBtn.layer.cornerRadius = self.showCornerRadius;
    [_toastBtn setAlpha:self.showAlpha];
    [_toastBtn addSubview:_textLabel];
    [self addSubview:_toastBtn];
    self.center = [self exchangePosition:self.showPosition];
    [self setAlpha:0.0f];
    _textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                  UIViewAutoresizingFlexibleLeftMargin |
                                  UIViewAutoresizingFlexibleRightMargin |
                                  UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleBottomMargin;
    _toastBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                 UIViewAutoresizingFlexibleLeftMargin |
                                 UIViewAutoresizingFlexibleRightMargin |
                                 UIViewAutoresizingFlexibleTopMargin |
                                 UIViewAutoresizingFlexibleBottomMargin;
}

-(void)setDefaultSetting{
    _isShow = NO;
    self.showAnimationDuration = kAppToastDefault_Duration;
    self.showPosition = kAppToastDefault_Position;
    self.showAlpha = kAppToastDefault_Alpha;
    self.showCornerRadius = kAppToastDefault_CornerRadius;
    self.showFontSize = kAppToastDefault_FontSize;
    _isForeverToast = NO;
}

-(void)hide{
    if( _isShow == YES ){
        __weak __typeof(self) weakSelf = self;
        [UIView animateWithDuration:kAppToastFadeInAndOutAnimation animations:^{
            __strong __typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf setAlpha:0.0f];
        } completion:^(BOOL finished) {
            __strong __typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf removeToast];
            NSLog(@" [AppToastManager sharedManager].foreverToast.isShow = %d" , [AppToastManager sharedManager].foreverToast.isShow );
            if( [AppToastManager sharedManager].foreverToast &&
                [AppToastManager sharedManager].foreverToast.isShow == NO ){
                [[AppToastManager sharedManager].foreverToast showForever];
            }
            strongSelf.isShow = NO;
        }];
    }
}

-(void)hideForeverTemplate{
    if( _isShow == YES ){
        _isShow = NO;
        __weak __typeof(self)weakSelf = self;
        [UIView animateWithDuration:kAppToastFadeInAndOutAnimation animations:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf setAlpha:0.0f];
        } completion:^(BOOL finished) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf setHidden:YES];
        }];
    }
}

-(void)removeToast
{
    if( self.isForeverToast ){
        [AppToastManager sharedManager].foreverToast = nil;
    }
    else{
        [AppToastManager sharedManager].recentToast = nil;
    }
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
    [self removeFromSuperview];
}

-(void)setCustomPosition:(CGPoint)customPosition{
    _customPosition = customPosition;
    self.frame = CGRectMake(customPosition.x, customPosition.y,
                            self.frame.size.width, self.frame.size.height);
}

-(CGPoint)exchangePosition:(EnumAppToastPosition)position{
    CGPoint tempPosition = CGPointMake(0, 0);
    switch ( position ) {
        case EnumAppToastPosition_Top:
            tempPosition = CGPointMake([AppToastManager sharedManager].keyWindow.frame.size.width*0.5,
                                       [AppToastManager sharedManager].keyWindow.frame.size.height*0.25);
            break;
        case EnumAppToastPosition_Middle:
            tempPosition = CGPointMake([AppToastManager sharedManager].keyWindow.frame.size.width*0.5,
                                       [AppToastManager sharedManager].keyWindow.frame.size.height*0.5);
            break;
        case EnumAppToastPosition_Custom:
            tempPosition = CGPointMake(self.customPosition.x,
                                       self.customPosition.y);
            break;
        case EnumAppToastPosition_Bottom:
            tempPosition = CGPointMake([AppToastManager sharedManager].keyWindow.frame.size.width*0.5,
                                       [AppToastManager sharedManager].keyWindow.frame.size.height*0.87);
            break;
        default:
            break;
    }
    return tempPosition;
}

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
