//
//  VGPAPI.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/17/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIData.h"
#import "VGPConfig.h"
#import "VGPConfigAPI.h"
#import "VGPLoginAPI.h"
#import "VGPRegisterAPI.h"
#import "VGPProfileAPI.h"
#import "VGPLinkAPI.h"
#import "VGPPaymentAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface VGPAPI : NSObject

#pragma mark -  Config

+ (void)getServerInfo;

#pragma mark -  Account login
+ (void)normalLogin:(NSString *)username password:(NSString *)password success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)facebookLogin:(NSString *)facebook_id success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)quickplayLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)appleLogin:(NSString *)access_token success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)tokenLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;

#pragma mark -  Account register
+ (void)registerWithEmail:(NSString *)username password:(NSString *)password email:(NSString *)email success:(VGPRegisterAPISuccess)success failure:(VGPRegisterAPIFailure)failure;

#pragma mark -  Account profile
+ (void)getProfile:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)updateUserInfo:(NSString *)name gender:(NSNumber *)gender birthday:(NSString *)birthday address:(NSString *)address personal_identity:(NSString *)personal_identity place_of_issue:(NSString *)place_of_issue date_of_issue:(NSString *)date_of_issue success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)updatePhone:(NSString *)phone success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)resendVerifyPhone:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)verifyPhone:(NSString *)code success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)resendVerifyEmail:(NSString *)email success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

#pragma mark -  Account protect
+ (void)protectAccount:(NSString *)username password:(NSString *)password success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

#pragma mark -  Account link
+ (void)facebookLink:(NSString *)facebook_id success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)facebookUnLink:(NSString *)facebook_id success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)quickplayLink:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)quickplayUnLink:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)appleLink:(NSString *)user identityToken:(NSString *)identityToken success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)appleUnLink:(NSString *)user identityToken:(NSString *)identityToken success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;

#pragma mark -  Account change password
+ (void)changePassword:(NSString *)old_password password:(NSString *)new_password success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

#pragma mark -  Purchase item
+ (void)check:(NSString *)characterID andServerID:(NSString *)serverID andItemID:(NSString *)itemID andPartnerToken:(NSString *)partnerToken success:(VGPPaymentAPISuccess)success failure:(VGPPaymentAPIFailure)failure;
+ (void)iap:(NSString *)characterID andServerID:(NSString *)serverID andItemID:(NSString *)itemID andPartnerToken:(NSString *)partnerToken andReceiptData:(NSString *)receiptData success:(VGPPaymentAPISuccess)success failure:(VGPPaymentAPIFailure)failure;

@end

NS_ASSUME_NONNULL_END
