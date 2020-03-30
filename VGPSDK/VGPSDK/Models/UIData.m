//
//  UIData.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "UIData.h"

@implementation UIData

#pragma mark -  LANG
+ (NSString *)getLocalization {
    NSString *value = [VGPHelper getNSUserDefaults:VGP_LOCALIZATION];
    if(![value isEqualToString:@""]) return value;
    return [[[NSBundle mainBundle] preferredLocalizations] firstObject];
}
+ (void)setLocalization:(NSString *)localization {
    [VGPHelper setNSUserDefaults:VGP_LOCALIZATION value:localization];
}

#pragma mark -  String
/**
 @todo: dùng khi người dùng đã xác thực số điện thoại nhưng muốn đổi
 */
+ (NSString *)getPhoneChangeAlertMessage {
    return [VGPHelper getNSUserDefaults:VGP_PHONE_CHANGE_ALERT_MESSAGE];
}
+ (void)setPhoneChangeAlertMessage:(NSString *)message {
    [VGPHelper setNSUserDefaults:VGP_PHONE_CHANGE_ALERT_MESSAGE value:message];
}
/**
@todo: dùng khi người dùng muốn lấy nội dung sms để xác thực điện thoại
*/
+ (NSString *)getPhoneChangeSMSMessage {
    return [VGPHelper getNSUserDefaults:VGP_PHONE_CHANGE_SMS_MESSAGE];
}
+ (void)setPhoneChangeSMSMessage:(NSString *)message {
    [VGPHelper setNSUserDefaults:VGP_PHONE_CHANGE_SMS_MESSAGE value:message];
}

@end
