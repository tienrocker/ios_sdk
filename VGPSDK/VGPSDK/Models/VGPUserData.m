//
//  VGPUserData.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPUserData.h"

@implementation VGPUserData

+ (NSString *)getUserID {
    NSString *value = [VGPHelper getNSUserDefaults:VGP_USERID];
    return value;
}
+ (void)setUserID:(NSString *)ID {
    [VGPHelper setNSUserDefaults:VGP_USERID value:ID];
}

+ (NSString *)getUsername {
    NSString *value = [VGPHelper getNSUserDefaults:VGP_USERNAME];
    return value;
}
+ (void)setUsername:(NSString *)name {
    [VGPHelper setNSUserDefaults:VGP_USERNAME value:name];
}

@end
