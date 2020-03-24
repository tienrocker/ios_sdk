//
//  VGPLoginAPI.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/18/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^VGPLoginAPISuccess)(id responseObject);
typedef void (^VGPLoginAPIFailure)(NSError *error);

@interface VGPLoginAPI : NSObject


+ (void)normalLogin:(NSString *)username password:(NSString *)password success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)facebookLogin:(NSString *)facebook_id success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)quickplayLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)appleLogin:(NSString *)access_token success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;
+ (void)tokenLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure;

@end

NS_ASSUME_NONNULL_END
