//
//  CountryCodeTools.h
//
//  Created by RosaB on 2017/10/25.
//  Copyright (c) 2017年 RosaB. All rights reserved.
//

typedef NS_ENUM(NSUInteger, EnumCountryCode){
    EnumCountryCode_Taiwan = 886,
    EnumCountryCode_HongKong = 852,
    EnumCountryCode_Macao = 853,
    EnumCountryCode_Malaysia = 60,
    EnumCountryCode_Singapore = 65,
    EnumCountryCode_China = 86,
    EnumCountryCode_Thailand = 66,
    EnumCountryCode_Vietnam = 84,
    EnumCountryCode_Cambodia = 855
};

/**
 * @brief   - 預設的國碼代號（目前設定為台灣）
 * @warning - 如果要更改預設國碼，請直接改這個值就好！
 */
extern NSUInteger const K_DEFAULT_CONUNTRY_CODE_KEY;

/**
 * @brief   - 電話國碼對應完整顯示字串
 * @details - Key : 電話國碼（如：台灣為 886 ）
 * @details - Value : 顯示在畫面上的字串（如：台灣（Taiwan）886 ）
 */
@interface CountryCodeTools : NSObject

/** 如果為 nil 會建立好字典並回傳 */
@property (nonatomic , strong) NSDictionary *countryCodeDictionary;

/** 
 * @brief   - 如果為 nil 會回傳預設國家 
 * @detail  - 取得目前的 country code 码（取得国码请用此 property）
 * @warning - 未來如果依預設語系不同，會以不同的國碼代號為預設，請在 MDTB 內寫邏輯，不要再外面自行寫！
 */
@property (nonatomic , strong) NSString *recentCountryCodeKey;

/**
 * @brief - 取得國碼字典（如果是 nil 會自動產生預設字典）
 */
-(NSDictionary *)getCountryCodeDictionary;

/** 電話是否合法？ */
-(BOOL)checkPhoneNumber:(NSString *)tempPhoneNumber;

/**
 * @brief - 
 */
-(NSString *)getCountryCodeStringFromEnum:(EnumCountryCode)tempEnumCountryCode;

/** 是否需要補 0 ？ */
-(BOOL)isNeedAddZero:(NSString *)tempPhoneNumber;

/** 將電話丟進來，會依照電話規則切除過長電話回傳 */
-(NSString *)cutPhoneNumber:(NSString *)tempOldPhoneNumber;

@end
