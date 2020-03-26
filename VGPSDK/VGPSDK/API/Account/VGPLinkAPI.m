//
//  VGPLinkAPI.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/25/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPLinkAPI.h"
#import "VGPConfig.h"
#import "VGPNetworkManager.h"
#import "VGPDeviceData.h"
#import "VGPUserData.h"
#import "VGPHelper.h"

#define AGENCY @"IOS"

@implementation VGPLinkAPI

+ (void)facebookLink:(NSString *)facebook_id success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/user/connect_social", VGP_ENDPOINT];
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
+ (void)facebookUnLink:(NSString *)facebook_id success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/user/disconnect_social", VGP_ENDPOINT];
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
+ (void)quickplayLink:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/user/connect_quickplay", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": [VGPDeviceData getDeviceId],
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)quickplayUnLink:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/user/disconnect_quickplay", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": [VGPDeviceData getDeviceId],
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)appleLink:(NSString *)user identityToken:(NSString *)identityToken success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/user/connect_apple", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": user,
        @"password": identityToken,
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)appleUnLink:(NSString *)user identityToken:(NSString *)identityToken success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/user/disconnect_apple", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": user,
        @"password": identityToken,
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

@end
