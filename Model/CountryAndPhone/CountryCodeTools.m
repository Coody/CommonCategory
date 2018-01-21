//
//  CountryCodeTools.m
//
//  Created by RosaB on 2017/10/25.
//  Copyright (c) 2017年 RosaB. All rights reserved.
//

#import "CountryCodeTools.h"

// 多國語系
#define D_CountryCode_Taiwan @"台灣(Taiwan)886"
#define D_CountryCode_HongKong @"香港(Hong Kong)852"
#define D_CountryCode_Macao @"澳門(Macao)853"
#define D_CountryCode_Malaysia @"馬來西亞(Malaysia)60"
#define D_CountryCode_Singapore @"新加坡(Singapore)65"
#define D_CountryCode_China @"中國(China)86"
#define D_CountryCode_Thailand @"泰國(Thailand)66"
#define D_CountryCode_Vietnam @"越南(Vietnam)84"
#define D_CountryCode_Cambodia @"柬埔寨(Cambodia)855"

NSUInteger const K_DEFAULT_CONUNTRY_CODE_KEY = EnumCountryCode_Taiwan;


@interface CountryCodeTools()
@property (nonatomic , strong) NSString *phoneRegularString;
@property (nonatomic , strong) NSString *zeorHeadPhoneRegularString;
@end

@implementation CountryCodeTools

-(id)init{
    self = [super init];
    if ( self ) {
        _countryCodeDictionary = [self getCountryCodeDictionary];
        _recentCountryCodeKey  = [self getRecentCountryCodeKey];
    }
    return self;
}

-(NSDictionary *)getCountryCodeDictionary{
    if ( _countryCodeDictionary == nil ) {
        _countryCodeDictionary = @{[self getCountryCodeStringFromEnum:EnumCountryCode_Taiwan]    :D_CountryCode_Taiwan,
                                   [self getCountryCodeStringFromEnum:EnumCountryCode_HongKong]  :D_CountryCode_HongKong,
//                                   [self getCountryCodeStringFromEnum:EnumCountryCode_Macao]     :D_CountryCode_Macao,
//                                   [self getCountryCodeStringFromEnum:EnumCountryCode_Malaysia]  :D_CountryCode_Malaysia,
//                                   [self getCountryCodeStringFromEnum:EnumCountryCode_Singapore] :D_CountryCode_Singapore,
                                   [self getCountryCodeStringFromEnum:EnumCountryCode_China]     :D_CountryCode_China,
//                                   [self getCountryCodeStringFromEnum:EnumCountryCode_Thailand]  :D_CountryCode_Thailand
//                                   [self getCountryCodeStringFromEnum:EnumCountryCode_Vietnam]   :D_CountryCode_Vietnam,
//                                   [self getCountryCodeStringFromEnum:EnumCountryCode_Cambodia]  :D_CountryCode_Cambodia
                                   };
    }
    return _countryCodeDictionary;
}

-(NSString *)getRecentCountryCodeKey{
    if ( _recentCountryCodeKey == nil ) {
        // 目前預設的國碼
        _recentCountryCodeKey = [NSString stringWithFormat:@"%d" , (int)K_DEFAULT_CONUNTRY_CODE_KEY];
    }
    return _recentCountryCodeKey;
}

-(void)setRecentCountryCodeKey:(NSString *)recentCountryCodeKey{
    BOOL isLegal = NO;
    for ( NSString *key in self.countryCodeDictionary.allKeys ) {
        if ( [key isEqualToString:recentCountryCodeKey] ) {
            isLegal = YES;
            break;
        }
    }
    if ( isLegal ) {
        _recentCountryCodeKey = recentCountryCodeKey;
        [self getCountryCodeRegularString];
    }
    else{
        NSLog(@"\n\n********** %@:%@ ，您輸入的 Country Code 有誤！" , NSStringFromClass([self class]) , NSStringFromSelector(_cmd));
    }
}

-(BOOL)checkPhoneNumber:(NSString *)tempPhoneNumber{
    BOOL isLegal = NO;
    
    if ( _phoneRegularString == nil ) {
        [self getCountryCodeRegularString];
    }
    
    if ( tempPhoneNumber != nil ) {
        NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , _phoneRegularString];
        if ( [self isNeedDoubleCheckZeroHeadPhoneNumber] ) {
            NSPredicate *doubleCheckPhonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , _zeorHeadPhoneRegularString];
            isLegal = ([phonePredicate evaluateWithObject:tempPhoneNumber] || [doubleCheckPhonePredicate evaluateWithObject:tempPhoneNumber]);
        }
        else{
            isLegal = ([phonePredicate evaluateWithObject:tempPhoneNumber]);
        }
    }
    
    return isLegal;
}

