//
//  VGPConfig.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/12/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define VGP_EVENT_UPDATE_LANGUAGE @"VGP_EVENT_UPDATE_LANGUAGE"
#define VGP_EVENT_UPDATE_LAYOUT @"VGP_EVENT_UPDATE_LAYOUT"
#define VGP_EVENT_FACEBOOK_SHARE_SUCCESS @"VGP_EVENT_FACEBOOK_SHARE_SUCCESS"
#define VGP_EVENT_NETWORK_TIMEOUT @"VGP_EVENT_NETWORK_TIMEOUT"
#define VGP_EVENT_INIT_READY @"VGP_EVENT_INIT_READY"
#define VGP_EVENT_LOGIN_SUCCESS @"VGP_EVENT_LOGIN_SUCCESS"
#define VGP_EVENT_LOGOUT_SUCCESS @"VGP_EVENT_LOGOUT_SUCCESS"

@interface VGPConfig : NSObject

extern NSString *VGP_SERVER;
extern NSString *VGP_GAMEID;
extern NSString *VGP_SDK_VERSION;
extern NSString *VGP_APPTOKEN;
extern NSString *VGP_ENDPOINT;
extern NSString *VGP_APPS_FLYER_TRACKER_APPID;
extern NSString *VGP_APPS_FLYER_TRACKER_DEVKEY;
extern BOOL VGP_CONFIG_LOADED;

extern UIColor *VGP_MAIN_TEXT_COLOR;
extern UIFont *VGP_FONT_LABEL_10;
extern UIFont *VGP_FONT_LABEL_13;
extern UIFont *VGP_FONT_LABEL_15;
extern UIFont *VGP_FONT_LABEL_20;

/*!
 @todo Autoload method
*/
+ (void)load;
+ (void)load:(void (^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
