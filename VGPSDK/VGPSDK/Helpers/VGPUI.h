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
#import "ForgotPhoneController.h"
#import "ProfileController.h"
#import "ProfileEditController.h"
#import "VerifyPhoneController.h"
#import "InitAccountController.h"
#import "ProtectAccountController.h"
#import "ChangePasswordController.h"

NS_ASSUME_NONNULL_BEGIN

#define DIS_MOVE_POPUP      -40

@interface VGPUI : NSObject

+ (VGPUI *)sharedInstance;

#pragma mark -  Global
- (FlyButton *) FlyButton;

#pragma mark -  UI
- (WelcomeController *)WelcomeViewController;
- (LoginNormalController *)LoginNormalController;
- (RegisterController *)RegisterController;
- (ForgotController *)ForgotController;
- (ForgotPhoneController *)ForgotPhoneController;
- (ProfileController *)ProfileController;
- (ProfileEditController *)ProfileEditController;
- (VerifyPhoneController *)VerifyPhoneController;
- (InitAccountController *)InitAccountController;
- (ProtectAccountController *)ProtectAccountController;
- (ChangePasswordController *)ChangePasswordController;

#pragma mark -  Events
- (void)dismiss;
- (void)dismiss:(void (^ __nullable)(void))completion;
- (void)showWelcomeController;
- (void)showWelcomeController:(void (^ __nullable)(void))completion;
- (void)showLoginNormalController;
- (void)showLoginNormalController:(void (^ __nullable)(void))completion;
- (void)showRegisterController;
- (void)showRegisterController:(void (^ __nullable)(void))completion;
- (void)showForgotController;
- (void)showForgotController:(void (^ __nullable)(void))completion;
- (void)showForgotPhoneController;
- (void)showForgotPhoneController:(void (^ __nullable)(void))completion;
- (void)showProfileController;
- (void)showProfileController:(void (^ __nullable)(void))completion;
- (void)showProfileEditController;
- (void)showProfileEditController:(void (^ __nullable)(void))completion;
- (void)showVerifyPhoneController;
- (void)showVerifyPhoneController:(void (^ __nullable)(void))completion;
- (void)showInitAccountController;
- (void)showInitAccountController:(void (^ __nullable)(void))completion;
- (void)showProtectAccountController;
- (void)showProtectAccountController:(void (^ __nullable)(void))completion;
- (void)showChangePasswordController;
- (void)showChangePasswordController:(void (^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
