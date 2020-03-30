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
#import "VGPConfig.h"
#import "VGPDeviceData.h"
#import "VGPLogger.h"
#import "FBSDKSharingCallback.h"
#import "VGPAPI.h"
#import "VGPIAPHelper.h"

@interface VGPInterface  (){
    BOOL isPurchasing;
    NSString *characterIDPurchasing;
    NSString *serverIDPurchasing;
    NSString *itemIDPurchasing;
    NSString *partnerDataPurchasing;
}

@end

@implementation VGPInterface

static VGPInterface *sharedController = nil;

+ (VGPInterface *)sharedInstance
 {
     if (!sharedController) sharedController = [[VGPInterface alloc] init];
    return sharedController;
}

#pragma mark -  Data
- (NSInteger)getUserID {
    return [VGPUserData getUserID];
}
- (NSString *)getUsername {
    return [VGPUserData getUsername];
}

#pragma mark -  Handler User Interface
- (void)loginGame {
    [self loginGame:nil];
}
- (void)loginGame:(void (^ __nullable)(void))completion {
    
    if(VGP_CONFIG_LOADED == NO) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"notification"] message:[VGPHelper localizationForString:@"notification"]];
        return;
    }
    
    /**
     @TODO: nếu người dùng đã lưu đăng nhập trước đó thì call login bằng token lên server, trường hợp người dùng hết hạn đăng nhập thì bắt đăng nhập lại
     */
    if([VGPUserData getUserID] == 0) {
        [[VGPUI sharedInstance] showWelcomeController:completion];
    } else {
        [VGPAPI tokenLogin:^(id  _Nonnull responseObject) {
            
            // [[VGPUI sharedInstance] showProfileEditController:completion];
            // [[VGPUI sharedInstance] showVerifyPhoneController:completion];
            
        } failure:^(NSError * _Nonnull error) {
            [[VGPUI sharedInstance] showWelcomeController:completion];
        }];
    }
}
- (void)purchase:(NSString *_Nonnull)characterID serverID:(NSString *_Nonnull)serverID itemID:(NSString *_Nonnull)itemID andPartnerData:(NSString *_Nullable)partnerData {
    
    // config chưa load xong
    if(VGP_CONFIG_LOADED == NO) return;
    // người dùng chưa đăng nhập
    if([VGPUserData getUserID] == 0) return;
    // cờ đang xử lý thanh toán được bật
    if(isPurchasing) return;
    
    // enable chế độ đang thanh toán, không cho touch tiếp
    isPurchasing = YES;
    [self hideFlyButton];
    
    characterIDPurchasing = characterID;
    serverIDPurchasing = serverID;
    itemIDPurchasing = itemID;
    partnerDataPurchasing = partnerData;
    
    [VGPAPI check:characterID andServerID:serverID andItemID:itemID andPartnerToken:partnerData success:^(id  _Nonnull responseObject) {
        self->isPurchasing = NO;
        [self showFlyButton];
        NSString *message = [responseObject objectForKey:@"message"];
        if(message) [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"notification"] message:message];
    } failure:^(NSError * _Nonnull error) {
        self->isPurchasing = NO;
        [self showFlyButton];
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
    }];
}
- (void)logoutGame {
    [self logoutGame:nil];
}
- (void)logoutGame:(void (^ __nullable)(void))completion {
    
    // cờ đang xử lý thanh toán được bật
    if(isPurchasing) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:@"Đang xử lý thanh toán, không thể đăng xuất!"];
        return;
    }
    
    if(VGP_CONFIG_LOADED == NO) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"notification"] message:[VGPHelper localizationForString:@"notification"]];
        return;
    }
    
    [VGPUserData clearUserData];
    [VGPHelper onLogoutSuccess];
}
- (void)showProfile {
    [self showProfile:nil];
}
- (void)showProfile:(void (^ __nullable)(void))completion {
    
    if(VGP_CONFIG_LOADED == NO) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"notification"] message:[VGPHelper localizationForString:@"notification"]];
        return;
    }
    
    if([VGPUserData getUserID] == 0) {
        [[VGPUI sharedInstance] showWelcomeController:completion];
    } else {
        [[VGPUI sharedInstance] showProfileController:completion];
    }
}
- (void)showFlyButton {
    if(VGP_CONFIG_LOADED == NO) return;
    [[[VGPUI sharedInstance] FlyButton] showButton];
}
- (void)hideFlyButton {
    [[[VGPUI sharedInstance] FlyButton] hideButton];
}

