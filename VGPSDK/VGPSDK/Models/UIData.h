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

@interface UIData : NSObject

#pragma mark LANG
+ (NSString *)getLocalization;
+ (void)setLocalization:(NSString *)localization;

@end

NS_ASSUME_NONNULL_END
