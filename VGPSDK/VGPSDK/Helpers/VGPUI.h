//
//  VGPUI.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/5/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VGPHelper.h"
#import "FlyButton.h"
#import "WelcomeController.h"
#import "LoginNormalController.h"
#import "RegisterController.h"
#import "ForgotController.h"
#import "ProfileController.h"
#import "ProfileEditController.h";
#import "ProtectController.h"

NS_ASSUME_NONNULL_BEGIN

#define VGP_MAIN_TEXT_COLOR [UIColor colorWithRed:(232/255.0) green:(141/255.0) blue:(80/255.0) alpha:1]

@interface VGPUI : NSObject

+ (VGPUI *)sharedInstance;

#pragma mark UI
- (FlyButton *) FlyButton;
- (WelcomeController *)WelcomeViewController;
- (LoginNormalController *)LoginNormalController;
- (RegisterController *)RegisterController;
- (ForgotController *)ForgotController;
- (ProfileController *)ProfileController;
- (ProfileEditController *)ProfileEditController;
- (ProtectController *)ProtectController;

#pragma mark Events
- (void)dismiss;
- (void)dismiss:(void (^ __nullable)(void))completion;
- (void)showWelcomeViewController;
- (void)showWelcomeViewController:(void (^ __nullable)(void))completion;
- (void)showLoginNormalController;
- (void)showLoginNormalController:(void (^ __nullable)(void))completion;
- (void)showRegisterController;
- (void)showRegisterController:(void (^ __nullable)(void))completion;
- (void)showForgotController;
- (void)showForgotController:(void (^ __nullable)(void))completion;
- (void)showProfileController;
- (void)showProfileController:(void (^ __nullable)(void))completion;
- (void)showProfileEditController;
- (void)showProfileEditController:(void (^ __nullable)(void))completion;
- (void)showProtectController;
- (void)showProtectController:(void (^ __nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END