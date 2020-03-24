//
//  WelcomeController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "WelcomeController.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUI.h"
#import "UIData.h"
#import "VGPLogger.h"
#import "VGPAPI.h"
#import "VGPFBSDKLoginManager.h"

@interface WelcomeController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIImageView *leftPanelImage;
    UIButton *leftSupportButton;
    
    UIView *rightPanel;
    UIButton *rightPanelLoginNormal;
    UIButton *rightPanelLoginFacebook;
    UIButton *rightPanelLoginQuick;
    UIButton *rightPanelLoginApple;
    
    // ===================================

    // background
    NSLayoutConstraint *imgLayoutCenterXAnchor;
    NSLayoutConstraint *imgLayoutCenterYAnchor;
    NSLayoutConstraint *imgLayoutWidthAnchor;
    NSLayoutConstraint *imgLayoutHeightAnchor;

    // create layout
    NSLayoutConstraint *panelCenterXAnchor;
    NSLayoutConstraint *panelCenterYAnchor;
    NSLayoutConstraint *panelWidthAnchor;
    NSLayoutConstraint *panelHeightAnchor;

    // close button
    NSLayoutConstraint *rightCloseButtonRightAnchor;
    NSLayoutConstraint *rightCloseButtonTopAnchor;
    NSLayoutConstraint *rightCloseButtonWidthAnchor;
    NSLayoutConstraint *rightCloseButtonHeightAnchor;

    // ===================================

    // left
    NSLayoutConstraint *leftPanelLeftAnchor;
    NSLayoutConstraint *leftPanelCenterYAnchor;
    NSLayoutConstraint *leftPanelWidthAnchor;
    NSLayoutConstraint *leftPanelHeightAnchor;

    NSLayoutConstraint *leftPanelImageCenterXAnchor;
    NSLayoutConstraint *leftPanelImageTopAnchor;
    NSLayoutConstraint *leftPanelImageWidthAnchor;
    NSLayoutConstraint *leftPanelImageHeightAnchor;

    NSLayoutConstraint *leftSupportButtonCenterXAnchor;
    NSLayoutConstraint *leftSupportButtonTopAnchor;
    NSLayoutConstraint *leftSupportButtonWidthAnchor;
    NSLayoutConstraint *leftSupportButtonHeightAnchor;

    // right
    NSLayoutConstraint *rightPanelRightAnchor;
    NSLayoutConstraint *rightPanelCenterYAnchor;
    NSLayoutConstraint *rightPanelWidthAnchor;
    NSLayoutConstraint *rightPanelHeightAnchor;

    NSLayoutConstraint *rightPanelLoginNormalLeftAnchor;
    NSLayoutConstraint *rightPanelLoginNormalTopAnchor;
    NSLayoutConstraint *rightPanelLoginNormalWidthAnchor;
    NSLayoutConstraint *rightPanelLoginNormalHeightAnchor;

    NSLayoutConstraint *rightPanelLoginFacebookCenterXAnchor;
    NSLayoutConstraint *rightPanelLoginFacebookTopAnchor;
    NSLayoutConstraint *rightPanelLoginFacebookWidthAnchor;
    NSLayoutConstraint *rightPanelLoginFacebookHeightAnchor;

    NSLayoutConstraint *rightPanelLoginQuickCenterXAnchor;
    NSLayoutConstraint *rightPanelLoginQuickTopAnchor;
    NSLayoutConstraint *rightPanelLoginQuickWidthAnchor;
    NSLayoutConstraint *rightPanelLoginQuickHeightAnchor;

    NSLayoutConstraint *rightPanelLoginAppleCenterXAnchor;
    NSLayoutConstraint *rightPanelLoginAppleTopAnchor;
    NSLayoutConstraint *rightPanelLoginAppleWidthAnchor;
    NSLayoutConstraint *rightPanelLoginAppleHeightAnchor;
}

@end

