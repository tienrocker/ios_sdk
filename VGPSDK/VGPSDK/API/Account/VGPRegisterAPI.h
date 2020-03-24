//
//  VGPRegisterAPI.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/23/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^VGPRegisterAPISuccess)(id responseObject);
typedef void (^VGPRegisterAPIFailure)(NSError *error);

@interface VGPRegisterAPI : NSObject

+ (void)registerWithEmail:(NSString *)username password:(NSString *)password email:(NSString *)email success:(VGPRegisterAPISuccess)success failure:(VGPRegisterAPIFailure)failure;

@end

NS_ASSUME_NONNULL_END
