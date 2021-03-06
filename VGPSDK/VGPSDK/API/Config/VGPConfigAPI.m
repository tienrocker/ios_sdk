//
//  VGPConfigAPI.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/17/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPConfigAPI.h"
#import "VGPConfig.h"
#import "VGPNetworkManager.h"
#import "VGPUserData.h"
#import "VGPHelper.h"

@implementation VGPConfigAPI

+ (void)getServerInfo:(VGPConfigAPISuccess)success failure:(VGPConfigAPIFailure)failure {
    MyLog(@"getServerInfo");
    if([VGP_ENDPOINT isEqualToString:@""]) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"config.error"]];
    } else {
        NSString *url = [NSString stringWithFormat:@"%@/config", VGP_ENDPOINT];
        [[VGPNetworkManager sharedManager] GET:url param:@ {} success:success failure:failure];
    }
}

+ (void)getServerSettings:(VGPConfigAPISuccess)success failure:(VGPConfigAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/account/sdk/settings", VGP_ENDPOINT];
    [[VGPNetworkManager sharedManager] GET:url param:@ {} success:success failure:failure];
}

+ (void)getPaymentSettings:(VGPConfigAPISuccess)success failure:(VGPConfigAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/payment/settings", VGP_ENDPOINT];
    NSDictionary *data = @ {
        @"user_token": [VGPUserData getToken],
        @"package_name": [[NSBundle mainBundle] bundleIdentifier],
    };
    [[VGPNetworkManager sharedManager] GET:url param:data success:success failure:failure];
}

@end
