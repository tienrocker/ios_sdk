//
//  Logger.h
//  VGPSDK-Code
//
//  Created by  Tien Tran on 2/25/20.
//  Copyright © 2020 Insert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FirebaseAnalytics/FIRAnalytics.h>
#import <FirebaseAnalytics/FIREventNames.h>
#import <FirebaseAnalytics/FIRParameterNames.h>
#import <AppsFlyerLib/AppsFlyerTracker.h>

NS_ASSUME_NONNULL_BEGIN

#define LoggerLog(x, ...) NSLog(@"VGP-EVENTLOG %s %d: " x, __FUNCTION__, __LINE__, ##__VA_ARGS__)
typedef enum VGPLoginType : NSUInteger{
    kLoginTypeNormal,
    kLoginTypeQuickplay,
    kLoginTypeFacebook,
    kLoginTypeApple
} VGPLoginType;
typedef enum VGPRegisterType : NSUInteger{
    kRegisterTypeNormal,
    kRegisterTypeQuickplay,
    kRegisterTypeFacebook,
    kRegisterTypeApple
} VGPRegisterType;

@interface VGPLogger : NSObject

#pragma mark Init

@property NSString *game_code;
@property NSString *game_version;
@property long openTimeMillis;
@property VGPLoginType loginType;
@property NSString *loginProvider;

/*!
 @abstract Store class instance.
*/
+ (VGPLogger *)sharedInstance;

/*!
 @abstract Set config.
*/
+ (void)setGameVersion:(NSString*)code;

/*!
 @abstract Set config.
*/
+ (void)setGameCode:(NSString*)code;

/*!
 @abstract Get refault parameter.
*/
- (NSDictionary *)defaultParams;

/*!
 @abstract This method get current time in milliseconds.
*/
- (long)currentTimeMillis;

/*!
 @abstract This method log default events.
*/
- (void)log:(NSString *)event_name;

/*!
 @abstract This method log event with parameters.
*/
- (void)log:(NSString *)event_name parameters:(NSDictionary *)parameters;

#pragma mark Resource Download

/*!
 @abstract This method can be used when init download resource pack.
 @TODO filter fisrt time and another
*/
- (void)resourceStartDownload;

/*!
 @abstract This method can be used when downloading resource pack.
 @TODO filter fisrt time and another
*/
- (void)resourceProcessDownload:(int)percent;

/*!
 @abstract This method can be used when download success resource pack.
 @TODO filter fisrt time and another
*/
- (void)resourceDownloadSuccess;

/*!
 @abstract This method can be used when download failed resource pack.
 @TODO filter fisrt time and another
*/
- (void)resourceDownloadError;

#pragma mark Resource Unpack

/*!
 @abstract This method can be used when start unpack resource pack.
 @TODO filter fisrt time and another
*/
- (void)resourceStartUnpack;

/*!
 @abstract This method can be used when unpack success resource pack.
 @TODO filter fisrt time and another
*/
- (void)resourceUnpackSuccess;

/*!
 @abstract This method can be used when unpack failed resource pack.
 @TODO filter fisrt time and another
*/
- (void)resourceUnpackError;

#pragma mark Login

/*!
 @abstract This method can be used when VGP login view showup.
*/
- (void)loginViewDisplay;

/*!
 @abstract This method can be used when click to VGP login button.
*/
- (void)loginNormalClick;

/*!
 @abstract This method can be used when click to quickplay login button.
*/
- (void)loginQuickplayClick;

/*!
 @abstract This method can be used when click to Facebook login button.
*/
- (void)loginFacebookClick;

/*!
 @abstract This method can be used when click to Apple login button.
*/
- (void)loginAppleClick;

/*!
 @abstract This method can be used when login click.
*/
- (void)loginClick;

/*!
 @abstract This method can be used when login success.
*/
- (void)loginSuccess:(nullable NSString *)provider;

/*!
 @abstract This method can be used when login error.
*/
- (void)loginError:(nullable NSString *)provider;

#pragma mark Register

/*!
 @abstract This method can be used when click to VGP register button.
*/
- (void)registerClick;

/*!
 @abstract This method can be used when register success.
*/
- (void)registerSuccess:(nullable NSString *)provider;

/*!
 @abstract This method can be used when register error.
*/
- (void)registerError:(nullable NSString *)provider;

#pragma mark Login/Register

/*!
 @abstract This method can be used when login/register success.
*/
- (void)callbackLoginRegister:(BOOL)isRegister;

/*!
 @abstract This method can be used when login/register success.
*/
- (void)callbackLoginRegister:(BOOL)isRegister provider:(nullable NSString *)provider;

#pragma mark Logout

/*!
 @abstract This method can be used when click to VGP logout button.
*/
- (void)logoutClick;

#pragma mark Character

/*!
 @abstract This method can be used when character created.
*/
- (void)characterCreated;

/*!
 @abstract This method can be used when character level up.
 @TODO add name space event
*/
- (void)characterLevelup:(int)level;

/*!
 @abstract This method can be used when character VIP level up.
 @TODO add name space event
*/
- (void)characterVipLevelup:(int)vipLevel;

/*!
 @abstract This method can be used when tutorial start.
 */
- (void)tutorialBegin;

/*!
 @abstract This method can be used when tutorial completed.
*/
- (void)tutorialComplete;

#pragma mark Purchase

/*!
 @abstract This method can be used when game purchase view showup.
*/
- (void)purchaseViewDisplay;

/*!
 @abstract This method can be used when user purchased.
*/
- (void)userHadPurchase;

/*!
 @abstract This method can be used when user purchased with money (VND).
*/
- (void)userPurchase:(int)money;

@end

NS_ASSUME_NONNULL_END
