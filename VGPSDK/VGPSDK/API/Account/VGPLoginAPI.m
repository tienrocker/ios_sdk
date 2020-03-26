//
//  VGPLoginAPI.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/18/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPLoginAPI.h"
#import "VGPConfig.h"
#import "VGPNetworkManager.h"
#import "VGPDeviceData.h"
#import "VGPUserData.h"
#import "VGPHelper.h"

#define AGENCY @"IOS"

@implementation VGPLoginAPI

+ (void)normalLogin:(NSString *)username password:(NSString *)password success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/signin", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": username,
        @"password": password,
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)facebookLogin:(NSString *)facebook_id success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/social", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": facebook_id,
        @"password": [FBSDKAccessToken currentAccessToken].tokenString,
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)quickplayLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/quick_play", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": [VGPDeviceData getDeviceId],
        @"password": @"",
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)appleLogin:(NSString *)access_token success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/ios", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": access_token,
        @"password": @"",
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)tokenLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/token", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": @"",
        @"password": [VGPUserData getToken],
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

@end
