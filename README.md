![License](https://img.shields.io/dub/l/vibe-d.svg)

# Objective-C 常用的 common category

# EncryptDecrypt
  
* AESTools : AES 加解密，有使用到：
  
  * [MIHCrypto](https://github.com/hohl/MIHCrypto)
  * NSString+Base64.h
  * NSData+DataToHexString.h
  * NSData+NSString.h
  * NSDictionary+Json.h
    
    
* RsaTools : RSA 加解密
  
  * [MIHCrypto](https://github.com/hohl/MIHCrypto)
  * [SSCrypto](https://github.com/edlitmus/SSCrypto)
  * NSData+NSString.h
  * NSString+Base64.h
  * NSString+HexStringToData.h
  
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
* UIView+Keyboard.h  <--- 畫面會依照你的 View 來做鍵盤監聽，鍵盤出現則會讓他可以滾動，鍵盤縮回則會回復原狀（請在此 view 有 superVeiw 後做）
                          UIView will active keyboard height observer , and change UIView's height and add UIScrollView to             scroll.(Please call the initial function after UIView has a superview. )
* UIViewController+Alert.h
* UIViewController+Keyboard.h  <--- 點擊畫面會自動縮回鍵盤（如果發現 TableViewCell 點擊不靈敏，請設定 isNeedIgnore = YES )
* UIViewController+NavigationBar.h
* UIViewController+PopVC.h
* UIViewController+PushVC.h
* UITextField+ClearButton.h
* UIViewController+MiddleFrame.h
* UIView+Badget.h <--- Any UIView can add Red Badget !
* AppToast.h <--- Toast , can show forever toast and insert any short time toast when showing forever toast.
* UIView+EmptyLabel <--- Can add Empty Label if no data in TableView or CollectionView easily.

# 聲明
- 此 License 屬於 MIT ，請自由取用。
- MIT.
