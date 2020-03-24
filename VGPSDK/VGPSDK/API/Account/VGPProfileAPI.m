//
//  VGPProfileAPI.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/24/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPProfileAPI.h"
#import "VGPConfig.h"
#import "VGPNetworkManager.h"
#import "VGPDeviceData.h"
#import "VGPUserData.h"
#import "VGPHelper.h"

@implementation VGPProfileAPI

+ (void)getProfile:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/account/user", VGP_ENDPOINT];
    NSDictionary *data = @{};
    [[VGPNetworkManager sharedManager] GET:url param:data success:success failure:failure];
}

+ (void)updateUserInfo:(NSString *)name gender:(NSNumber *)gender birthday:(NSString *)birthday address:(NSString *)address personal_identity:(NSString *)personal_identity place_of_issue:(NSString *)place_of_issue date_of_issue:(NSString *)date_of_issue success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/account/user", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"name": name,
        @"gender": gender,
        @"birthday": birthday,
        @"address": address,
        @"personal_identity": personal_identity,
        @"place_of_issue": place_of_issue,
        @"date_of_issue": date_of_issue,
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

+ (void)updatePhone:(NSString *)phone success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/account/user/phone", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"phone": phone,
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

+ (void)resendVerifyPhone:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/account/user/retry_phone", VGP_ENDPOINT];
    NSDictionary *data = @{};
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

+ (void)verifyPhone:(NSString *)code success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/account/verify/phone", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"code": code,
        @"device": [VGPDeviceData getDeviceId],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

+ (void)resendVerifyEmail:(NSString *)email success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/account/user/email", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"email": email,
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

@end
