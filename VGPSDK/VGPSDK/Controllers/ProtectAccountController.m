//
//  ProtectAccountController.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/25/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ProtectAccountController.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUI.h"
#import "UIData.h"
#import "VGPAPI.h"
#import "VGPFBSDKLoginManager.h"

@interface ProtectAccountController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIImageView *leftPanelImage;
    UIButton *leftSupportButton;
    
    UIView *rightPanel;
    UILabel *rightPanelUsernameLabel;
    UIButton *rightPanelLinkFacebook;
    UIButton *rightPanelLinkQuick;
    UIButton *rightPanelLinkApple;
    UIButton *rightPanelInitVGPAccount;
    UIButton *rightPanelChangePassword;
    
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

    NSLayoutConstraint *leftBackButtonImgLeftAnchor;
    NSLayoutConstraint *leftBackButtonImgTopAnchor;
    NSLayoutConstraint *leftBackButtonImgWidthAnchor;
    NSLayoutConstraint *leftBackButtonImgHeightAnchor;

    NSLayoutConstraint *leftBackButtonTextLeftAnchor;
    NSLayoutConstraint *leftBackButtonTextTopAnchor;
    NSLayoutConstraint *leftBackButtonTextWidthAnchor;
    NSLayoutConstraint *leftBackButtonTextHeightAnchor;

    NSLayoutConstraint *leftSupportButtonCenterXAnchor;
    NSLayoutConstraint *leftSupportButtonTopAnchor;
    NSLayoutConstraint *leftSupportButtonWidthAnchor;
    NSLayoutConstraint *leftSupportButtonHeightAnchor;

    // right
    NSLayoutConstraint *rightPanelRightAnchor;
    NSLayoutConstraint *rightPanelCenterYAnchor;
    NSLayoutConstraint *rightPanelWidthAnchor;
    NSLayoutConstraint *rightPanelHeightAnchor;

    NSLayoutConstraint *rightPanelUsernameLabelLeftAnchor;
    NSLayoutConstraint *rightPanelUsernameLabelTopAnchor;
    NSLayoutConstraint *rightPanelUsernameLabelWidthAnchor;
    NSLayoutConstraint *rightPanelUsernameLabelHeightAnchor;

    NSLayoutConstraint *rightPanelLinkFacebookCenterXAnchor;
    NSLayoutConstraint *rightPanelLinkFacebookTopAnchor;
    NSLayoutConstraint *rightPanelLinkFacebookWidthAnchor;
    NSLayoutConstraint *rightPanelLinkFacebookHeightAnchor;

    NSLayoutConstraint *rightPanelLinkQuickCenterXAnchor;
    NSLayoutConstraint *rightPanelLinkQuickTopAnchor;
    NSLayoutConstraint *rightPanelLinkQuickWidthAnchor;
    NSLayoutConstraint *rightPanelLinkQuickHeightAnchor;
    
    NSLayoutConstraint *rightPanelLinkAppleCenterXAnchor;
    NSLayoutConstraint *rightPanelLinkAppleTopAnchor;
    NSLayoutConstraint *rightPanelLinkAppleWidthAnchor;
    NSLayoutConstraint *rightPanelLinkAppleHeightAnchor;
    
    NSLayoutConstraint *rightPanelInitVGPAccountCenterXAnchor;
    NSLayoutConstraint *rightPanelInitVGPAccountTopAnchor;
    NSLayoutConstraint *rightPanelInitVGPAccountWidthAnchor;
    NSLayoutConstraint *rightPanelInitVGPAccountHeightAnchor;
    
    NSLayoutConstraint *rightPanelChangePasswordCenterXAnchor;
    NSLayoutConstraint *rightPanelChangePasswordTopAnchor;
    NSLayoutConstraint *rightPanelChangePasswordWidthAnchor;
    NSLayoutConstraint *rightPanelChangePasswordHeightAnchor;
}

@end

