//
//  VGPProfileAPI.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/24/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^VGPProfileAPISuccess)(id responseObject);
typedef void (^VGPProfileAPIFailure)(NSError *error);

@interface VGPProfileAPI : NSObject

+ (void)getProfile:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)updateUserInfo:(NSString *)name gender:(NSNumber *)gender birthday:(NSString *)birthday address:(NSString *)address personal_identity:(NSString *)personal_identity place_of_issue:(NSString *)place_of_issue date_of_issue:(NSString *)date_of_issue success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

+ (void)updatePhone:(NSString *)phone success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)resendVerifyPhone:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;
+ (void)verifyPhone:(NSString *)code success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

/**
 @TODO: email sẽ được xác thực bằng link gửi qua email address
 */
+ (void)resendVerifyEmail:(NSString *)email success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

+ (void)protectAccount:(NSString *)username password:(NSString *)password success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

#pragma mark -  Account change password

+ (void)changePassword:(NSString *)old_password password:(NSString *)new_password success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure;

@end

NS_ASSUME_NONNULL_END
