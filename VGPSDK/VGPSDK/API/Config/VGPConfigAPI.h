//
//  VGPConfigAPI.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/17/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^VGPConfigAPISuccess)(id responseObject);
typedef void (^VGPConfigAPIFailure)(NSError *error);

@interface VGPConfigAPI : NSObject

+ (void)getServerInfo:(VGPConfigAPISuccess)success failure:(VGPConfigAPIFailure)failure;
+ (void)getServerSettings:(VGPConfigAPISuccess)success failure:(VGPConfigAPIFailure)failure;
+ (void)getPaymentSettings:(NSString *)server_id character_id:(NSString *)character_id package_name:(NSString *)package_name success:(VGPConfigAPISuccess)success failure:(VGPConfigAPIFailure)failure;

@end

NS_ASSUME_NONNULL_END
