//
//  VGPPaymentAPI.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/30/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPPaymentAPI.h"
#import "VGPConfig.h"
#import "VGPNetworkManager.h"
#import "VGPDeviceData.h"
#import "VGPUserData.h"
#import "VGPHelper.h"

@implementation VGPPaymentAPI

+ (void)check:(NSString *)characterID andServerID:(NSString *)serverID andItemID:(NSString *)itemID andPartnerToken:(NSString *)partnerToken success:(VGPPaymentAPISuccess)success failure:(VGPPaymentAPIFailure)failure {
    if(partnerToken == nil) partnerToken = @"";
    NSString *url = [NSString stringWithFormat:@"%@/payment/direct", VGP_ENDPOINT];
    NSDictionary *data = @ {
        @"character_id": characterID,
        @"server_id": serverID,
        @"item_id": itemID,
        @"parter_token": partnerToken,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}
+ (void)iap:(NSString *)characterID andServerID:(NSString *)serverID andItemID:(NSString *)itemID andPartnerToken:(NSString *)partnerToken andReceiptData:(NSString *)receiptData success:(VGPPaymentAPISuccess)success failure:(VGPPaymentAPIFailure)failure {
    NSString *url = [NSString stringWithFormat:@"%@/payment/in-app", VGP_ENDPOINT];
    NSDictionary *data = @ {
        @"character_id": characterID,
        @"server_id": serverID,
        @"item_id": itemID,
        @"parter_token": partnerToken == nil ? @"" : partnerToken,
        @"receipt_type": [NSNumber numberWithInt:2], // apple: 2
        @"receipt_data": receiptData,
        @"device": [VGPDeviceData getDeviceId],
        @"campaign":[VGPDeviceData getCampaign],
        @"media_source":[VGPDeviceData getSourceID],
    };
    [[VGPNetworkManager sharedManager] POST:url param:data success:success failure:failure];
}

@end