#pragma mark -  Marketing Events

- (void)setGameVersion:(NSString*)code {
    [VGPLogger setGameVersion:code];
}
- (void)setGameCode:(NSString*)code {
    [VGPLogger setGameCode:code];
}
- (void)startMobileTutorial {
    [[VGPLogger sharedInstance] tutorialBegin];
}
- (void)completeMobileTutorial {
    [[VGPLogger sharedInstance] tutorialComplete];
}
- (void)logLevelUp:(int) level {
    [[VGPLogger sharedInstance] characterLevelup:(int)level];
}
- (void)logCreatedCharacter {
    [[VGPLogger sharedInstance] characterCreated];
}
- (void)logUnlockAchievement:(int) vipLevel {
    [[VGPLogger sharedInstance] characterVipLevelup:vipLevel];
}
- (void)purchaseViewDisplay {
    [[VGPLogger sharedInstance] purchaseViewDisplay];
}
- (void)logUserHadPurchase {
    [[VGPLogger sharedInstance] userHadPurchase];
}
- (void)logPurchase:(int) money {
    [[VGPLogger sharedInstance] userPurchase:money];
    [self logUserHadPurchase];
}

- (void)resourceStartDownload {
    [[VGPLogger sharedInstance] resourceStartDownload];
}
- (void)resourceProcessDownload:(int)percent {
    [[VGPLogger sharedInstance] resourceProcessDownload:percent];
}
- (void)resourceDownloadSuccess {
    [[VGPLogger sharedInstance] resourceDownloadSuccess];
}
- (void)resourceDownloadError {
    [[VGPLogger sharedInstance] resourceDownloadError];
}

- (void)resourceStartUnpack {
    [[VGPLogger sharedInstance] resourceStartUnpack];
}
- (void)resourceUnpackSuccess {
    [[VGPLogger sharedInstance] resourceUnpackSuccess];
}
- (void)resourceUnpackError {
    [[VGPLogger sharedInstance] resourceUnpackError];
}

FBSDKSharingCallback *fbscb;
- (void)shareFacebookImage:(NSString *) url {
    NSURL *_url = [NSURL URLWithString:url];
    NSData * data = [NSData dataWithContentsOfURL:_url];
    UIImage * image = [UIImage imageWithData:data];
    if (image) {
        FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
        photo.image = image;
        FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
        content.photos = @[photo];
        
        FBSDKShareDialog *dialog = [[FBSDKShareDialog alloc] init];
        dialog.fromViewController = [VGPHelper topViewController];
        
        if(fbscb == nil) fbscb = [[FBSDKSharingCallback alloc] init];
        dialog.delegate = fbscb;
        dialog.shareContent = content;
        dialog.mode = FBSDKShareDialogModeShareSheet;
        [dialog show];
    } else {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:@"share_facebook_error"];
    }
}

- (void)shareFacebookImageLocal:(UIImage *) image {
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = image;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];
    
    FBSDKShareDialog *dialog = [[FBSDKShareDialog alloc] init];
    dialog.fromViewController = [VGPHelper topViewController];
    
    if(fbscb == nil) fbscb = [[FBSDKSharingCallback alloc] init];
    dialog.delegate = fbscb;
    dialog.shareContent = content;
    dialog.mode = FBSDKShareDialogModeShareSheet;
    [dialog show];
}

#pragma mark -  Init Application

