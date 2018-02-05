![License](https://img.shields.io/dub/l/vibe-d.svg)

# Objective-C 常用的 common category

# EncryptDecrypt
  
  * AESTools : AES 加解密，有使用到：
  
    1. [MIHCrypto](https://github.com/hohl/MIHCrypto)
    2. NSString+Base64.h
    3. NSData+DataToHexString.h
    4. NSData+NSString.h
    5. NSDictionary+Json.h
    
    
  * RsaTools : RSA 加解密
  
    1. [MIHCrypto](https://github.com/hohl/MIHCrypto)
    2. [SSCrypto](https://github.com/edlitmus/SSCrypto)
    3. NSData+NSString.h
    4. NSString+Base64.h
    5. NSString+HexStringToData.h
  
# Model

  * ModelManager （管理 Model 的 sharedInstance）
  
    * CountryCodeTools （電話號碼與國碼）

# NSArray

  * NSArray+RevertArray.h （翻轉陣列）
  
# NSData

  * NSData+NSString.h （NSData 轉 utf8 NSString）
  * NSData+DataToHexString.h （NSData 轉 Hex NSString）

# NSDate（日期功能）

  * NSDate+Common.h （日期相關功能（包含 Timestamp ））
  
# NSDictionary

  * NSDictionary+Json.h （字典轉 Json string）
  
# NSString

  * NSString+Base64.h
  * NSString+Common.h
  * NSString+Emoji.h
  * NSString+HexStringToData.h
  * NSString+JWT.h
  * NSString+Json.h
  * NSString+MD5.h
  * NSString+Number.h
  
# UIView

  * UITableViewCell+Bg.h
  * UIView+BackgroundView.h
  * UIViewController+Alert.h
  * UIViewController+Keyboard.h
  * UIViewController+NavigationBar.h
  * UIViewController+PopVC.h
  * UIViewController+PushVC.h

# 聲明
- 此 License 屬於 MIT ，請自由取用。
