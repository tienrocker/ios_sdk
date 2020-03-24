//
//  VGPDeviceData.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/12/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VGPHelper.h"

NS_ASSUME_NONNULL_BEGIN

#define VGP_DEVICE_CAMPAIGN @"VGP_DEVICE_CAMPAIGN"
#define VGP_DEVICE_SOURCEID @"VGP_DEVICE_SOURCEID"

@interface VGPDeviceData : NSObject

+ (NSString *)getDeviceId;
+ (NSString *)getCampaign;
+ (void)setCampaign:(NSString *)campaign;
+ (NSString *)getSourceID;
+ (void)setSourceID:(NSString *)sourceID;

@end

NS_ASSUME_NONNULL_END