@implementation WelcomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ===================================
    
    // background
    imgLayout = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"background" andType:@"tiff"]];
    imgLayout.layer.zPosition = 1;
    [self.view addSubview:imgLayout];
    
    // create layout
    panel = [[UIView alloc] init];
    panel.layer.zPosition = 2;
    [self.view addSubview:panel];
    
    // close button
    rightCloseButton = [[UIButton alloc] init];
    rightCloseButton.layer.zPosition = 3;
    [rightCloseButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-close" andType:@"tiff"] forState:UIControlStateNormal];
    [self.view addSubview:rightCloseButton];
    
    // ===================================
    
    // left
    leftPanel = [[UIView alloc] init];
    [panel addSubview:leftPanel];
    
    leftPanelImage = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"img" andType:@"tiff"]];
    [leftPanel addSubview:leftPanelImage];
    
    leftSupportButton = [[UIButton alloc] init];
    [leftSupportButton setImage:[VGPHelper getUIImageWithImageName:@"btn-support" andType:@"tiff"] forState:UIControlStateNormal];
    [leftPanel addSubview:leftSupportButton];
    
    // right
    rightPanel = [[UIView alloc] init];
    [panel addSubview:rightPanel];
    
    rightPanelLoginNormal = [[UIButton alloc] init];
    [rightPanelLoginNormal setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-vgp" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginNormal setTitle:[VGPHelper localizationForString:@"login.right.normal"] forState:UIControlStateNormal];
    [rightPanelLoginNormal setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginNormal.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginNormal.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginNormal.titleLabel.minimumScaleFactor = .7;
    rightPanelLoginNormal.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginNormal];
    
    rightPanelLoginFacebook = [[UIButton alloc] init];
    [rightPanelLoginFacebook setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-facebook" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitle:[VGPHelper localizationForString:@"login.right.facebook"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginFacebook.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginFacebook.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginFacebook.titleLabel.minimumScaleFactor = .7;
    rightPanelLoginFacebook.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginFacebook];
    
    rightPanelLoginQuick = [[UIButton alloc] init];
    [rightPanelLoginQuick setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-quickplay" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitle:[VGPHelper localizationForString:@"login.right.quick"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginQuick.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginQuick.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginQuick.titleLabel.minimumScaleFactor = .7;
    rightPanelLoginQuick.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginQuick];
    
    rightPanelLoginApple = [[UIButton alloc] init];
    [rightPanelLoginApple setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-apple" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitle:[VGPHelper localizationForString:@"login.right.apple"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginApple.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginApple.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginApple.titleLabel.minimumScaleFactor = .7;
    rightPanelLoginApple.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginApple];
    
    // events
    [rightCloseButton addTarget:self action:@selector(rightCloseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [leftSupportButton addTarget:self action:@selector(leftSupportButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginNormal addTarget:self action:@selector(rightPanelLoginNormalClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginFacebook addTarget:self action:@selector(rightPanelLoginFacebookClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginQuick addTarget:self action:@selector(rightPanelLoginQuickClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginApple addTarget:self action:@selector(rightPanelLoginAppleClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {

    [super updateUI];
    CGFloat screenWidth = [VGPHelper getScreenWidth];
    // CGFloat screenHeight = [VGPHelper getScreenHeight];
    CGFloat width = LAYOUT_WIDTH < screenWidth ? LAYOUT_WIDTH : screenWidth - screenWidth * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    
    // ===================================

    // background
    imgLayout.translatesAutoresizingMaskIntoConstraints = NO;
    [imgLayoutCenterXAnchor setActive:NO];
    imgLayoutCenterXAnchor = [imgLayout.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    [imgLayoutCenterXAnchor setActive:YES];
    [imgLayoutCenterYAnchor setActive:NO];
    imgLayoutCenterYAnchor = [imgLayout.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    [imgLayoutCenterYAnchor setActive:YES];
    [imgLayoutWidthAnchor setActive:NO];
    imgLayoutWidthAnchor = [imgLayout.widthAnchor constraintEqualToConstant:width+width*0.04];
    [imgLayoutWidthAnchor setActive:YES];
    [imgLayoutHeightAnchor setActive:NO];
    imgLayoutHeightAnchor = [imgLayout.heightAnchor constraintEqualToConstant:height+width*0.04];
    [imgLayoutHeightAnchor setActive:YES];

    // create layout
    panel.translatesAutoresizingMaskIntoConstraints = NO;
    [panelCenterXAnchor setActive:NO];
    panelCenterXAnchor = [panel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    [panelCenterXAnchor setActive:YES];
    [panelCenterYAnchor setActive:NO];
    panelCenterYAnchor = [panel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    [panelCenterYAnchor setActive:YES];
    [panelWidthAnchor setActive:NO];
    panelWidthAnchor = [panel.widthAnchor constraintEqualToConstant:width];
    [panelWidthAnchor setActive:YES];
    [panelHeightAnchor setActive:NO];
    panelHeightAnchor = [panel.heightAnchor constraintEqualToConstant:height];
    [panelHeightAnchor setActive:YES];

    // close button
    rightCloseButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rightCloseButtonRightAnchor setActive:NO];
    rightCloseButtonRightAnchor = [rightCloseButton.rightAnchor constraintEqualToAnchor:panel.rightAnchor constant:width*0.04];
    [rightCloseButtonRightAnchor setActive:YES];
    [rightCloseButtonTopAnchor setActive:NO];
    rightCloseButtonTopAnchor = [rightCloseButton.topAnchor constraintEqualToAnchor:panel.topAnchor constant:-width*0.04];
    [rightCloseButtonTopAnchor setActive:YES];
    [rightCloseButtonWidthAnchor setActive:NO];
    rightCloseButtonWidthAnchor = [rightCloseButton.widthAnchor constraintEqualToConstant:width*0.08];
    [rightCloseButtonWidthAnchor setActive:YES];
    [rightCloseButtonHeightAnchor setActive:NO];
    rightCloseButtonHeightAnchor = [rightCloseButton.heightAnchor constraintEqualToConstant:width*0.08];
    [rightCloseButtonHeightAnchor setActive:YES];

    // ===================================

    // left
    leftPanel.translatesAutoresizingMaskIntoConstraints = NO;
    [leftPanelLeftAnchor setActive:NO];
    leftPanelLeftAnchor = [leftPanel.leftAnchor constraintEqualToAnchor:panel.leftAnchor];
    [leftPanelLeftAnchor setActive:YES];
    [leftPanelCenterYAnchor setActive:NO];
    leftPanelCenterYAnchor = [leftPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor];
    [leftPanelCenterYAnchor setActive:YES];
    [leftPanelWidthAnchor setActive:NO];
    leftPanelWidthAnchor = [leftPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.48];
    [leftPanelWidthAnchor setActive:YES];
    [leftPanelHeightAnchor setActive:NO];
    leftPanelHeightAnchor = [leftPanel.heightAnchor constraintEqualToAnchor:panel.heightAnchor];
    [leftPanelHeightAnchor setActive:YES];

    leftPanelImage.translatesAutoresizingMaskIntoConstraints = NO;
    [leftPanelImageCenterXAnchor setActive:NO];
    leftPanelImageCenterXAnchor = [leftPanelImage.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor];
    [leftPanelImageCenterXAnchor setActive:YES];
    [leftPanelImageTopAnchor setActive:NO];
    leftPanelImageTopAnchor = [leftPanelImage.topAnchor constraintEqualToAnchor:leftPanel.topAnchor constant:width*0.03];
    [leftPanelImageTopAnchor setActive:YES];
    [leftPanelImageWidthAnchor setActive:NO];
    leftPanelImageWidthAnchor = [leftPanelImage.widthAnchor constraintEqualToAnchor:leftPanel.widthAnchor multiplier:0.68f];
    [leftPanelImageWidthAnchor setActive:YES];
    [leftPanelImageHeightAnchor setActive:NO];
    leftPanelImageHeightAnchor = [leftPanelImage.heightAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1];
    [leftPanelImageHeightAnchor setActive:YES];

    leftSupportButton.translatesAutoresizingMaskIntoConstraints = NO;
    [leftSupportButtonCenterXAnchor setActive:NO];
    leftSupportButtonCenterXAnchor = [leftSupportButton.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor];
    [leftSupportButtonCenterXAnchor setActive:YES];
    [leftSupportButtonTopAnchor setActive:NO];
    leftSupportButtonTopAnchor = [leftSupportButton.topAnchor constraintEqualToAnchor:leftPanelImage.bottomAnchor constant:width*0.02];
    [leftSupportButtonTopAnchor setActive:YES];
    [leftSupportButtonWidthAnchor setActive:NO];
    leftSupportButtonWidthAnchor = [leftSupportButton.widthAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1];
    [leftSupportButtonWidthAnchor setActive:YES];
    [leftSupportButtonHeightAnchor setActive:NO];
    leftSupportButtonHeightAnchor = [leftSupportButton.heightAnchor constraintEqualToAnchor:leftSupportButton.widthAnchor multiplier:.25];
    [leftSupportButtonHeightAnchor setActive:YES];

    // right
    rightPanel.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelRightAnchor setActive:NO];
    rightPanelRightAnchor = [rightPanel.rightAnchor constraintEqualToAnchor:panel.rightAnchor];
    [rightPanelRightAnchor setActive:YES];
    [rightPanelCenterYAnchor setActive:NO];
    rightPanelCenterYAnchor = [rightPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor];
    [rightPanelCenterYAnchor setActive:YES];
    [rightPanelWidthAnchor setActive:NO];
    rightPanelWidthAnchor = [rightPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.52];
    [rightPanelWidthAnchor setActive:YES];
    [rightPanelHeightAnchor setActive:NO];
    rightPanelHeightAnchor = [rightPanel.heightAnchor constraintEqualToAnchor:leftPanel.heightAnchor];
    [rightPanelHeightAnchor setActive:YES];

    rightPanelLoginNormal.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, 0);
    rightPanelLoginNormal.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginNormalLeftAnchor setActive:NO];
    rightPanelLoginNormalLeftAnchor = [rightPanelLoginNormal.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    [rightPanelLoginNormalLeftAnchor setActive:YES];
    [rightPanelLoginNormalTopAnchor setActive:NO];
    rightPanelLoginNormalTopAnchor = [rightPanelLoginNormal.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.06];
    [rightPanelLoginNormalTopAnchor setActive:YES];
    [rightPanelLoginNormalWidthAnchor setActive:NO];
    rightPanelLoginNormalWidthAnchor = [rightPanelLoginNormal.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8];
    [rightPanelLoginNormalWidthAnchor setActive:YES];
    [rightPanelLoginNormalHeightAnchor setActive:NO];
    rightPanelLoginNormalHeightAnchor = [rightPanelLoginNormal.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelLoginNormalHeightAnchor setActive:YES];

    rightPanelLoginFacebook.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, 0);
    rightPanelLoginFacebook.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginFacebookCenterXAnchor setActive:NO];
    rightPanelLoginFacebookCenterXAnchor = [rightPanelLoginFacebook.centerXAnchor constraintEqualToAnchor:rightPanelLoginNormal.centerXAnchor];
    [rightPanelLoginFacebookCenterXAnchor setActive:YES];
    [rightPanelLoginFacebookTopAnchor setActive:NO];
    rightPanelLoginFacebookTopAnchor = [rightPanelLoginFacebook.topAnchor constraintEqualToAnchor:rightPanelLoginNormal.bottomAnchor constant:width*0.02];
    [rightPanelLoginFacebookTopAnchor setActive:YES];
    [rightPanelLoginFacebookWidthAnchor setActive:NO];
    rightPanelLoginFacebookWidthAnchor = [rightPanelLoginFacebook.widthAnchor constraintEqualToAnchor:rightPanelLoginNormal.widthAnchor multiplier:1];
    [rightPanelLoginFacebookWidthAnchor setActive:YES];
    [rightPanelLoginFacebookHeightAnchor setActive:NO];
    rightPanelLoginFacebookHeightAnchor = [rightPanelLoginFacebook.heightAnchor constraintEqualToAnchor:rightPanelLoginNormal.heightAnchor multiplier:1];
    [rightPanelLoginFacebookHeightAnchor setActive:YES];

    rightPanelLoginQuick.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, 0);
    rightPanelLoginQuick.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginQuickCenterXAnchor setActive:NO];
    rightPanelLoginQuickCenterXAnchor = [rightPanelLoginQuick.centerXAnchor constraintEqualToAnchor:rightPanelLoginFacebook.centerXAnchor];
    [rightPanelLoginQuickCenterXAnchor setActive:YES];
    [rightPanelLoginQuickTopAnchor setActive:NO];
    rightPanelLoginQuickTopAnchor = [rightPanelLoginQuick.topAnchor constraintEqualToAnchor:rightPanelLoginFacebook.bottomAnchor constant:width*0.02];
    [rightPanelLoginQuickTopAnchor setActive:YES];
    [rightPanelLoginQuickWidthAnchor setActive:NO];
    rightPanelLoginQuickWidthAnchor = [rightPanelLoginQuick.widthAnchor constraintEqualToAnchor:rightPanelLoginFacebook.widthAnchor multiplier:1];
    [rightPanelLoginQuickWidthAnchor setActive:YES];
    [rightPanelLoginQuickHeightAnchor setActive:NO];
    rightPanelLoginQuickHeightAnchor = [rightPanelLoginQuick.heightAnchor constraintEqualToAnchor:rightPanelLoginFacebook.heightAnchor multiplier:1];
    [rightPanelLoginQuickHeightAnchor setActive:YES];

    rightPanelLoginApple.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, 0);
    rightPanelLoginApple.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginAppleCenterXAnchor setActive:NO];
    rightPanelLoginAppleCenterXAnchor = [rightPanelLoginApple.centerXAnchor constraintEqualToAnchor:rightPanelLoginQuick.centerXAnchor];
    [rightPanelLoginAppleCenterXAnchor setActive:YES];
    [rightPanelLoginAppleTopAnchor setActive:NO];
    rightPanelLoginAppleTopAnchor = [rightPanelLoginApple.topAnchor constraintEqualToAnchor:rightPanelLoginQuick.bottomAnchor constant:width*0.02];
    [rightPanelLoginAppleTopAnchor setActive:YES];
    [rightPanelLoginAppleWidthAnchor setActive:NO];
    rightPanelLoginAppleWidthAnchor = [rightPanelLoginApple.widthAnchor constraintEqualToAnchor:rightPanelLoginQuick.widthAnchor multiplier:1];
    [rightPanelLoginAppleWidthAnchor setActive:YES];
    [rightPanelLoginAppleHeightAnchor setActive:NO];
    rightPanelLoginAppleHeightAnchor = [rightPanelLoginApple.heightAnchor constraintEqualToAnchor:rightPanelLoginQuick.heightAnchor multiplier:1];
    [rightPanelLoginAppleHeightAnchor setActive:YES];
}

- (void)updateUIText {
    [super updateUIText];
    [rightPanelLoginNormal setTitle:[VGPHelper localizationForString:@"login.right.normal"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitle:[VGPHelper localizationForString:@"login.right.facebook"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitle:[VGPHelper localizationForString:@"login.right.quick"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitle:[VGPHelper localizationForString:@"login.right.apple"] forState:UIControlStateNormal];
}

- (void)leftSupportButtonClick {
    MyLog(@"leftSupportButtonClick");
    if([[UIData getLocalization] isEqualToString:@"en"]){
        [VGPHelper changeLocalization:@"vi"];
    } else {
        [VGPHelper changeLocalization:@"en"];
    }
}

#pragma mark Sign in with VGP

- (void)rightPanelLoginNormalClick {
    [[VGPUI sharedInstance] showLoginNormalController:^{
        // @TODO: TEST UI
        [[VGPLogger sharedInstance] loginViewDisplay];
    }];
}

#pragma mark Sign in with Facebook

- (void)rightPanelLoginFacebookClick {
    [self showLoadingView];
    [[VGPLogger sharedInstance] loginFacebookClick];
    [[VGPFBSDKLoginManager sharedInstance] logOut];
    [[VGPFBSDKLoginManager sharedInstance] logInWithPermissions:@[@"public_profile", @"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult* result, NSError* error) {
        if (error) {
            [self hideLoadingView];
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        } else if (result.isCancelled) {
            [self hideLoadingView];
        } else {
            [self hideLoadingView];
            if([FBSDKAccessToken currentAccessToken])
            {
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"/me" parameters:@{@"fields":@"id,name,email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection* connection, id result, NSError* error)
                 {
                    if (!error) {
                        NSLog(@"Facebook fetched user:%@", result);
                        NSDictionary *data = (NSDictionary*)result;
                        // login with facebook
                        [VGPAPI facebookLogin:[data objectForKey:@"id"] success:^(id  _Nonnull responseObject) {
                        } failure:^(NSError * _Nonnull error) {
                            MyLog(@"%@", [error localizedDescription]);
                        }];
                    } else {
                        NSLog(@"Error on facebook graph");
                    }
                }];
            } else {
                NSLog(@"Error on facebook access_token");
            }
        }
    }];
}

#pragma mark Sign in with Device

- (void)rightPanelLoginQuickClick {
    [self showLoadingView];
    [[VGPLogger sharedInstance] loginQuickplayClick];
    [VGPAPI quickplayLogin:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
    } failure:^(NSError * _Nonnull error) {
        [self hideLoadingView];
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
    }];
}

#pragma mark Sign in with Apple

- (void)rightPanelLoginAppleClick {
    if (@available(iOS 13.0, *)) {
        [self showLoadingView];
        [[VGPLogger sharedInstance] loginAppleClick];
        ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc] init];
        ASAuthorizationAppleIDRequest *request = [appleIDProvider createRequest];
        request.requestedScopes = @[@"fullName", @"email"];
        
        ASAuthorizationController *authorizationController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
        authorizationController.delegate = self;
        authorizationController.presentationContextProvider = self;
        [authorizationController performRequests];
    } else {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"error.ios13.require"]];
    }
}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization NS_SWIFT_NAME(authorizationController(controller:didCompleteWithAuthorization:)) API_AVAILABLE(ios(13.0)){
    [self hideLoadingView];
    ASAuthorizationAppleIDCredential *appleIDCredential = authorization.credential;
    if(appleIDCredential && appleIDCredential.identityToken) {
        NSData *identityToken = appleIDCredential.identityToken;
        NSString *access_token = [identityToken base64EncodedStringWithOptions:0];
        [VGPAPI appleLogin:access_token success:^(id  _Nonnull responseObject) {
        } failure:^(NSError * _Nonnull error) {
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        }];
    }
}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error  NS_SWIFT_NAME(authorizationController(controller:didCompleteWithError:)) API_AVAILABLE(ios(13.0)){
    [self hideLoadingView];
    [[VGPLogger sharedInstance] loginError:@"apple"];
    [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[NSString stringWithFormat:[VGPHelper localizationForString:@"login.apple.error"], (long)[error code]]];
}

@end