@implementation ProtectAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ===================================
    
    // background
    imgLayout = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"background" andType:@"tiff"]];
    imgLayout.layer.zPosition = 1;
    [self.view addSubview:imgLayout];
    imgLayout.translatesAutoresizingMaskIntoConstraints = NO;
    
    // create layout
    panel = [[UIView alloc] init];
    panel.layer.zPosition = 2;
    [self.view addSubview:panel];
    panel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // close button
    rightCloseButton = [[UIButton alloc] init];
    rightCloseButton.layer.zPosition = 3;
    [rightCloseButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-close" andType:@"tiff"] forState:UIControlStateNormal];
    [self.view addSubview:rightCloseButton];
    rightCloseButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rightCloseButton addTarget:self action:@selector(rightCloseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // ===================================
    
    // left
    leftPanel = [[UIView alloc] init];
    [panel addSubview:leftPanel];
    leftPanel.translatesAutoresizingMaskIntoConstraints = NO;
    
    leftPanelImage = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"img" andType:@"tiff"]];
    [leftPanel addSubview:leftPanelImage];
    leftPanelImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    // left back image
    leftBackButtonImg = [[UIButton alloc] init];
    leftBackButtonImg.layer.zPosition = 3;
    [panel addSubview:leftBackButtonImg];
    leftBackButtonImg.translatesAutoresizingMaskIntoConstraints = NO;
    [leftBackButtonImg addTarget:self action:@selector(leftBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // left back text
    leftBackButtonText = [[UIButton alloc] init];
    leftBackButtonText.layer.zPosition = 3;
    [leftBackButtonText setTitleColor:VGP_MAIN_TEXT_COLOR forState:UIControlStateNormal];
    leftBackButtonText.titleLabel.adjustsFontSizeToFitWidth = YES;
    leftBackButtonText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [panel addSubview:leftBackButtonText];
    leftBackButtonText.translatesAutoresizingMaskIntoConstraints = NO;
    [leftBackButtonText addTarget:self action:@selector(leftBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    leftSupportButton = [[UIButton alloc] init];
    [leftPanel addSubview:leftSupportButton];
    leftSupportButton.translatesAutoresizingMaskIntoConstraints = NO;
    [leftSupportButton addTarget:self action:@selector(leftSupportButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // right
    rightPanel = [[UIView alloc] init];
    [panel addSubview:rightPanel];
    rightPanel.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelUsernameLabel = [[UILabel alloc] init];
    rightPanelUsernameLabel.textColor = VGP_MAIN_TEXT_COLOR;
    rightPanelUsernameLabel.numberOfLines = 0;
    rightPanelUsernameLabel.textAlignment = NSTextAlignmentCenter;
    [rightPanel addSubview:rightPanelUsernameLabel];
    rightPanelUsernameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelLinkFacebook = [[UIButton alloc] init];
    [rightPanel addSubview:rightPanelLinkFacebook];
    rightPanelLinkFacebook.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLinkFacebook addTarget:self action:@selector(rightPanelLinkFacebookClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelLinkQuick = [[UIButton alloc] init];
    [rightPanel addSubview:rightPanelLinkQuick];
    rightPanelLinkQuick.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLinkQuick addTarget:self action:@selector(rightPanelLinkQuickClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelLinkApple = [[UIButton alloc] init];
    [rightPanel addSubview:rightPanelLinkApple];
    rightPanelLinkApple.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLinkApple addTarget:self action:@selector(rightPanelLinkAppleClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelInitVGPAccount = [[UIButton alloc] init];
    [rightPanelInitVGPAccount setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelInitVGPAccount setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelInitVGPAccount.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelInitVGPAccount.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelInitVGPAccount];
    rightPanelInitVGPAccount.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelInitVGPAccount addTarget:self action:@selector(rightPanelInitVGPAccountClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelChangePassword = [[UIButton alloc] init];
    [rightPanelChangePassword setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelChangePassword setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelChangePassword.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelChangePassword.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelChangePassword];
    rightPanelChangePassword.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelChangePassword addTarget:self action:@selector(rightPanelChangePasswordClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {

    CGFloat width = LAYOUT_WIDTH < VGP_SCREEN_WIDTH ? LAYOUT_WIDTH : VGP_SCREEN_WIDTH - VGP_SCREEN_WIDTH * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    CGFloat padding = width * 0.02;
    
    // ===================================

    // background
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
    
    
    [leftBackButtonImgLeftAnchor setActive:NO];
    leftBackButtonImgLeftAnchor = [leftBackButtonImg.leftAnchor constraintEqualToAnchor:panel.leftAnchor constant:padding];
    [leftBackButtonImgLeftAnchor setActive:YES];
    [leftBackButtonImgTopAnchor setActive:NO];
    leftBackButtonImgTopAnchor = [leftBackButtonImg.topAnchor constraintEqualToAnchor:panel.topAnchor constant:padding];
    [leftBackButtonImgTopAnchor setActive:YES];
    [leftBackButtonImgWidthAnchor setActive:NO];
    leftBackButtonImgWidthAnchor = [leftBackButtonImg.widthAnchor constraintEqualToConstant:width*.03];
    [leftBackButtonImgWidthAnchor setActive:YES];
    [leftBackButtonImgHeightAnchor setActive:NO];
    leftBackButtonImgHeightAnchor = [leftBackButtonImg.heightAnchor constraintEqualToConstant:width*.04];
    [leftBackButtonImgHeightAnchor setActive:YES];
    
    
    [leftBackButtonTextTopAnchor setActive:NO];
    leftBackButtonTextTopAnchor = [leftBackButtonText.topAnchor constraintEqualToAnchor:leftBackButtonImg.topAnchor constant:0];
    [leftBackButtonTextTopAnchor setActive:YES];
    [leftBackButtonTextLeftAnchor setActive:NO];
    leftBackButtonTextLeftAnchor = [leftBackButtonText.leftAnchor constraintEqualToAnchor:leftBackButtonImg.rightAnchor constant:0];
    [leftBackButtonTextLeftAnchor setActive:YES];
    [leftBackButtonTextWidthAnchor setActive:NO];
    leftBackButtonTextWidthAnchor = [leftBackButtonText.widthAnchor constraintEqualToConstant:width*.5];
    [leftBackButtonTextWidthAnchor setActive:YES];
    [leftBackButtonTextHeightAnchor setActive:NO];
    leftBackButtonTextHeightAnchor = [leftBackButtonText.heightAnchor constraintEqualToAnchor:leftBackButtonImg.heightAnchor multiplier:1];
    [leftBackButtonTextHeightAnchor setActive:YES];
    
    
    [leftSupportButtonCenterXAnchor setActive:NO];
    leftSupportButtonCenterXAnchor = [leftSupportButton.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor];
    [leftSupportButtonCenterXAnchor setActive:YES];
    [leftSupportButtonTopAnchor setActive:NO];
    leftSupportButtonTopAnchor = [leftSupportButton.topAnchor constraintEqualToAnchor:leftPanelImage.bottomAnchor constant:padding];
    [leftSupportButtonTopAnchor setActive:YES];
    [leftSupportButtonWidthAnchor setActive:NO];
    leftSupportButtonWidthAnchor = [leftSupportButton.widthAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1];
    [leftSupportButtonWidthAnchor setActive:YES];
    [leftSupportButtonHeightAnchor setActive:NO];
    leftSupportButtonHeightAnchor = [leftSupportButton.heightAnchor constraintEqualToAnchor:leftSupportButton.widthAnchor multiplier:.25];
    [leftSupportButtonHeightAnchor setActive:YES];

    // right
    [rightPanelRightAnchor setActive:NO];
    [rightPanelCenterYAnchor setActive:NO];
    [rightPanelWidthAnchor setActive:NO];
    [rightPanelHeightAnchor setActive:NO];
    rightPanelRightAnchor = [rightPanel.rightAnchor constraintEqualToAnchor:panel.rightAnchor];
    rightPanelCenterYAnchor = [rightPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor];
    rightPanelWidthAnchor = [rightPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.52];
    rightPanelHeightAnchor = [rightPanel.heightAnchor constraintEqualToAnchor:leftPanel.heightAnchor];
    [rightPanelRightAnchor setActive:YES];
    [rightPanelCenterYAnchor setActive:YES];
    [rightPanelWidthAnchor setActive:YES];
    [rightPanelHeightAnchor setActive:YES];
    
    [rightPanelUsernameLabelLeftAnchor setActive:NO];
    [rightPanelUsernameLabelTopAnchor setActive:NO];
    [rightPanelUsernameLabelWidthAnchor setActive:NO];
    [rightPanelUsernameLabelHeightAnchor setActive:NO];
    rightPanelUsernameLabelLeftAnchor = [rightPanelUsernameLabel.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelUsernameLabelTopAnchor = [rightPanelUsernameLabel.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.03];
    rightPanelUsernameLabelWidthAnchor = [rightPanelUsernameLabel.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8];
    rightPanelUsernameLabelHeightAnchor = [rightPanelUsernameLabel.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelUsernameLabelLeftAnchor setActive:YES];
    [rightPanelUsernameLabelTopAnchor setActive:YES];
    [rightPanelUsernameLabelWidthAnchor setActive:YES];
    [rightPanelUsernameLabelHeightAnchor setActive:YES];
    
    [rightPanelLinkFacebookCenterXAnchor setActive:NO];
    [rightPanelLinkFacebookTopAnchor setActive:NO];
    [rightPanelLinkFacebookWidthAnchor setActive:NO];
    [rightPanelLinkFacebookHeightAnchor setActive:NO];
    rightPanelLinkFacebookCenterXAnchor = [rightPanelLinkFacebook.centerXAnchor constraintEqualToAnchor:rightPanelUsernameLabel.centerXAnchor];
    rightPanelLinkFacebookTopAnchor = [rightPanelLinkFacebook.topAnchor constraintEqualToAnchor:rightPanelUsernameLabel.bottomAnchor constant:padding];
    rightPanelLinkFacebookWidthAnchor = [rightPanelLinkFacebook.widthAnchor constraintEqualToAnchor:rightPanelUsernameLabel.widthAnchor multiplier:1];
    rightPanelLinkFacebookHeightAnchor = [rightPanelLinkFacebook.heightAnchor constraintEqualToAnchor:rightPanelLinkFacebook.widthAnchor multiplier:.16];
    [rightPanelLinkFacebookCenterXAnchor setActive:YES];
    [rightPanelLinkFacebookTopAnchor setActive:YES];
    [rightPanelLinkFacebookWidthAnchor setActive:YES];
    [rightPanelLinkFacebookHeightAnchor setActive:YES];
    
    [rightPanelLinkQuickCenterXAnchor setActive:NO];
    [rightPanelLinkQuickTopAnchor setActive:NO];
    [rightPanelLinkQuickWidthAnchor setActive:NO];
    [rightPanelLinkQuickHeightAnchor setActive:NO];
    rightPanelLinkQuickCenterXAnchor = [rightPanelLinkQuick.centerXAnchor constraintEqualToAnchor:rightPanelLinkFacebook.centerXAnchor];
    rightPanelLinkQuickTopAnchor = [rightPanelLinkQuick.topAnchor constraintEqualToAnchor:rightPanelLinkFacebook.bottomAnchor constant:padding];
    rightPanelLinkQuickWidthAnchor = [rightPanelLinkQuick.widthAnchor constraintEqualToAnchor:rightPanelLinkFacebook.widthAnchor multiplier:1];
    rightPanelLinkQuickHeightAnchor = [rightPanelLinkQuick.heightAnchor constraintEqualToAnchor:rightPanelLinkFacebook.heightAnchor multiplier:1];
    [rightPanelLinkQuickCenterXAnchor setActive:YES];
    [rightPanelLinkQuickTopAnchor setActive:YES];
    [rightPanelLinkQuickWidthAnchor setActive:YES];
    [rightPanelLinkQuickHeightAnchor setActive:YES];
    
    [rightPanelLinkAppleCenterXAnchor setActive:NO];
    [rightPanelLinkAppleTopAnchor setActive:NO];
    [rightPanelLinkAppleWidthAnchor setActive:NO];
    [rightPanelLinkAppleHeightAnchor setActive:NO];
    rightPanelLinkAppleCenterXAnchor = [rightPanelLinkApple.centerXAnchor constraintEqualToAnchor:rightPanelLinkQuick.centerXAnchor];
    rightPanelLinkAppleTopAnchor = [rightPanelLinkApple.topAnchor constraintEqualToAnchor:rightPanelLinkQuick.bottomAnchor constant:padding];
    rightPanelLinkAppleWidthAnchor = [rightPanelLinkApple.widthAnchor constraintEqualToAnchor:rightPanelLinkQuick.widthAnchor multiplier:1];
    rightPanelLinkAppleHeightAnchor = [rightPanelLinkApple.heightAnchor constraintEqualToAnchor:rightPanelLinkQuick.heightAnchor multiplier:1];
    [rightPanelLinkAppleCenterXAnchor setActive:YES];
    [rightPanelLinkAppleTopAnchor setActive:YES];
    [rightPanelLinkAppleWidthAnchor setActive:YES];
    [rightPanelLinkAppleHeightAnchor setActive:YES];
    
    MyLog(@"[VGPUserData getCanUpdateUsername] %@", [VGPUserData getCanUpdateUsername] ? @"YES" : @"NO");
    if([VGPUserData getCanUpdateUsername]) {
        rightPanelInitVGPAccount.hidden = NO;
        rightPanelChangePassword.hidden = YES;
        [rightPanelInitVGPAccountCenterXAnchor setActive:NO];
        [rightPanelInitVGPAccountTopAnchor setActive:NO];
        [rightPanelInitVGPAccountWidthAnchor setActive:NO];
        [rightPanelInitVGPAccountHeightAnchor setActive:NO];
        rightPanelInitVGPAccountCenterXAnchor = [rightPanelInitVGPAccount.centerXAnchor constraintEqualToAnchor:rightPanelLinkQuick.centerXAnchor];
        rightPanelInitVGPAccountTopAnchor = [rightPanelInitVGPAccount.topAnchor constraintEqualToAnchor:rightPanelLinkApple.bottomAnchor constant:padding];
        rightPanelInitVGPAccountWidthAnchor = [rightPanelInitVGPAccount.widthAnchor constraintEqualToAnchor:rightPanelLinkQuick.widthAnchor multiplier:1];
        rightPanelInitVGPAccountHeightAnchor = [rightPanelInitVGPAccount.heightAnchor constraintEqualToAnchor:rightPanelLinkQuick.heightAnchor multiplier:1];
        [rightPanelInitVGPAccountCenterXAnchor setActive:YES];
        [rightPanelInitVGPAccountTopAnchor setActive:YES];
        [rightPanelInitVGPAccountWidthAnchor setActive:YES];
        [rightPanelInitVGPAccountHeightAnchor setActive:YES];
    } else {
        rightPanelInitVGPAccount.hidden = YES;
        rightPanelChangePassword.hidden = NO;
        [rightPanelChangePasswordCenterXAnchor setActive:NO];
        [rightPanelChangePasswordTopAnchor setActive:NO];
        [rightPanelChangePasswordWidthAnchor setActive:NO];
        [rightPanelChangePasswordHeightAnchor setActive:NO];
        rightPanelChangePasswordCenterXAnchor = [rightPanelChangePassword.centerXAnchor constraintEqualToAnchor:rightPanelLinkQuick.centerXAnchor];
        rightPanelChangePasswordTopAnchor = [rightPanelChangePassword.topAnchor constraintEqualToAnchor:rightPanelLinkApple.bottomAnchor constant:padding];
        rightPanelChangePasswordWidthAnchor = [rightPanelChangePassword.widthAnchor constraintEqualToAnchor:rightPanelLinkQuick.widthAnchor multiplier:1];
        rightPanelChangePasswordHeightAnchor = [rightPanelChangePassword.heightAnchor constraintEqualToAnchor:rightPanelLinkQuick.heightAnchor multiplier:1];
        [rightPanelChangePasswordCenterXAnchor setActive:YES];
        [rightPanelChangePasswordTopAnchor setActive:YES];
        [rightPanelChangePasswordWidthAnchor setActive:YES];
        [rightPanelChangePasswordHeightAnchor setActive:YES];
    }
    
    // iphone SE
    if(VGP_SCREEN_WIDTH <= 320) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_10];
        rightPanelUsernameLabel.font = VGP_FONT_LABEL_13;
        [rightPanelInitVGPAccount.titleLabel setFont:VGP_FONT_LABEL_10];
        [rightPanelChangePassword.titleLabel setFont:VGP_FONT_LABEL_10];
    }
    // iphone 6 - 6s - 7 - 8 - X
    else if(VGP_SCREEN_WIDTH > 320 && VGP_SCREEN_WIDTH <= 375) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
        rightPanelUsernameLabel.font = VGP_FONT_LABEL_15;
        [rightPanelInitVGPAccount.titleLabel setFont:VGP_FONT_LABEL_13];
        [rightPanelChangePassword.titleLabel setFont:VGP_FONT_LABEL_13];
    }
    // iphone 7+ - 8+
    else if(VGP_SCREEN_WIDTH > 375 && VGP_SCREEN_WIDTH <= 414) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
        rightPanelUsernameLabel.font = VGP_FONT_LABEL_20;
        [rightPanelInitVGPAccount.titleLabel setFont:VGP_FONT_LABEL_15];
        [rightPanelChangePassword.titleLabel setFont:VGP_FONT_LABEL_15];
    }
    else {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
        rightPanelUsernameLabel.font = VGP_FONT_LABEL_20;
        [rightPanelInitVGPAccount.titleLabel setFont:VGP_FONT_LABEL_15];
        [rightPanelChangePassword.titleLabel setFont:VGP_FONT_LABEL_15];
    }
}

- (void)updateUIText {
    
    [leftBackButtonImg setImage:[VGPHelper getUIImageWithImageName:@"btn-back" andType:@"tiff"] forState:UIControlStateNormal];
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    [leftSupportButton setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-support-%@", [UIData getLocalization]] andType:@"tiff"] forState:UIControlStateNormal];
    
    rightPanelUsernameLabel.text = [VGPUserData getUsername];
    
    NSString *lang = [UIData getLocalization];
    if([VGPUserData getIsConnectFacebook])
        [rightPanelLinkFacebook setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-facebook-linked-%@", lang] andType:@"tiff"] forState:UIControlStateNormal];
    else
        [rightPanelLinkFacebook setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-facebook-%@", lang] andType:@"tiff"] forState:UIControlStateNormal];
    
    if([VGPUserData getIsConnectQuickplay])
        [rightPanelLinkQuick setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-quickplay-linked-%@", lang] andType:@"tiff"] forState:UIControlStateNormal];
    else
        [rightPanelLinkQuick setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-quickplay-%@", lang] andType:@"tiff"] forState:UIControlStateNormal];
    
    if([VGPUserData getIsConnectApple])
        [rightPanelLinkApple setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-apple-linked-%@", lang] andType:@"tiff"] forState:UIControlStateNormal];
    else
        [rightPanelLinkApple setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-apple-%@", lang] andType:@"tiff"] forState:UIControlStateNormal];
    
    [rightPanelInitVGPAccount setTitle:[VGPHelper localizationForString:@"profile.init.account"] forState:UIControlStateNormal];
    [rightPanelChangePassword setTitle:[VGPHelper localizationForString:@"profile.change.password"] forState:UIControlStateNormal];
}

#pragma mark -  Link with Facebook

- (void)rightPanelLinkFacebookClick {
    
    if([VGPUserData getCanUpdateUsername]) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"error.profile.init.account.require"]];
        return;
    }
    
    [self showLoadingView];
    
    [[VGPFBSDKLoginManager sharedInstance] logOut];
    [[VGPFBSDKLoginManager sharedInstance] logInWithPermissions:@[@"public_profile", @"email"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult* result, NSError* error) {
        if (error) {
            [self hideLoadingView];
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        } else if (result.isCancelled) {
            [self hideLoadingView];
        } else {
            if([FBSDKAccessToken currentAccessToken]) {
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"/me" parameters:@ {@"fields":@"id,name,email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection* connection, id result, NSError* error) {
                    if (!error) {
                        NSLog(@"Facebook fetched user:%@", result);
                        NSDictionary *data = (NSDictionary*)result;
                        // LINK ACCOUNT WITH FACEBOOK
                        if([VGPUserData getIsConnectFacebook]) {
                            [VGPAPI facebookUnLink:[data objectForKey:@"id"] success:^(id  _Nonnull responseObject) {
                                [self hideLoadingView];
                                [VGPUserData setIsConnectFacebook:NO];
                                [self updateUIText];
                            } failure:^(NSError * _Nonnull error) {
                                [self hideLoadingView];
                                [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
                            }];
                        } else {
                            [VGPAPI facebookLink:[data objectForKey:@"id"] success:^(id  _Nonnull responseObject) {
                                [self hideLoadingView];
                                [VGPUserData setIsConnectFacebook:YES];
                                [self updateUIText];
                            } failure:^(NSError * _Nonnull error) {
                                [self hideLoadingView];
                                [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
                            }];
                        }
                    } else {
                        [self hideLoadingView];
                        NSLog(@"Error on facebook graph");
                    }
                }];
            } else {
                [self hideLoadingView];
                NSLog(@"Error on facebook access_token");
            }
        }
    }];
}

#pragma mark -  Link with Device

- (void)rightPanelLinkQuickClick {
    
    if([VGPUserData getCanUpdateUsername]) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"error.profile.init.account.require"]];
        return;
    }
    
    [self showLoadingView];
    
    // LINK ACCOUNT WITH DEVICE
    if([VGPUserData getIsConnectQuickplay]) {
        [VGPAPI quickplayUnLink:^(id  _Nonnull responseObject) {
            [self hideLoadingView];
            [VGPUserData setIsConnectQuickplay:NO];
            [self updateUIText];
        } failure:^(NSError * _Nonnull error) {
            [self hideLoadingView];
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        }];
    } else {
        [VGPAPI quickplayLink:^(id  _Nonnull responseObject) {
            [self hideLoadingView];
            [VGPUserData setIsConnectQuickplay:YES];
            [self updateUIText];
        } failure:^(NSError * _Nonnull error) {
            [self hideLoadingView];
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        }];
    }
}

#pragma mark -  Link with Apple

- (void)rightPanelLinkAppleClick {
    if (@available(iOS 13.0, *)) {
        
        if([VGPUserData getCanUpdateUsername]) {
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"error.profile.init.account.require"]];
            return;
        }
        
        [self showLoadingView];
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

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization NS_SWIFT_NAME(authorizationController(controller:didCompleteWithAuthorization:)) API_AVAILABLE(ios(13.0)) {
    ASAuthorizationAppleIDCredential *appleIDCredential = authorization.credential;
    if(appleIDCredential && appleIDCredential.identityToken) {
        
        NSData *identityToken = appleIDCredential.identityToken;
        NSString *user = [appleIDCredential user];
        NSString *token = [identityToken base64EncodedStringWithOptions:0];
        
        // LINK ACCOUNT WITH APPLE
        if([VGPUserData getIsConnectApple]) {
            [VGPAPI appleUnLink:user identityToken:token success:^(id  _Nonnull responseObject) {
                [self hideLoadingView];
                [VGPUserData setIsConnectApple:NO];
                [self updateUIText];
            } failure:^(NSError * _Nonnull error) {
                [self hideLoadingView];
                [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
            }];
        } else {
            [VGPAPI appleLink:user identityToken:token success:^(id  _Nonnull responseObject) {
                [self hideLoadingView];
                [VGPUserData setIsConnectApple:YES];
                [self updateUIText];
            } failure:^(NSError * _Nonnull error) {
                [self hideLoadingView];
                [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
            }];
        }
    } else {
        [self hideLoadingView];
    }
}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error  NS_SWIFT_NAME(authorizationController(controller:didCompleteWithError:)) API_AVAILABLE(ios(13.0)) {
    [self hideLoadingView];
    [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[NSString stringWithFormat:[VGPHelper localizationForString:@"login.apple.error"], (long)[error code]]];
}

- (void)rightPanelInitVGPAccountClick {
    SHOW_BACK_BUTTON = YES;
    [[VGPUI sharedInstance] showInitAccountController];
}

- (void)rightPanelChangePasswordClick {
    SHOW_BACK_BUTTON = YES;
    [[VGPUI sharedInstance] showChangePasswordController];
}

@end
