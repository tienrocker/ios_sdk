//
//  VGPUI.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/5/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPUI.h"

@interface VGPUI ()
{
    FlyButton *flyButton;
    UIViewController *mainViewController;
    WelcomeController *welcomeViewController;
    LoginNormalController *loginNormalController;
    RegisterController *registerController;
    ForgotController *forgotController;
    ForgotPhoneController *forgotPhoneController;
    ProfileController *profileController;
    ProfileEditController *profileEditController;
    ProtectController *protectController;
}

@end

@implementation VGPUI

static VGPUI *sharedController = nil;
+ (VGPUI *)sharedInstance {
    if (!sharedController) sharedController = [[VGPUI alloc] init];
    return sharedController;
}

#pragma mark UI
- (FlyButton *)FlyButton {
    if(flyButton == nil) flyButton = [FlyButton sharedInstance];
    return flyButton;
}
- (UIViewController *)MainViewController {
    return mainViewController;
}
- (WelcomeController *)WelcomeViewController {
    if(welcomeViewController == nil) welcomeViewController = [[WelcomeController alloc] init];
    return welcomeViewController;
}
- (LoginNormalController *)LoginNormalController {
    if(loginNormalController == nil) loginNormalController = [[LoginNormalController alloc] init];
    return loginNormalController;
}
- (RegisterController *)RegisterController {
    if(registerController == nil) registerController = [[RegisterController alloc] init];
    return registerController;
}
- (ForgotController *)ForgotController {
    if(forgotController == nil) forgotController = [[ForgotController alloc] init];
    return forgotController;
}
- (ForgotPhoneController *)ForgotPhoneController {
    if(forgotPhoneController == nil) forgotPhoneController = [[ForgotPhoneController alloc] init];
    return forgotPhoneController;
}
- (ProfileController *)ProfileController {
    if(profileController == nil) profileController = [[ProfileController alloc] init];
    return profileController;
}
- (ProfileEditController *)ProfileEditController {
    if(profileEditController == nil) profileEditController = [[ProfileEditController alloc] init];
    return profileEditController;
}
- (ProtectController *)ProtectController {
    if(protectController == nil) protectController = [[ProtectController alloc] init];
    return protectController;
}

#pragma mark Events
- (void)dismiss {
    [self dismiss:nil];
}
- (void)dismiss:(void (^ __nullable)(void))completion {
    mainViewController = nil;
    [[[UIApplication sharedApplication] keyWindow].rootViewController dismissViewControllerAnimated:true completion:^{
        if (completion) completion();
    }];
}
- (void)showWelcomeViewController {
    [self showWelcomeViewController:nil];
}
- (void)showWelcomeViewController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] WelcomeViewController] animated:YES completion:completion];
}
- (void)showLoginNormalController {
    [self showLoginNormalController:nil];
}
- (void)showLoginNormalController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] LoginNormalController] animated:YES completion:completion];
}
- (void)showRegisterController {
    [self showRegisterController:nil];
}
- (void)showRegisterController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] RegisterController] animated:YES completion:completion];
}
- (void)showForgotController {
    [self showForgotController:nil];
}
- (void)showForgotController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ForgotController] animated:YES completion:completion];
}
- (void)showForgotPhoneController {
    [self showForgotPhoneController:nil];
}
- (void)showForgotPhoneController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ForgotPhoneController] animated:YES completion:completion];
}
- (void)showProfileController {
    [self showProfileController:nil];
}
- (void)showProfileController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ProfileController] animated:YES completion:completion];
}
- (void)showProfileEditController {
    [self showProfileEditController:nil];
}
- (void)showProfileEditController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ProfileEditController] animated:YES completion:completion];
}
- (void)showProtectController {
    [self showProtectController:nil];
}
- (void)showProtectController:(void (^ __nullable)(void))completion {
    [flyButton hideButton];
    if(mainViewController == nil) mainViewController = [VGPHelper topViewController];
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ProtectController] animated:YES completion:completion];
}

@end
