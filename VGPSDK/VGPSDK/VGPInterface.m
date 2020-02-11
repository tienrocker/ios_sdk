//
//  VGPInterface.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUI.h"

@implementation VGPInterface

static VGPInterface *sharedController = nil;
+ (VGPInterface *)sharedInstance
{
    if (!sharedController) sharedController = [[VGPInterface alloc] init];
    return sharedController;
}

#pragma mark Data
//- (VGPUserdata *) getUserData {
    
//}

#pragma mark Handler User Interface
- (void)loginGame {
    [self loginGame:nil];
}
- (void)loginGame:(void (^ __nullable)(void))completion {
    [self showFlyButton];
    //[[VGPUI sharedInstance] showWelcomeViewController:completion];
    [[VGPUI sharedInstance] showProfileEditController:completion];
}
- (void)logoutGame {
    [self logoutGame:nil];
}
- (void)logoutGame:(void (^ __nullable)(void))completion {
    [self hideFlyButton];
    [[VGPUI sharedInstance] dismiss:completion];
}
- (void)showFlyButton{
    [[[VGPUI sharedInstance] FlyButton] showButton];
}
- (void)hideFlyButton{
    [[[VGPUI sharedInstance] FlyButton] hideButton];
}

#pragma mark Events
- (void)completeMobileTutorial{}
- (void)logLevelUp:(int) level{}
- (void)logCreatedCharacter{}
- (void)logUnlockAchievement:(int) vipLevel{}
- (void)logUserHadPurchase{}
- (void)logPurchase:(int) money{}
- (void)shareFacebookImage:(NSString *)url{}
- (void)shareFacebookImageLocal:(UIImage *) image{}

#pragma mark Init Application

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    MyLog(@"applicationDidFinishLaunching");
}
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    MyLog(@"willFinishLaunchingWithOptions");
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    MyLog(@"didFinishLaunchingWithOptions");
    return YES;
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    MyLog(@"applicationDidBecomeActive");
}
- (void)applicationWillResignActive:(UIApplication *)application {
    MyLog(@"applicationWillResignActive");
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    MyLog(@"application handleOpenURL");
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    MyLog(@"application openURL sourceApplication");
    return YES;
}

#pragma mark Register Push notification

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    
    NSString *token = @"";
    if (@available(iOS 13.0, *)) {
        token = [VGPHelper stringFromDeviceToken:deviceToken];
    } else {
        token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
        token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    
    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken token: %@", token);
    
    //    if(token != nil && ![token isEqualToString:@""]) {
    //        if (![[[VGPUserData sharedInstance] getDidRegisterForRemoteNotificationsWithDeviceToken] isEqualToString:token]) {
    //            [[VGPUserData sharedInstance] setDevicePushTokenKey:token];
    //            [[VGPSignUpAccount sharedInstance] pushNotificationServerWithDeviceToken:token];
    //            [[VGPUserData sharedInstance] setDidRegisterForRemoteNotificationsWithDeviceToken:token];
    //        }
    //    }
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    NSLog(@"Failed to get token, error: %@", error);
}

@end
