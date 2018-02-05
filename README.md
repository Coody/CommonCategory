![License](https://img.shields.io/dub/l/vibe-d.svg)

# Objective-C 常用的 common category

* EncryptDecrypt
  
  1. AESTools : AES 加解密，有使用到：
  
    * [MIHCrypto](https://github.com/hohl/MIHCrypto)
    * NSString+Base64.h
    * NSData+DataToHexString.h
    * NSData+NSString.h
    * NSDictionary+Json.h
    
  2. RsaTools : RSA 加解密
  
    * [MIHCrypto](https://github.com/hohl/MIHCrypto)
    * [SSCrypto](https://github.com/edlitmus/SSCrypto)
    * NSData+NSString.h
    * NSString+Base64.h
    * NSString+HexStringToData.h
  
* Model

  1. ModelManager （管理 Model 的 sharedInstance）
  
    * CountryCodeTools （電話號碼與國碼）

* NSArray

  1. NSArray+RevertArray.h （翻轉陣列）
  
* NSData

  1. NSData+NSString.h （NSData 轉 utf8 NSString）
  2. NSData+DataToHexString.h （NSData 轉 Hex NSString）

* NSDate（日期功能）

  1. NSDate+Common.h （日期相關功能（包含 Timestamp ））
  
* NSDictionary

  1. NSDictionary+Json.h （字典轉 Json string）
  
* NSString

  1. NSString+Base64.h
  2. NSString+Common.h
  3. NSString+Emoji.h
  4. NSString+HexStringToData.h
  5. NSString+JWT.h
  6. NSString+Json.h
  7. NSString+MD5.h
  8. NSString+Number.h
  
* UIView

  1. UITableViewCell+Bg.h
  2. UIView+BackgroundView.h
  3. UIViewController+Alert.h
  4. UIViewController+Keyboard.h
  5. UIViewController+NavigationBar.h
  6. UIViewController+PopVC.h
  7. UIViewController+PushVC.h

# 聲明
- 此 License 屬於 MIT ，請自由取用。
