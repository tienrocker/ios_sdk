//
//  Logger.m
//  VGPSDK-Code
//
//  Created by  Tien Tran on 2/25/20.
//  Copyright © 2020 Insert. All rights reserved.
//

#import "VGPLogger.h"

@implementation VGPLogger

static VGPLogger *sharedLogger = nil;

/*!
 @abstract Store class instance.
 */
+ (VGPLogger *)sharedInstance
{
    if (!sharedLogger) {
        sharedLogger = [[VGPLogger alloc] init];
        sharedLogger.openTimeMillis = [sharedLogger currentTimeMillis];
        sharedLogger.loginType = kLoginTypeQuickplay;
        sharedLogger.loginProvider = @"unknow";
        sharedLogger.game_version = @"unknow";
        sharedLogger.game_code = @"unknow";
    }
    return sharedLogger;
}

/*!
 @abstract Set config.
 */
+ (void)setGameVersion:(NSString*)code {
    [VGPLogger sharedInstance].game_version = code;
    LoggerLog(@"game_version %@", [VGPLogger sharedInstance].game_version);
}

/*!
 @abstract Set config.
 */
+ (void)setGameCode:(NSString*)code {
    [VGPLogger sharedInstance].game_code = code;
    LoggerLog(@"game_code %@", [VGPLogger sharedInstance].game_code);
}

/*!
 @abstract Get refault parameter.
 */
- (NSDictionary *)defaultParams {
    long current_time = [self currentTimeMillis];
    long delta_time = current_time - self.openTimeMillis;
    
    NSDictionary *parameters = @{
        @"vt_param_current_time" : [NSNumber numberWithLong:current_time],
        @"vt_param_delta_time" : [NSNumber numberWithLong:delta_time],
        @"vt_param_game_version" : self.game_version,
        @"vt_param_game_version_code" : self.game_code,
    };
    return parameters;
}

/*!
 @abstract This method get current time in milliseconds.
 */
- (long)currentTimeMillis {
    return (long)([[NSDate date] timeIntervalSince1970] * 1000.0);
}

/*!
 @abstract This method log default events.
 */
- (void)log:(NSString *)event_name {
    [self log:event_name parameters:[self defaultParams]];
}

/*!
 @abstract This method log event with parameters.
 */
- (void)log:(NSString *)event_name parameters:(NSDictionary *)parameters {
    LoggerLog(@"event_name %@ parameters %@", event_name, parameters);
    [[AppsFlyerTracker sharedTracker] trackEvent:event_name withValues:parameters];
    [FBSDKAppEvents logEvent:event_name parameters:parameters];
    [FIRAnalytics logEventWithName:event_name parameters:parameters];
}

#pragma mark Resource Download

/*!
 @abstract This method can be used when init download resource pack.
 @TODO filter fisrt time and another
 */
- (void)resourceStartDownload {
    [self log:@"vt_resource_download_begin"];
}

/*!
 @abstract This method can be used when downloading resource pack.
 @TODO filter fisrt time and another
 */
- (void)resourceProcessDownload:(int)percent {
    NSString *event_name = [NSString stringWithFormat:@"vt_resource_download_%d", percent];
    [self log:event_name];
}

/*!
 @abstract This method can be used when download success resource pack.
 @TODO filter fisrt time and another
 */
- (void)resourceDownloadSuccess {
    NSString *event_name = @"vt_resource_download_success";
    [self log:event_name];
}

/*!
 @abstract This method can be used when download failed resource pack.
 @TODO filter fisrt time and another
 */
- (void)resourceDownloadError {
    NSString *event_name = @"vt_resource_download_failed";
    [self log:event_name];
}

#pragma mark Resource Unpack

/*!
 @abstract This method can be used when start unpack resource pack.
 @TODO filter fisrt time and another
 */
- (void)resourceStartUnpack {
    NSString *event_name = @"vt_resource_extract_begin";
    [self log:event_name];
}

/*!
 @abstract This method can be used when unpack success resource pack.
 @TODO filter fisrt time and another
 */
- (void)resourceUnpackSuccess {
    NSString *event_name = @"vt_resource_extract_success";
    [self log:event_name];
}

/*!
 @abstract This method can be used when unpack failed resource pack.
 @TODO filter fisrt time and another
 */
- (void)resourceUnpackError {
    NSString *event_name = @"vt_resource_extract_failed";
    [self log:event_name];
}

#pragma mark Login

/*!
 @abstract This method can be used when VGP login view showup.
 */
- (void)loginViewDisplay {
    NSString *event_name = @"vt_form_login_open";
    [self log:event_name];
}

/*!
 @abstract This method can be used when click to VGP login button.
 */