/** 是否需要補 0 ？ */
-(BOOL)isNeedAddZero:(NSString *)tempPhoneNumber{
    BOOL isLegal = NO;
    if ( tempPhoneNumber != nil && [self isNeedDoubleCheckZeroHeadPhoneNumber] ) {
        NSPredicate *doubleCheckPhonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , _zeorHeadPhoneRegularString];
        isLegal = [doubleCheckPhonePredicate evaluateWithObject:tempPhoneNumber];
    }
    return isLegal;
}

-(NSString *)getCountryCodeStringFromEnum:(EnumCountryCode)tempEnumCountryCode{
    return ([NSString stringWithFormat:@"%d" , (int)tempEnumCountryCode]);
}

#pragma mark 私有方法
-(void)getCountryCodeRegularString{
    switch ( [self.recentCountryCodeKey integerValue] ) {
        case EnumCountryCode_Cambodia:
            // 柬埔寨： 01,068,069,070,076,077,08,09 開頭， 9 or 10 位數字
            _phoneRegularString = @"0[189][0-9]{7,8}|06[89][0-9]{6,7}|07[067][0-9]{6,7}";
            //      ：  1, 68, 69, 70, 76, 77, 8, 9 開頭， 8 or 9 位數字
            _zeorHeadPhoneRegularString = @"1[0-9]{7,8}|6[89][0-9]{6,7}|7[067][0-9]{6,7}|[89][0-9]{7,8}";
            break;
        case EnumCountryCode_China:
            // 中國： 13,14,15,18 開頭， 11 位數字
            _phoneRegularString = @"1[3458][0-9]{9}";
            break;
        case EnumCountryCode_HongKong:
            // 香港： 5,6,9 開頭， 8 位數字
            _phoneRegularString = @"[569][0-9]{7}";  // 5,6,8 開頭， 0~9 之間的數字組成 7 位數
            break;
        case EnumCountryCode_Macao:
            // 澳門： 6 開頭， 8 位數字
            _phoneRegularString = @"6[0-9]{7}";
            break;
        case EnumCountryCode_Malaysia:
            // 馬來西亞： 0 開頭， 11 位數字
            //（由於 PM/QA 所要求，改成 1 開頭 9~10 數字，0 開頭 10~11 位數字）（去掉 0 的情況也改成範圍）
            //        ： 1~9 數字開頭，10 位數字（注意，這裡要排除 1 ，因為如果加入 1 那麼在判斷要不要加 0 的地方，這裡就會因為這個判斷而變成 01...）
            _phoneRegularString = @"0[0-9]{9,10}";
            _zeorHeadPhoneRegularString = @"[123456789][0-9]{8,9}";
            break;
        case EnumCountryCode_Singapore:
            // 新加坡： 8,9 開頭， 8 位數字
            _phoneRegularString = @"[89][0-9]{7}";
            break;
        case EnumCountryCode_Taiwan:
            // 台灣：09 開頭，10位數字
            _phoneRegularString = @"09[0-9]{8}"; // 09 開頭， 0~9 之間的數字組成 8 位數
            //    ：9 開頭， 9 位數字
            _zeorHeadPhoneRegularString = @"9[0-9]{8}";
            break;
        case EnumCountryCode_Thailand:
            // 泰國：08,09 開頭， 10 位數字
            _phoneRegularString = @"0[89][0-9]{8}";
            //    ： 8, 9 開頭， 9 位數字
            _zeorHeadPhoneRegularString = @"[89][0-9]{8}";
            break;
        case EnumCountryCode_Vietnam:
            // 越南： 01 開頭 11 位數字；09開頭 10 位數字
            _phoneRegularString = @"01[0-9]{9}|09[0-9]{8}";
            //    ：  9,1 開頭, 9 開頭 9 位數字； 1 開頭 10 位數字
            _zeorHeadPhoneRegularString = @"9[0-9]{8}|1[0-9]{9}";
            break;
        default:
            NSLog(@"\n\n %@ : %@ 錯誤！！！目前的 Country Code (%ld) 有問題，請檢查！" , NSStringFromClass([self class]) , NSStringFromSelector(_cmd) , (long)[_recentCountryCodeKey integerValue]  );
            _phoneRegularString = @"09[0-9]{8}";    // 設定為台灣
            _zeorHeadPhoneRegularString = @"9[0-9]{8}";
            break;
    }
}

