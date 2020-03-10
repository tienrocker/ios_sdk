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
#import "ProtectController.h"

NS_ASSUME_NONNULL_BEGIN

#define VGP_MAIN_TEXT_COLOR [UIColor colorWithRed:(232/255.0) green:(141/255.0) blue:(80/255.0) alpha:1]
#define VGP_FONT_LABEL_10 [UIFont fontWithName:@"LexendDeca-Regular" size:10]
#define VGP_FONT_LABEL_13 [UIFont fontWithName:@"LexendDeca-Regular" size:13]
#define VGP_FONT_LABEL_15 [UIFont fontWithName:@"LexendDeca-Regular" size:15]
#define VGP_FONT_LABEL_20 [UIFont fontWithName:@"LexendDeca-Regular" size:20]
#define DIS_MOVE_POPUP      -40

@interface VGPUI : NSObject

+ (VGPUI *)sharedInstance;

#pragma mark UI
- (FlyButton *) FlyButton;
- (UIViewController *)MainViewController;
- (WelcomeController *)WelcomeViewController;
- (LoginNormalController *)LoginNormalController;
- (RegisterController *)RegisterController;
- (ForgotController *)ForgotController;
- (ForgotPhoneController *)ForgotPhoneController;
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
- (void)showForgotPhoneController;
- (void)showForgotPhoneController:(void (^ __nullable)(void))completion;
- (void)showProfileController;
- (void)showProfileController:(void (^ __nullable)(void))completion;
- (void)showProfileEditController;
- (void)showProfileEditController:(void (^ __nullable)(void))completion;
- (void)showProtectController;
- (void)showProtectController:(void (^ __nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END
