//
//  UIData.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VGPHelper.h"

NS_ASSUME_NONNULL_BEGIN

#define VGP_LOCALIZATION @"VGP_LOCALIZATION"
#define VGP_PHONE_CHANGE_ALERT_MESSAGE @"VGP_PHONE_CHANGE_ALERT_MESSAGE"
#define VGP_PHONE_CHANGE_SMS_MESSAGE @"VGP_PHONE_CHANGE_SMS_MESSAGE"

@interface UIData : NSObject

#pragma mark -  LANG
+ (NSString *)getLocalization;
+ (void)setLocalization:(NSString *)localization;

#pragma mark -  String
/**
@todo: dùng khi người dùng đã xác thực số điện thoại nhưng muốn đổi
*/
+ (NSString *)getPhoneChangeAlertMessage;
+ (void)setPhoneChangeAlertMessage:(NSString *)message;
/**
@todo: dùng khi người dùng muốn lấy nội dung sms để xác thực điện thoại
*/
+ (NSString *)getPhoneChangeSMSMessage;
+ (void)setPhoneChangeSMSMessage:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
