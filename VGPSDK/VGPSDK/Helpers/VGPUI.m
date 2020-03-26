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
    WelcomeController *welcomeViewController;
    LoginNormalController *loginNormalController;
    RegisterController *registerController;
    ForgotController *forgotController;
    ForgotPhoneController *forgotPhoneController;
    ProfileController *profileController;
    ProfileEditController *profileEditController;
    VerifyPhoneController *verifyPhoneControllerViewController;
    InitProfileController *initProfileController;
    LinkAccountController *linkAccountController;
}

@end

@implementation VGPUI

static VGPUI *sharedController = nil;
+ (VGPUI *)sharedInstance{
    if (!sharedController) sharedController = [[VGPUI alloc] init];
    return sharedController;
}

#pragma mark Global

- (FlyButton *)FlyButton{
    if(flyButton == nil) flyButton = [FlyButton sharedInstance];
    return flyButton;
}

#pragma mark UI

- (WelcomeController *)WelcomeViewController{
    if(welcomeViewController == nil) welcomeViewController = [[WelcomeController alloc] init];
    return welcomeViewController;
}
- (LoginNormalController *)LoginNormalController{
    if(loginNormalController == nil) loginNormalController = [[LoginNormalController alloc] init];
    return loginNormalController;
}
- (RegisterController *)RegisterController{
    if(registerController == nil) registerController = [[RegisterController alloc] init];
    return registerController;
}
- (ForgotController *)ForgotController{
    if(forgotController == nil) forgotController = [[ForgotController alloc] init];
    return forgotController;
}
- (ForgotPhoneController *)ForgotPhoneController{
    if(forgotPhoneController == nil) forgotPhoneController = [[ForgotPhoneController alloc] init];
    return forgotPhoneController;
}
- (ProfileController *)ProfileController{
    if(profileController == nil) profileController = [[ProfileController alloc] init];
    return profileController;
}
- (ProfileEditController *)ProfileEditController{
    if(profileEditController == nil) profileEditController = [[ProfileEditController alloc] init];
    return profileEditController;
}
- (VerifyPhoneController *)VerifyPhoneController{
    if(verifyPhoneControllerViewController == nil) verifyPhoneControllerViewController = [[VerifyPhoneController alloc] init];
    return verifyPhoneControllerViewController;
}
- (InitProfileController *)InitProfileController{
    if(initProfileController == nil) initProfileController = [[InitProfileController alloc] init];
    return initProfileController;
}
- (LinkAccountController *)LinkAccountController{
    if(linkAccountController == nil) linkAccountController = [[LinkAccountController alloc] init];
    return linkAccountController;
}

#pragma mark Events
- (void)dismiss{
    [self dismiss:nil];
}
- (void)dismiss:(void (^ __nullable)(void))completion{
    [[[VGPUI sharedInstance] FlyButton] showButton];
    UIViewController *topView = [[UIApplication sharedApplication] keyWindow].rootViewController;   
    if(topView.presentedViewController != nil) {
        [topView dismissViewControllerAnimated:NO completion:completion];
    } else {
        if(completion) completion();
    }
}
- (void)showWelcomeController{
    [self showWelcomeController:nil];
}
- (void)showWelcomeController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] WelcomeViewController] animated:YES completion:completion];
}
- (void)showLoginNormalController{
    [self showLoginNormalController:nil];
}
- (void)showLoginNormalController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] LoginNormalController] animated:YES completion:completion];
}
- (void)showRegisterController{
    [self showRegisterController:nil];
}
- (void)showRegisterController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] RegisterController] animated:YES completion:completion];
}
- (void)showForgotController{
    [self showForgotController:nil];
}
- (void)showForgotController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ForgotController] animated:YES completion:completion];
}
- (void)showForgotPhoneController{
    [self showForgotPhoneController:nil];
}
- (void)showForgotPhoneController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ForgotPhoneController] animated:YES completion:completion];
}
- (void)showProfileController{
    [self showProfileController:nil];
}
- (void)showProfileController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ProfileController] animated:YES completion:completion];
}
- (void)showProfileEditController{
    [self showProfileEditController:nil];
}
- (void)showProfileEditController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] ProfileEditController] animated:YES completion:completion];
}
- (void)showVerifyPhoneController{
    [self showVerifyPhoneController:nil];
}
- (void)showVerifyPhoneController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] VerifyPhoneController] animated:YES completion:completion];
}
- (void)showInitProfileController{
    [self showInitProfileController:nil];
}
- (void)showInitProfileController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] InitProfileController] animated:YES completion:completion];
}
- (void)showLinkAccountController{
    [self showLinkAccountController:nil];
}
- (void)showLinkAccountController:(void (^ __nullable)(void))completion{
    [[VGPHelper topViewController] presentViewController:[[VGPUI sharedInstance] LinkAccountController] animated:YES completion:completion];
}

@end
