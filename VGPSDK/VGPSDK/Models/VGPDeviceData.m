//
//  VGPDeviceData.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/12/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPDeviceData.h"
#import "UIDevice+FCUUID.h"

@implementation VGPDeviceData

+ (NSString *)getDeviceId{
    NSString* device_id = [FCUUID uuidForDevice];
    device_id = [NSString stringWithFormat:@"ven_%@-%@-%@-%@-%@",
                 [device_id substringWithRange:NSMakeRange(0, 8)],
                 [device_id substringWithRange:NSMakeRange(8, 4)],
                 [device_id substringWithRange:NSMakeRange(12, 4)],
                 [device_id substringWithRange:NSMakeRange(16, 4)],
                 [device_id substringWithRange:NSMakeRange(20, 12)]
                 ];
    return device_id;
}
+ (NSString *)getCampaign{ return [VGPHelper getNSUserDefaults:VGP_DEVICE_CAMPAIGN]; }
+ (void)setCampaign:(NSString *)campaign{ [VGPHelper setNSUserDefaults:VGP_DEVICE_CAMPAIGN value:campaign]; }
+ (NSString *)getSourceID{ return [VGPHelper getNSUserDefaults:VGP_DEVICE_SOURCEID]; }
+ (void)setSourceID:(NSString *)sourceID{ [VGPHelper setNSUserDefaults:VGP_DEVICE_SOURCEID value:sourceID]; }

@end
