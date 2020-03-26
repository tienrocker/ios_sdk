//
//  VGPRegisterAPI.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/23/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPRegisterAPI.h"
#import "VGPConfig.h"
#import "VGPNetworkManager.h"
#import "VGPDeviceData.h"
#import "VGPUserData.h"
#import "VGPHelper.h"

#define AGENCY @"IOS"

@implementation VGPRegisterAPI

+ (void)registerWithEmail:(NSString *)username password:(NSString *)password email:(NSString *)email success:(VGPRegisterAPISuccess)success failure:(VGPRegisterAPIFailure)failure{
    NSString *url = [NSString stringWithFormat:@"%@/account/signup-with-email", VGP_ENDPOINT];
    NSDictionary *data = @{
        @"username": username,
        @"password": password,
        @"email": email,
        @"agency": AGENCY,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

@end
