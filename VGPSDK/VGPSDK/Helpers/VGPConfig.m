//
//  VGPConfig.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/12/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPConfig.h"
#import "VGPHelper.h"
#import "VGPLogger.h"

@implementation VGPConfig

NSString* VGP_SERVER = @"";
NSString* VGP_GAMEID = @"";
NSString* VGP_SDK_VERSION = @"";
NSString* VGP_APPTOKEN = @"";
NSString* VGP_ENDPOINT = @"";
NSString* VGP_APPS_FLYER_TRACKER_APPID = @"";
NSString* VGP_APPS_FLYER_TRACKER_DEVKEY = @"";
BOOL VGP_CONFIG_LOADED = NO;

float VGP_SCREEN_WIDTH = 0;
float VGP_SCREEN_HEIGHT = 0;
UIColor *VGP_MAIN_TEXT_COLOR = nil;
UIFont *VGP_FONT_LABEL_08 = nil;
UIFont *VGP_FONT_LABEL_10 = nil;
UIFont *VGP_FONT_LABEL_13 = nil;
UIFont *VGP_FONT_LABEL_14 = nil;
UIFont *VGP_FONT_LABEL_15 = nil;
UIFont *VGP_FONT_LABEL_20 = nil;

NSArray* VGP_IAP_ITEMS = nil;

/*!
 @todo Autoload method
*/
+ (void)load {
    [self load:nil];
}

+ (void)load:(void (^ __nullable)(void))completion {
    
    VGP_SCREEN_WIDTH = [VGPHelper getScreenWidth];
    VGP_SCREEN_HEIGHT = [VGPHelper getScreenHeight];
    VGP_MAIN_TEXT_COLOR = [UIColor colorWithRed:(232/255.0) green:(141/255.0) blue:(80/255.0) alpha:1];
    VGP_FONT_LABEL_08 = [UIFont fontWithName:@"LexendDeca-Regular" size:8];
    VGP_FONT_LABEL_10 = [UIFont fontWithName:@"LexendDeca-Regular" size:10];
    VGP_FONT_LABEL_13 = [UIFont fontWithName:@"LexendDeca-Regular" size:13];
    VGP_FONT_LABEL_14 = [UIFont fontWithName:@"LexendDeca-Regular" size:14];
    VGP_FONT_LABEL_15 = [UIFont fontWithName:@"LexendDeca-Regular" size:15];
    VGP_FONT_LABEL_20 = [UIFont fontWithName:@"LexendDeca-Regular" size:20];
    
    // read file config
    NSDictionary* result = [self readFile];
    
    NSString *server = [NSString stringWithFormat:@"%@", result[@"server"]];
    NSString *gameid = [NSString stringWithFormat:@"%@", result[@"gameid"]];
    NSString *sdk_version = [NSString stringWithFormat:@"%@", result[@"sdk_version"]];
    NSString *apptoken = [NSString stringWithFormat:@"%@", result[@"apptoken"]];
    NSString *apps_flyer_id = [NSString stringWithFormat:@"%@", result[@"apps_flyer_id"]];
    NSString *apps_flyer_key = [NSString stringWithFormat:@"%@", result[@"apps_flyer_key"]];
    
    if([server length] != 0 && ![server isEqualToString:@"(null)"] &&
       [gameid length] != 0 && ![gameid isEqualToString:@"(null)"] &&
        [sdk_version length] != 0 && ![sdk_version isEqualToString:@"(null)"] &&
        [apptoken length] != 0 && ![apptoken isEqualToString:@"(null)"] &&
        [apps_flyer_key length] != 0 && ![apps_flyer_key isEqualToString:@"(null)"] &&
        [apps_flyer_id length] != 0 && ![apps_flyer_id isEqualToString:@"(null)"]) {
        VGP_SERVER = server;
        VGP_GAMEID = gameid;
        [VGPLogger setGameCode:VGP_GAMEID];
        VGP_SDK_VERSION = sdk_version;
        VGP_APPTOKEN = apptoken;
        VGP_APPS_FLYER_TRACKER_APPID = apps_flyer_id;
        VGP_APPS_FLYER_TRACKER_DEVKEY = apps_flyer_key;
        VGP_ENDPOINT = [NSString stringWithFormat:@"%@/%@/%@", VGP_SERVER, VGP_GAMEID, VGP_SDK_VERSION];
        if (completion) completion();
    }
}

+ (NSDictionary*)readFile {
    NSDictionary *result = nil;
    NSString *fileName = [FW_BUNDLE pathForResource:@"vgp_config" ofType:@"json"];
    NSString *error_string = @"";
    
    //check file exists
    if (fileName) {
        
        NSData *data = [[NSData alloc] initWithContentsOfFile:fileName];
        NSError *error;
        result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (error) {
            error_string = [NSString stringWithFormat:[VGPHelper localizationForString:@"config.error"], error.localizedDescription];
        }
    }
    else {
        error_string = [VGPHelper localizationForString:@"config.error.missing"];
    }
    
    if(![error_string isEqualToString:@""]) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"]
                                    message:error_string];
    }
    
    return result;
}

@end
