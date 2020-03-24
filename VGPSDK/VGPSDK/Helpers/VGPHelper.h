//
//  VGPHelper.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VGPHelper : NSObject

#define MyLog(x, ...) NSLog(@"VGPLOG %s %d: " x, __FUNCTION__, __LINE__, ##__VA_ARGS__)
//#define FW_BUNDLE [NSBundle bundleForClass:[self class]]
#define FW_BUNDLE [NSBundle mainBundle]
#define LAYOUT_WIDTH 650.0f
#define LAYOUT_HEIGHT 320.0f
#define LAYOUT_OFFSET 0.04f

+ (UILayoutGuide *) layoutGuide;
+ (float)getScreenWidth;
+ (float)getScreenHeight;
+ (CGRect)aspectFitRect:(CGRect)outerRect withInnerRect:(CGRect)innerRect;

+ (UIImage*)getUIImageWithImageName:(nullable NSString*) imageName andType:(nullable NSString*) type;
    
+ (NSString *)stringFromDeviceToken:(NSData*)deviceToken;

+ (UIViewController *) topViewController;
+ (UIViewController *) topViewController:(UIViewController *)rootViewController;
+ (void)dismissViewController;

+ (NSString *)getImagePathWithName:(nullable NSString *)name ofType:(nullable NSString *)ext;
+ (NSString *)localizationForString:(NSString *)originalText;
+ (void)changeLocalization:(NSString *)localization;

+ (NSString *)getNSUserDefaults:(NSString *)name;
+ (void)setNSUserDefaults:(NSString *)name value:(NSString *)value;

+ (NSString *)formatDate:(NSDate *)date;
+ (NSString *)formatDate:(NSDate *)date withDateFormat:(NSString *)withDateFormat;

+ (void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message;
+ (void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler;
+ (void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message actionWithTitle:(nullable NSString *)actionTitle handler:(void (^ __nullable)(UIAlertAction *action))handler;

#pragma mark After login
+ (void)onRegisterSuccess;
+ (void)onLoginSuccess;
+ (void)onLogoutSuccess;

@end

NS_ASSUME_NONNULL_END
