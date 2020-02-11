//
//  VGPUserData.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VGPHelper.h"

NS_ASSUME_NONNULL_BEGIN

#define VGP_USERID @"VGP_USERID"
#define VGP_USERNAME @"VGP_USERNAME"

@interface VGPUserData : NSObject

+ (NSString *)getUserID;
+ (void)setUserID:(NSString *)ID;
+ (NSString *)getUsername;
+ (void)setUsername:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