NSString *const kGCMMessageIDKey = @"gcm.message_id";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MyLog(@"didFinishLaunchingWithOptions");
    
    if([VGP_GAMEID length] == 0) return NO;
    
    [AppsFlyerTracker sharedTracker].appleAppID = VGP_APPS_FLYER_TRACKER_APPID;
    [AppsFlyerTracker sharedTracker].appsFlyerDevKey = VGP_APPS_FLYER_TRACKER_DEVKEY;
    [AppsFlyerTracker sharedTracker].delegate = self;
    [AppsFlyerTracker sharedTracker].isDebug = false;
    
    [FIRApp configure];
    [FIRMessaging messaging].delegate = self;
    
    MyLog(@"AppsFlyerTracker inited with ID: \"%@\"", [AppsFlyerTracker sharedTracker].appleAppID);
    MyLog(@"FIREBASE inited with client id: \"%@\"", [[FIRApp defaultApp].options clientID]);
    
    if (@available(iOS 10.0, *)) {
        // iOS 10 or later
        // For iOS 10 display notification (sent via APNS)
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
        UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if(error) MyLog(@"error %@", error);
        }];
    } else {
        // iOS 10 notifications aren't available; fall back to iOS 8-9 notifications.
        UIUserNotificationType allNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    [application registerForRemoteNotifications];
    
    // load vgp config
    [VGPAPI getServerInfo];
    
    // IAP callback
    [[SKPaymentQueue defaultQueue] addTransactionObserver:[VGPIAPHelper sharedInstance]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(IAPHelperProductPurchasedNotification:) name:IAPHelperProductPurchasedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(IAPHelperProductPurchasedFailNotification:) name:IAPHelperProductPurchasedFailNotification object:nil];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[AppsFlyerTracker sharedTracker] trackAppLaunch];
    [FIRAnalytics logEventWithName:kFIREventAppOpen parameters:nil];
    [FBSDKAppEvents activateApp];
}
- (void)applicationWillResignActive:(UIApplication *)application {
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    [[AppsFlyerTracker sharedTracker] handleOpenUrl:url options:nil];
    return YES;
}
// Open URI-scheme for iOS 9 and above
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    //[[AppsFlyerTracker sharedTracker] handleOpenUrl:url options:options];
    return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
  ];
}
// Open URI-scheme for iOS 8 and below
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString*)sourceApplication annotation:(id)annotation {
    [[AppsFlyerTracker sharedTracker] handleOpenURL:url sourceApplication:sourceApplication withAnnotation:annotation];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

// Open Universal Links
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    [[AppsFlyerTracker sharedTracker] continueUserActivity:userActivity restorationHandler:restorationHandler];
    return YES;
}

- (void)application:(UIApplication *_Nonnull)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation {
    VGP_SCREEN_WIDTH = [VGPHelper getScreenWidth];
    VGP_SCREEN_HEIGHT = [VGPHelper getScreenHeight];
    [[[VGPUI sharedInstance] FlyButton] reFrame];
    [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_UPDATE_LAYOUT object:nil userInfo:nil];
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts  API_AVAILABLE(ios(13.0)) {
    UIOpenURLContext *openURLContext = URLContexts.allObjects.firstObject;
    if (openURLContext) {
        [[AppsFlyerTracker sharedTracker] handleOpenUrl:openURLContext.URL options:nil];
        
        [[FBSDKApplicationDelegate sharedInstance] application:UIApplication.sharedApplication openURL:openURLContext.URL sourceApplication:openURLContext.options.sourceApplication annotation:openURLContext.options.annotation];
    }
}

- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity  API_AVAILABLE(ios(13.0)) {
    [[AppsFlyerTracker sharedTracker]continueUserActivity:userActivity restorationHandler:nil];
}

#pragma mark -  Register Push notification

// [START receive_message]
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];

    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }

    // Print full message.
    NSLog(@"%@", userInfo);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
    fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];

    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }

    // Print full message.
    NSLog(@"%@", userInfo);

    completionHandler(UIBackgroundFetchResultNewData);
}
// [END receive_message]

