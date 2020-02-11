//
//  UIData.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "UIData.h"

@implementation UIData

#pragma mark LANG
+ (NSString *)getLocalization {
    NSString *value = [VGPHelper getNSUserDefaults:VGP_LOCALIZATION];
    if(![value isEqualToString:@""]) return value;
    return [[[NSBundle mainBundle] preferredLocalizations] firstObject];
}
+ (void)setLocalization:(NSString *)localization {
    [VGPHelper setNSUserDefaults:VGP_LOCALIZATION value:localization];
}

@end
