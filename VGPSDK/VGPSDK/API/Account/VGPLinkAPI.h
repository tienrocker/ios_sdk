//
//  VGPLinkAPI.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/25/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^VGPLinkAPISuccess)(id responseObject);
typedef void (^VGPLinkAPIFailure)(NSError *error);

@interface VGPLinkAPI : NSObject

+ (void)facebookLink:(NSString *)facebook_id success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)facebookUnLink:(NSString *)facebook_id success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)quickplayLink:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)quickplayUnLink:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)appleLink:(NSString *)user identityToken:(NSString *)identityToken success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;
+ (void)appleUnLink:(NSString *)user identityToken:(NSString *)identityToken success:(VGPLinkAPISuccess)success failure:(VGPLinkAPIFailure)failure;

@end

NS_ASSUME_NONNULL_END