-(NSString *)cutPhoneNumber:(NSString *)tempOldPhoneNumber{
    NSString *cutPhoneNumber = tempOldPhoneNumber;
    switch ( [self.recentCountryCodeKey integerValue] ) {
        case EnumCountryCode_Cambodia:
        {
            // 柬埔寨： 01,068,069,070,076,077,08,09 開頭， 9 or 10 位數字
            if ( [tempOldPhoneNumber length] >= 10 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:10];
            }
        }
            break;
        case EnumCountryCode_China:
        {
            // 中國： 13,14,15,18 開頭， 11 位數字
            if ( [tempOldPhoneNumber length] >= 11 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:11];
            }
        }
            break;
        case EnumCountryCode_HongKong:
        {
            // 香港： 5,6,9 開頭， 8 位數字
            if ( [tempOldPhoneNumber length] >= 8 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:8];
            }
        }
            break;
        case EnumCountryCode_Macao:
        {
            // 澳門： 6 開頭， 8 位數字
            if ( [tempOldPhoneNumber length] >= 8 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:8];
            }
        }
            break;
        case EnumCountryCode_Malaysia:
        {
            // 馬來西亞： 0 開頭， 11 位數字
            if ( [tempOldPhoneNumber length] >= 1 ) {
                if ( [[tempOldPhoneNumber substringToIndex:1] isEqualToString:@"0"] &&
                    [tempOldPhoneNumber length] >= 11) {
                    cutPhoneNumber = [tempOldPhoneNumber substringToIndex:11];
                }
                else if( [tempOldPhoneNumber length] >= 10 ){
                    cutPhoneNumber = [tempOldPhoneNumber substringToIndex:10];
                }
            }
        }
            break;
        case EnumCountryCode_Singapore:
        {
            // 新加坡： 8,9 開頭， 8 位數字
            if ( [tempOldPhoneNumber length] >= 8 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:8];
            }
        }
            break;
        case EnumCountryCode_Taiwan:
        {
            // 台灣： 09 開頭，10位數字
            if ( [tempOldPhoneNumber length] >= 10 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:10];
            }
        }
            break;
        case EnumCountryCode_Thailand:
        {
            // 泰國： 08,09 開頭， 10 位數字
            if ( [tempOldPhoneNumber length] >= 10 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:10];
            }
        }
            break;
        case EnumCountryCode_Vietnam:
        {
            // 越南： 09,01 開頭，09開頭 10 位數字；01開頭 11 位數字
            if( [tempOldPhoneNumber length] >= 2 ){
                if ( [[tempOldPhoneNumber substringToIndex:2] isEqualToString:@"09"] &&
                     [tempOldPhoneNumber length] >= 10) {
                    cutPhoneNumber = [tempOldPhoneNumber substringToIndex:10];
                }
                else if( [tempOldPhoneNumber length] >= 11 ){
                    cutPhoneNumber = [tempOldPhoneNumber substringToIndex:11];
                }
            }
            
        }
            break;
        default:
        {
            NSLog(@"\n\n %@ : %@ 錯誤！！！目前的 Country Code (%ld) 有問題，請檢查！" , NSStringFromClass([self class]) , NSStringFromSelector(_cmd) , (long)[_recentCountryCodeKey integerValue]  );
            // 台灣： 09 開頭，10位數字 (設定為台灣) ，此為容錯。
            if ( [tempOldPhoneNumber length] >= 10 ) {
                cutPhoneNumber = [tempOldPhoneNumber substringToIndex:10];
            }
        }
            break;
    }
    return cutPhoneNumber;
}

-(BOOL)isNeedDoubleCheckZeroHeadPhoneNumber{
    NSUInteger checkCountryCode = [_recentCountryCodeKey intValue];
    return (checkCountryCode == EnumCountryCode_Taiwan ||
            checkCountryCode == EnumCountryCode_Cambodia ||
            checkCountryCode == EnumCountryCode_Thailand ||
            checkCountryCode == EnumCountryCode_Vietnam ||
            checkCountryCode == EnumCountryCode_Malaysia);
}

#pragma mark - SGT_Table_Policy
- (void) reset
{
    // TODO: implement
    _recentCountryCodeKey = [NSString stringWithFormat:@"%d" , (int)K_DEFAULT_CONUNTRY_CODE_KEY];
}

@end