- (void)loginNormalClick {
    self.loginType = kLoginTypeNormal;
    self.loginProvider = @"vgp";
    [self loginClick];
}

/*!
 @abstract This method can be used when click to quickplay login button.
 */
- (void)loginQuickplayClick {
    self.loginType = kLoginTypeQuickplay;
    self.loginProvider = @"quickplay";
    [self loginClick];
}

/*!
 @abstract This method can be used when click to Facebook login button.
 */
- (void)loginFacebookClick {
    self.loginType = kLoginTypeFacebook;
    self.loginProvider = @"facebook";
    [self loginClick];
}

/*!
 @abstract This method can be used when click to Apple login button.
 */
- (void)loginAppleClick {
    self.loginType = kLoginTypeApple;
    self.loginProvider = @"apple";
    [self loginClick];
}

/*!
 @abstract This method can be used when login click.
 */
- (void)loginClick {
    NSString *event_name = @"vt_button_login_click";
    [self log:event_name parameters:@{@"provider":self.loginProvider}];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

/*!
 @abstract This method can be used when login success.
 */
- (void)loginSuccess:(NSString *)provider {
    if(provider != nil && ![provider isEqualToString:@""]) self.loginProvider = provider;
    
    NSString *event_name = @"login_success";
    [self log:event_name parameters:@{@"provider":self.loginProvider}];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

/*!
 @abstract This method can be used when login error.
 */
- (void)loginError:(NSString *)provider {
    if(provider != nil && ![provider isEqualToString:@""]) self.loginProvider = provider;
    
    NSString *event_name = @"login_error";
    [self log:event_name parameters:@{@"provider":self.loginProvider}];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

#pragma mark Register

/*!
 @abstract This method can be used when click to VGP register button.
 */
- (void)registerClick {
    self.loginType = kLoginTypeNormal;
    self.loginProvider = @"vgp";
    
    NSString *event_name = @"vt_button_register_click";
    [self log:event_name parameters:@{@"provider":self.loginProvider}];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

/*!
 @abstract This method can be used when VGP register success.
 */
- (void)registerSuccess:(NSString *)provider {
    if(provider != nil && ![provider isEqualToString:@""]) self.loginProvider = provider;
    
    NSString *event_name = @"signup_success";
    [self log:event_name parameters:@{@"provider":self.loginProvider}];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

/*!
 @abstract This method can be used when VGP register error.
 */
- (void)registerError:(NSString *)provider {
    if(provider != nil && ![provider isEqualToString:@""]) self.loginProvider = provider;
    
    NSString *event_name = @"signup_failure";
    [self log:event_name];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

#pragma mark Login/Register

/*!
 @abstract This method can be used when login/register success.
*/
- (void)callbackLoginRegister:(BOOL)isRegister {
    [self callbackLoginRegister:isRegister provider:nil];
}

/*!
 @abstract This method can be used when login/register success.
*/
- (void)callbackLoginRegister:(BOOL)isRegister provider:(nullable NSString *)provider {
    if(isRegister) {
        [self registerSuccess:provider];
    } else {
        [self loginSuccess:provider];
    }
}

#pragma mark Logout

/*!
 @abstract This method can be used when click to VGP logout button.
*/
- (void)logoutClick{
    NSString *event_name = @"vt_button_logout_click";
    [self log:event_name parameters:@{@"provider":self.loginProvider}];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

#pragma mark Character

/*!
 @abstract This method can be used when character created.
 @TODO: do facebook không hiển thị cột custom nên chế character created sang registration
 */
- (void)characterCreated {
    LoggerLog(@"characterCreated");
    
    [FBSDKAppEvents logEvent:FBSDKAppEventNameCompletedRegistration parameters:@{FBSDKAppEventParameterNameRegistrationMethod:self.loginProvider}];
    [FIRAnalytics logEventWithName:kFIREventSignUp parameters:@{kFIRParameterSignUpMethod:self.loginProvider}];
    [[AppsFlyerTracker sharedTracker] trackEvent:AFEventCompleteRegistration withValues:@{AFEventParamRegistrationMethod:self.loginProvider}];
    
    NSString *event_name = @"vt_character_created";
    [self log:event_name];
    
    event_name = [NSString stringWithFormat:@"%@_%@", event_name, self.loginProvider];
    [self log:event_name];
}

/*!
 @abstract This method can be used when character level up.
 @TODO add name space event
 */
- (void)characterLevelup:(int)level {
    LoggerLog(@"characterLevelup %d", level);
    
    NSNumber *levelText = [NSNumber numberWithInt:level];
    
    [FBSDKAppEvents logEvent:FBSDKAppEventNameAchievedLevel parameters:@{FBSDKAppEventParameterNameLevel:levelText}];
    [FIRAnalytics logEventWithName:kFIREventLevelUp parameters:@{kFIRParameterLevel:levelText}];
    [[AppsFlyerTracker sharedTracker] trackEvent:AFEventLevelAchieved withValues:@{AFEventParamLevel:levelText}];
    
    [FBSDKAppEvents logEvent:[NSString stringWithFormat:@"%@_%@", FBSDKAppEventNameAchievedLevel, levelText] parameters:@{FBSDKAppEventParameterNameLevel:levelText}];
    [FIRAnalytics logEventWithName:[NSString stringWithFormat:@"%@_%@", kFIREventLevelUp, levelText] parameters:@{kFIRParameterLevel:levelText}];
    [[AppsFlyerTracker sharedTracker] trackEvent:[NSString stringWithFormat:@"%@_%@", AFEventLevelAchieved, levelText] withValues:@{AFEventParamLevel:levelText}];
}

/*!
 @abstract This method can be used when character VIP level up.
 @TODO add name space event
 */
- (void)characterVipLevelup:(int)vipLevel {
    LoggerLog(@"characterVipLevelup %d", vipLevel);
    
    NSNumber *vipLevelText = [NSNumber numberWithInt:vipLevel];
    
    [FBSDKAppEvents logEvent:FBSDKAppEventNameUnlockedAchievement parameters:@{FBSDKAppEventParameterNameLevel:vipLevelText}];
    [FIRAnalytics logEventWithName:kFIREventUnlockAchievement parameters:@{kFIRParameterLevel:vipLevelText}];
    [[AppsFlyerTracker sharedTracker] trackEvent:AFEventAchievementUnlocked withValues:@{AFEventParamLevel:vipLevelText}];
    
    [FBSDKAppEvents logEvent:[NSString stringWithFormat:@"%@_%@", FBSDKAppEventNameUnlockedAchievement, vipLevelText] parameters:@{}];
    [FIRAnalytics logEventWithName:[NSString stringWithFormat:@"%@_%@", kFIREventUnlockAchievement, vipLevelText] parameters:@{}];
    [[AppsFlyerTracker sharedTracker] trackEvent:[NSString stringWithFormat:@"%@_%@", AFEventAchievementUnlocked, vipLevelText] withValues:@{}];
}

/*!
 @abstract This method can be used when tutorial start.
 */
- (void)tutorialBegin {
    LoggerLog(@"tutorialBegin");
    
    [FBSDKAppEvents logEvent:@"fb_mobile_tutorial_begin"];
    [FIRAnalytics logEventWithName:@"tutorial_begin" parameters:@{}];
    [[AppsFlyerTracker sharedTracker] trackEvent:@"af_tutorial_begin" withValues:@{}];
}

/*!
 @abstract This method can be used when tutorial completed.
 */
- (void)tutorialComplete {
    LoggerLog(@"tutorialComplete");
    
    [FBSDKAppEvents logEvent:FBSDKAppEventNameCompletedTutorial];
    [FIRAnalytics logEventWithName:kFIREventTutorialComplete parameters:@{}];
    [[AppsFlyerTracker sharedTracker] trackEvent:AFEventTutorial_completion withValues:@{}];
}

#pragma mark Purchase

/*!
 @abstract This method can be used when game purchase view showup.
 */
- (void)purchaseViewDisplay {
    NSString *event_name = @"vt_form_payment_open";
    [self log:event_name];
}

/*!
 @abstract This method can be used when user purchased.
 */
- (void)userHadPurchase {
    LoggerLog(@"userHadPurchase");
    
    [FIRAnalytics setUserPropertyString:@"ios" forName:@"PU"];
}

/*!
 @abstract This method can be used when user purchased with money (VND).
 */
- (void)userPurchase:(int)money {
    LoggerLog(@"userPurchase vgpevent_%d", money);
    
    [FBSDKAppEvents logPurchase:money currency:@"VND" parameters:@{@"cashtype":self.loginProvider}];
    [FIRAnalytics logEventWithName:[NSString stringWithFormat:@"vgpevent_%@", [NSNumber numberWithInt:money]] parameters:@{kFIRParameterValue:[NSNumber numberWithInt:money], @"cashtype":self.loginProvider}];
    [[AppsFlyerTracker sharedTracker] trackEvent:AFEventPurchase withValues:@{AFEventParamRevenue:[NSNumber numberWithInt:money], AFEventParamCurrency:@"VND", AFEventParamContentType:self.loginProvider}];
    
    [self userHadPurchase];
}

@end
