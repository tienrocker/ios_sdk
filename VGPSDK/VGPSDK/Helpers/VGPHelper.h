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
#define VGP_UPDATE_LANGUAGE @"VGP_UPDATE_LANGUAGE"
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

@end

NS_ASSUME_NONNULL_END
