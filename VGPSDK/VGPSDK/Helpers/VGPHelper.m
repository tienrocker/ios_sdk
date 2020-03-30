//
//  VGPHelper.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import "VGPHelper.h"
#import "VGPConfig.h"
#import "VGPLogger.h"
#import "UIData.h"
#import "VGPUI.h"
#import "VGPUserData.h"

@implementation VGPHelper

+ (UILayoutGuide *)layoutGuide {
    if (@available(iOS 11, *)) {
        return [[UIApplication sharedApplication] keyWindow].safeAreaLayoutGuide;
    } else {
        return [[UIApplication sharedApplication] keyWindow].layoutMarginsGuide;
    }
}

+ (float)getScreenWidth {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    return screenSize.width;
}

+ (float)getScreenHeight {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    return screenSize.height;
}

+ (CGRect)aspectFitRect:(CGRect)outerRect withInnerRect:(CGRect)innerRect {
    // the width and height ratios of the rects
    CGFloat wRatio = outerRect.size.width / innerRect.size.width;
    CGFloat hRatio = outerRect.size.height/innerRect.size.height;
    
    // calculate scaling ratio based on the smallest ratio.
    CGFloat ratio = (wRatio < hRatio)? wRatio:hRatio;
    
    // The x-offset of the inner rect as it gets centered
    CGFloat xOffset = (outerRect.size.width-(innerRect.size.width*ratio))*0.5;
    
    // The y-offset of the inner rect as it gets centered
    CGFloat yOffset = (outerRect.size.height-(innerRect.size.height*ratio))*0.5;
    
    // aspect fitted origin and size
    CGPoint innerRectOrigin = {xOffset+outerRect.origin.x, yOffset+outerRect.origin.y};
    CGSize innerRectSize = {innerRect.size.width*ratio, innerRect.size.height*ratio};
    
    return (CGRect) {innerRectOrigin, innerRectSize};
}

+ (UIImage*)getUIImageWithImageName:(nullable NSString*) imageName andType:(nullable NSString*) type {
    @try {
        if(type==nil) type = @"png";
        NSString* imagePath = [VGPHelper getImagePathWithName:imageName ofType:type];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        if(image==nil) NSLog(@"getUIImageWithImageName %@.%@ is %@", imageName, type, imagePath);
        return image;
    }
    @catch (NSException *exception) {
        NSLog(@"getUIImageWithImageName %@", exception.reason);
        return nil;
    }
}

+ (UIWindow*)keyWindow {
    UIWindow *foundWindow = nil;
    NSArray *windows = [[UIApplication sharedApplication]windows];
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    return foundWindow;
}

+ (NSString *)stringFromDeviceToken:(NSData*)deviceToken {
    NSUInteger length = deviceToken.length;
    if (length == 0) return nil;
    @try {
        const unsigned char *buffer = deviceToken.bytes;
        NSMutableString *hexString  = [NSMutableString stringWithCapacity:(length * 2)];
        for (int i = 0; i < length; ++i) {
            [hexString appendFormat:@"%02x", buffer[i]];
        }
        return [hexString copy];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        return nil;
    }
}

+ (UIViewController *)topViewController {
    return [self topViewController:[self keyWindow].rootViewController];
}

+ (UIViewController *)topViewController:(UIViewController *)rootViewController
 {
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

+ (void)dismissViewController {
    [[[UIApplication sharedApplication] keyWindow].rootViewController dismissViewControllerAnimated:true completion:nil];
}

+ (NSString *)getImagePathWithName:(nullable NSString *)name ofType:(nullable NSString *)ext {
    name = [NSString stringWithFormat:@"VGPSDK.bundle/%@", name];
    if(ext==nil) ext = @"png";
    NSString *path = [FW_BUNDLE pathForResource:name ofType:ext];
    return path;
}

static NSBundle *bundleTranslation = nil;
+ (NSString *)localizationForString:(NSString *)originalText {
    if(bundleTranslation == nil) {
        NSString * bundlePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"VGPSDK.bundle/%@", [UIData getLocalization]] ofType:@"lproj"];
        bundleTranslation = [NSBundle bundleWithPath:bundlePath];
    }
    return [bundleTranslation localizedStringForKey:originalText value:originalText table:nil];
}
+ (void)changeLocalization:(NSString *)localization {
    [UIData setLocalization:localization];
    bundleTranslation = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_UPDATE_LANGUAGE object:nil userInfo:nil];
}

+ (NSString *)getNSUserDefaults:(NSString *)name {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:name]) return [[NSUserDefaults standardUserDefaults] objectForKey:name];
    return @"";
}
+ (void)setNSUserDefaults:(NSString *)name value:(NSString *)value {
    if(value == nil) [[NSUserDefaults standardUserDefaults] removeObjectForKey:name];
    else [[NSUserDefaults standardUserDefaults] setObject:value forKey:name];
}

+ (NSString *)formatDate:(NSDate *)date {
    return [self formatDate:date withDateFormat:nil];
}

+ (NSString *)formatDate:(NSDate *)date withDateFormat:(NSString *)withDateFormat {
    if(withDateFormat == nil) withDateFormat = @"dd-MM-yyyy";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:withDateFormat];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

+ (void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message {
    [self alertControllerWithTitle:title message:message handler:nil];
}
+ (void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message handler:(void (^ __nullable)(UIAlertAction *action))handler {
    [self alertControllerWithTitle:title message:message actionWithTitle:[VGPHelper localizationForString:@"ok"] handler:handler];
}
+ (void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message actionWithTitle:(nullable NSString *)actionTitle handler:(void (^ __nullable)(UIAlertAction *action))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style: UIAlertActionStyleDefault handler:handler];
    [alertController addAction: action];
    [[VGPHelper topViewController] presentViewController:alertController animated:YES completion:nil];
}

+ (NSString *)MD5:(NSString *)text
{
    const char *cStr = [text UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (int)strlen(cStr), digest ); // This is the md5 call
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) [output appendFormat:@"%02x", digest[i]];
    return  output;
}

#pragma mark -  After login

+ (void)onRegisterSuccess {
    [[VGPLogger sharedInstance] registerSuccess:nil];
    
    if([VGPUserData getShowProtectDialog])
        [[VGPUI sharedInstance] dismiss:^ {
            SHOW_BACK_BUTTON = NO;
            [[VGPUI sharedInstance] showInitAccountController];
        }];
    else
        [[VGPUI sharedInstance] dismiss];
    
    NSDictionary *data = @ {@"id": @([VGPUserData getUserID]), @"token": [VGPUserData getToken]};
    [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_LOGIN_SUCCESS object:nil userInfo:data];
}

+ (void)onLoginSuccess {
    [[VGPLogger sharedInstance] loginSuccess:nil];
    
    if([VGPUserData getShowProtectDialog])
        [[VGPUI sharedInstance] dismiss:^ {
            SHOW_BACK_BUTTON = NO;
            [[VGPUI sharedInstance] showInitAccountController];
        }];
    else
        [[VGPUI sharedInstance] dismiss];
    
    NSDictionary *data = @ {@"id": @([VGPUserData getUserID]), @"token": [VGPUserData getToken]};
    [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_LOGIN_SUCCESS object:nil userInfo:data];
}

+ (void)onLogoutSuccess {
    [[VGPUI sharedInstance] dismiss];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_LOGOUT_SUCCESS object:nil userInfo:@ {}];
}

@end