// [START ios_10_message_handling]
// Receive displayed notifications for iOS 10 devices.
// Handle incoming notification messages while app is in the foreground.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler  API_AVAILABLE(ios(10.0)) {
  NSDictionary *userInfo = notification.request.content.userInfo;

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];

    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }

    // Print full message.
    NSLog(@"%@", userInfo);

    // Change this to your preferred presentation option
    completionHandler(UNNotificationPresentationOptionNone);
}

// Handle notification messages after display notification is tapped by the user.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void(^)(void))completionHandler  API_AVAILABLE(ios(10.0)) {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if (userInfo[kGCMMessageIDKey]) {
        NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }

    // Print full message.
    NSLog(@"%@", userInfo);

    completionHandler();
}

// [END ios_10_message_handling]

// [START refresh_token]
- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
    NSLog(@"FCM registration token: %@", fcmToken);
    // Notify about received token.
    NSDictionary *dataDict = [NSDictionary dictionaryWithObject:fcmToken forKey:@"token"];
    [[NSNotificationCenter defaultCenter] postNotificationName:
     @"FCMToken" object:nil userInfo:dataDict];
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
    [[FIRMessaging messaging] subscribeToTopic:[NSString stringWithFormat:@"news%@", VGP_GAMEID] completion:^(NSError * _Nullable error) {
        MyLog(@"Subscribed to topic %@", [NSString stringWithFormat:@"news%@", VGP_GAMEID]);
    }];
}
// [END refresh_token]

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    [FIRMessaging messaging].APNSToken = deviceToken;
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    MyLog(@"Failed to get token, error: %@", error);
}

#pragma mark -  AppsFlyerTrackerDelegate methods

- (void)onConversionDataReceived {
    
}
/**
 `conversionInfo` contains information about install.
 Organic/non-organic, etc.
 @param conversionInfo May contain <code>null</code> values for some keys. Please handle this case.
 */
- (void)onConversionDataSuccess:(NSDictionary *)conversionInfo {
    id status = [conversionInfo objectForKey:@"af_status"];
    if([status isEqualToString:@"Non-organic"]) {
        id sourceID = [conversionInfo objectForKey:@"media_source"];
        id campaign = [conversionInfo objectForKey:@"campaign"];
        [VGPDeviceData setSourceID:sourceID];
        [VGPDeviceData setCampaign:campaign];
        MyLog(@"This is a none organic install. Media source: %@  Campaign: %@", sourceID, campaign);
    } else if([status isEqualToString:@"Organic"]) {
        // MyLog(@"This is an organic install.");
    }
}

/**
 Any errors that occurred during the conversion request.
 */
- (void)onConversionDataFail:(NSError *)error {
    MyLog(@"Failed to get data from AppsFlyer's server: %@", [error localizedDescription]);
}

/**
 Support for scene delegate
 */
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options API_AVAILABLE(ios(13)) {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

#pragma mark - Notification IAP

- (void)IAPHelperProductPurchasedNotification:(NSNotification *)notification {
    NSURL *receiptURL = [[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receipt = [NSData dataWithContentsOfURL:receiptURL];
    
    if (!receipt) {
        isPurchasing = NO;
        [self showFlyButton];
        MyLog(@"recept %@", receipt);
    } else {
        NSString *receiptData = [receipt base64EncodedStringWithOptions:0];
        MyLog(@"receiptData %@", receiptData);
        
        // trường hợp restore purchase
        if(characterIDPurchasing == nil || serverIDPurchasing == nil || itemIDPurchasing == nil) {
            self->isPurchasing = NO;
            [self showFlyButton];
        } else {
            [VGPAPI iap:characterIDPurchasing andServerID:serverIDPurchasing andItemID:itemIDPurchasing andPartnerToken:partnerDataPurchasing andReceiptData:receiptData success:^(id  _Nonnull responseObject) {
                self->isPurchasing = NO;
                [self showFlyButton];
            } failure:^(NSError * _Nonnull error) {
                self->isPurchasing = NO;
                [self showFlyButton];
                [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
            }];
        }
    }
}

-(void)IAPHelperProductPurchasedFailNotification:(NSNotification *)notification
{
    isPurchasing = NO;
    [self showFlyButton];
}

@end
