//
//  ChangePasswordController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/11/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ChangePasswordController.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUI.h"
#import "UIData.h"
#import "VGPAPI.h"
#import "VGPFBSDKLoginManager.h"

@interface ChangePasswordController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIImageView *leftPanelImage;
    UIButton *leftSupportButton;
    
    UIView *rightPanel;
    UIImageView *rightPanelOldPasswordTextFieldBackground;
    UITextField *rightPanelOldPasswordTextField;
    UIImageView *rightPanelNewPasswordTextFieldBackground;
    UITextField *rightPanelNewPasswordTextField;
    UIButton *rightPanelChangePasswordButton;
    
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

    NSLayoutConstraint *rightPanelOldPasswordTextFieldBackgroundLeftAnchor;
    NSLayoutConstraint *rightPanelOldPasswordTextFieldBackgroundTopAnchor;
    NSLayoutConstraint *rightPanelOldPasswordTextFieldBackgroundWidthAnchor;
    NSLayoutConstraint *rightPanelOldPasswordTextFieldBackgroundHeightAnchor;
    
    NSLayoutConstraint *rightPanelOldPasswordTextFieldLeftAnchor;
    NSLayoutConstraint *rightPanelOldPasswordTextFieldTopAnchor;
    NSLayoutConstraint *rightPanelOldPasswordTextFieldWidthAnchor;
    NSLayoutConstraint *rightPanelOldPasswordTextFieldHeightAnchor;

    NSLayoutConstraint *rightPanelNewPasswordTextFieldBackgroundCenterXAnchor;
    NSLayoutConstraint *rightPanelNewPasswordTextFieldBackgroundTopAnchor;
    NSLayoutConstraint *rightPanelNewPasswordTextFieldBackgroundWidthAnchor;
    NSLayoutConstraint *rightPanelNewPasswordTextFieldBackgroundHeightAnchor;

    NSLayoutConstraint *rightPanelNewPasswordTextFieldCenterXAnchor;
    NSLayoutConstraint *rightPanelNewPasswordTextFieldTopAnchor;
    NSLayoutConstraint *rightPanelNewPasswordTextFieldWidthAnchor;
    NSLayoutConstraint *rightPanelNewPasswordTextFieldHeightAnchor;

    NSLayoutConstraint *rightPanelChangePasswordButtonCenterXAnchor;
    NSLayoutConstraint *rightPanelChangePasswordButtonTopAnchor;
    NSLayoutConstraint *rightPanelChangePasswordButtonWidthAnchor;
    NSLayoutConstraint *rightPanelChangePasswordButtonHeightAnchor;
}

@end

@implementation ChangePasswordController

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
    [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
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
    
    // OLD PASSWORD
    rightPanelOldPasswordTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelOldPasswordTextFieldBackground];
    rightPanelOldPasswordTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelOldPasswordTextField = [[UITextField alloc] init];
    rightPanelOldPasswordTextField.secureTextEntry = YES;
    if (@available(iOS 11.0, *)) rightPanelOldPasswordTextField.textContentType = UITextContentTypePassword;
    rightPanelOldPasswordTextField.textColor = [UIColor blackColor];
    rightPanelOldPasswordTextField.delegate = self;
    [rightPanel addSubview:rightPanelOldPasswordTextField];
    rightPanelOldPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    // NEW PASSWORD
    rightPanelNewPasswordTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelNewPasswordTextFieldBackground];
    rightPanelNewPasswordTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelNewPasswordTextField = [[UITextField alloc] init];
    rightPanelNewPasswordTextField.secureTextEntry = YES;
    if (@available(iOS 12.0, *)) rightPanelNewPasswordTextField.textContentType = UITextContentTypeNewPassword;
    rightPanelNewPasswordTextField.textColor = [UIColor blackColor];
    rightPanelNewPasswordTextField.delegate = self;
    [rightPanel addSubview:rightPanelNewPasswordTextField];
    rightPanelNewPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    // BUTTON
    rightPanelChangePasswordButton = [[UIButton alloc] init];
    [rightPanelChangePasswordButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelChangePasswordButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelChangePasswordButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelChangePasswordButton.titleLabel setFont:VGP_FONT_LABEL_15];
    rightPanelChangePasswordButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelChangePasswordButton];
    rightPanelChangePasswordButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelChangePasswordButton addTarget:self action:@selector(rightPanelChangePasswordButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {

    CGFloat width = LAYOUT_WIDTH < VGP_SCREEN_WIDTH ? LAYOUT_WIDTH : VGP_SCREEN_WIDTH - VGP_SCREEN_WIDTH * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    CGFloat padding = width * 0.02;
    
    // ===================================
    
    rightPanelOldPasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    rightPanelNewPasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    
    // ===================================

    // background
    [imgLayoutCenterXAnchor setActive:NO];
    [imgLayoutCenterYAnchor setActive:NO];
    [imgLayoutWidthAnchor setActive:NO];
    [imgLayoutHeightAnchor setActive:NO];
    imgLayoutCenterXAnchor = [imgLayout.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    imgLayoutCenterYAnchor = [imgLayout.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    imgLayoutWidthAnchor = [imgLayout.widthAnchor constraintEqualToConstant:width+width*0.04];
    imgLayoutHeightAnchor = [imgLayout.heightAnchor constraintEqualToConstant:height+width*0.04];
    [imgLayoutCenterXAnchor setActive:YES];
    [imgLayoutCenterYAnchor setActive:YES];
    [imgLayoutWidthAnchor setActive:YES];
    [imgLayoutHeightAnchor setActive:YES];
    
    // create layout
    
    [panelCenterXAnchor setActive:NO];
    [panelCenterYAnchor setActive:NO];
    [panelWidthAnchor setActive:NO];
    [panelHeightAnchor setActive:NO];
    panelCenterXAnchor = [panel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    panelCenterYAnchor = [panel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    panelWidthAnchor = [panel.widthAnchor constraintEqualToConstant:width];
    panelHeightAnchor = [panel.heightAnchor constraintEqualToConstant:height];
    [panelCenterXAnchor setActive:YES];
    [panelCenterYAnchor setActive:YES];
    [panelWidthAnchor setActive:YES];
    [panelHeightAnchor setActive:YES];
    
    // close button
    [rightCloseButtonRightAnchor setActive:NO];
    [rightCloseButtonTopAnchor setActive:NO];
    [rightCloseButtonWidthAnchor setActive:NO];
    [rightCloseButtonHeightAnchor setActive:NO];
    rightCloseButtonRightAnchor = [rightCloseButton.rightAnchor constraintEqualToAnchor:panel.rightAnchor constant:width*0.04];
    rightCloseButtonTopAnchor = [rightCloseButton.topAnchor constraintEqualToAnchor:panel.topAnchor constant:-width*0.04];
    rightCloseButtonWidthAnchor = [rightCloseButton.widthAnchor constraintEqualToConstant:width*0.08];
    rightCloseButtonHeightAnchor = [rightCloseButton.heightAnchor constraintEqualToConstant:width*0.08];
    [rightCloseButtonRightAnchor setActive:YES];
    [rightCloseButtonTopAnchor setActive:YES];
    [rightCloseButtonWidthAnchor setActive:YES];
    [rightCloseButtonHeightAnchor setActive:YES];
    
    // ===================================

    // left
    [leftPanelLeftAnchor setActive:NO];
    [leftPanelCenterYAnchor setActive:NO];
    [leftPanelWidthAnchor setActive:NO];
    [leftPanelHeightAnchor setActive:NO];
    leftPanelLeftAnchor = [leftPanel.leftAnchor constraintEqualToAnchor:panel.leftAnchor];
    leftPanelCenterYAnchor = [leftPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor];
    leftPanelWidthAnchor = [leftPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.48];
    leftPanelHeightAnchor = [leftPanel.heightAnchor constraintEqualToAnchor:panel.heightAnchor];
    [leftPanelLeftAnchor setActive:YES];
    [leftPanelCenterYAnchor setActive:YES];
    [leftPanelWidthAnchor setActive:YES];
    [leftPanelHeightAnchor setActive:YES];
    
    [leftPanelImageCenterXAnchor setActive:NO];
    [leftPanelImageTopAnchor setActive:NO];
    [leftPanelImageWidthAnchor setActive:NO];
    [leftPanelImageHeightAnchor setActive:NO];
    leftPanelImageCenterXAnchor = [leftPanelImage.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor];
    leftPanelImageTopAnchor = [leftPanelImage.topAnchor constraintEqualToAnchor:leftPanel.topAnchor constant:width*0.03];
    leftPanelImageWidthAnchor = [leftPanelImage.widthAnchor constraintEqualToAnchor:leftPanel.widthAnchor multiplier:0.68f];
    leftPanelImageHeightAnchor = [leftPanelImage.heightAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1];
    [leftPanelImageCenterXAnchor setActive:YES];
    [leftPanelImageTopAnchor setActive:YES];
    [leftPanelImageWidthAnchor setActive:YES];
    [leftPanelImageHeightAnchor setActive:YES];
    
    [leftBackButtonImgLeftAnchor setActive:NO];
    [leftBackButtonImgTopAnchor setActive:NO];
    [leftBackButtonImgWidthAnchor setActive:NO];
    [leftBackButtonImgHeightAnchor setActive:NO];
    leftBackButtonImgLeftAnchor = [leftBackButtonImg.leftAnchor constraintEqualToAnchor:panel.leftAnchor constant:padding];
    leftBackButtonImgTopAnchor = [leftBackButtonImg.topAnchor constraintEqualToAnchor:panel.topAnchor constant:padding];
    leftBackButtonImgWidthAnchor = [leftBackButtonImg.widthAnchor constraintEqualToConstant:width*.03];
    leftBackButtonImgHeightAnchor = [leftBackButtonImg.heightAnchor constraintEqualToConstant:width*.04];
    [leftBackButtonImgLeftAnchor setActive:YES];
    [leftBackButtonImgTopAnchor setActive:YES];
    [leftBackButtonImgWidthAnchor setActive:YES];
    [leftBackButtonImgHeightAnchor setActive:YES];
    
    [leftBackButtonTextTopAnchor setActive:NO];
    [leftBackButtonTextLeftAnchor setActive:NO];
    [leftBackButtonTextWidthAnchor setActive:NO];
    [leftBackButtonTextHeightAnchor setActive:NO];
    leftBackButtonTextTopAnchor = [leftBackButtonText.topAnchor constraintEqualToAnchor:leftBackButtonImg.topAnchor constant:0];
    leftBackButtonTextLeftAnchor = [leftBackButtonText.leftAnchor constraintEqualToAnchor:leftBackButtonImg.rightAnchor constant:0];
    leftBackButtonTextWidthAnchor = [leftBackButtonText.widthAnchor constraintEqualToConstant:width*.5];
    leftBackButtonTextHeightAnchor = [leftBackButtonText.heightAnchor constraintEqualToAnchor:leftBackButtonImg.heightAnchor multiplier:1];
    [leftBackButtonTextTopAnchor setActive:YES];
    [leftBackButtonTextLeftAnchor setActive:YES];
    [leftBackButtonTextWidthAnchor setActive:YES];
    [leftBackButtonTextHeightAnchor setActive:YES];
    
    [leftSupportButtonCenterXAnchor setActive:NO];
    [leftSupportButtonTopAnchor setActive:NO];
    [leftSupportButtonWidthAnchor setActive:NO];
    [leftSupportButtonHeightAnchor setActive:NO];
    leftSupportButtonTopAnchor = [leftSupportButton.topAnchor constraintEqualToAnchor:leftPanelImage.bottomAnchor constant:padding];
    leftSupportButtonCenterXAnchor = [leftSupportButton.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor];
    leftSupportButtonWidthAnchor = [leftSupportButton.widthAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1];
    leftSupportButtonHeightAnchor = [leftSupportButton.heightAnchor constraintEqualToAnchor:leftSupportButton.widthAnchor multiplier:.25];
    [leftSupportButtonCenterXAnchor setActive:YES];
    [leftSupportButtonTopAnchor setActive:YES];
    [leftSupportButtonWidthAnchor setActive:YES];
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
    
    // username
    [rightPanelOldPasswordTextFieldBackgroundLeftAnchor setActive:NO];
    [rightPanelOldPasswordTextFieldBackgroundTopAnchor setActive:NO];
    [rightPanelOldPasswordTextFieldBackgroundWidthAnchor setActive:NO];
    [rightPanelOldPasswordTextFieldBackgroundHeightAnchor setActive:NO];
    rightPanelOldPasswordTextFieldBackgroundLeftAnchor = [rightPanelOldPasswordTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelOldPasswordTextFieldBackgroundTopAnchor = [rightPanelOldPasswordTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.12];
    rightPanelOldPasswordTextFieldBackgroundWidthAnchor = [rightPanelOldPasswordTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8];
    rightPanelOldPasswordTextFieldBackgroundHeightAnchor = [rightPanelOldPasswordTextFieldBackground.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelOldPasswordTextFieldBackgroundLeftAnchor setActive:YES];
    [rightPanelOldPasswordTextFieldBackgroundTopAnchor setActive:YES];
    [rightPanelOldPasswordTextFieldBackgroundWidthAnchor setActive:YES];
    [rightPanelOldPasswordTextFieldBackgroundHeightAnchor setActive:YES];
    
    [rightPanelOldPasswordTextFieldLeftAnchor setActive:NO];
    [rightPanelOldPasswordTextFieldTopAnchor setActive:NO];
    [rightPanelOldPasswordTextFieldWidthAnchor setActive:NO];
    [rightPanelOldPasswordTextFieldHeightAnchor setActive:NO];
    rightPanelOldPasswordTextFieldLeftAnchor = [rightPanelOldPasswordTextField.leftAnchor constraintEqualToAnchor:rightPanelOldPasswordTextFieldBackground.leftAnchor];
    rightPanelOldPasswordTextFieldTopAnchor = [rightPanelOldPasswordTextField.topAnchor constraintEqualToAnchor:rightPanelOldPasswordTextFieldBackground.topAnchor constant:1];
    rightPanelOldPasswordTextFieldWidthAnchor = [rightPanelOldPasswordTextField.widthAnchor constraintEqualToAnchor:rightPanelOldPasswordTextFieldBackground.widthAnchor multiplier:1];
    rightPanelOldPasswordTextFieldHeightAnchor = [rightPanelOldPasswordTextField.heightAnchor constraintEqualToAnchor:rightPanelOldPasswordTextFieldBackground.heightAnchor multiplier:1];
    [rightPanelOldPasswordTextFieldLeftAnchor setActive:YES];
    [rightPanelOldPasswordTextFieldTopAnchor setActive:YES];
    [rightPanelOldPasswordTextFieldWidthAnchor setActive:YES];
    [rightPanelOldPasswordTextFieldHeightAnchor setActive:YES];
    
    // password
    [rightPanelNewPasswordTextFieldBackgroundCenterXAnchor setActive:NO];
    [rightPanelNewPasswordTextFieldBackgroundTopAnchor setActive:NO];
    [rightPanelNewPasswordTextFieldBackgroundWidthAnchor setActive:NO];
    [rightPanelNewPasswordTextFieldBackgroundHeightAnchor setActive:NO];
    rightPanelNewPasswordTextFieldBackgroundCenterXAnchor = [rightPanelNewPasswordTextFieldBackground.centerXAnchor constraintEqualToAnchor:rightPanelOldPasswordTextField.centerXAnchor];
    rightPanelNewPasswordTextFieldBackgroundTopAnchor = [rightPanelNewPasswordTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanelOldPasswordTextField.bottomAnchor constant:padding];
    rightPanelNewPasswordTextFieldBackgroundWidthAnchor = [rightPanelNewPasswordTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanelOldPasswordTextField.widthAnchor multiplier:1];
    rightPanelNewPasswordTextFieldBackgroundHeightAnchor = [rightPanelNewPasswordTextFieldBackground.heightAnchor constraintEqualToAnchor:rightPanelOldPasswordTextField.heightAnchor multiplier:1];
    [rightPanelNewPasswordTextFieldBackgroundCenterXAnchor setActive:YES];
    [rightPanelNewPasswordTextFieldBackgroundTopAnchor setActive:YES];
    [rightPanelNewPasswordTextFieldBackgroundWidthAnchor setActive:YES];
    [rightPanelNewPasswordTextFieldBackgroundHeightAnchor setActive:YES];
    
    [rightPanelNewPasswordTextFieldCenterXAnchor setActive:NO];
    [rightPanelNewPasswordTextFieldTopAnchor setActive:NO];
    [rightPanelNewPasswordTextFieldWidthAnchor setActive:NO];
    [rightPanelNewPasswordTextFieldHeightAnchor setActive:NO];
    rightPanelNewPasswordTextFieldCenterXAnchor = [rightPanelNewPasswordTextField.centerXAnchor constraintEqualToAnchor:rightPanelNewPasswordTextFieldBackground.centerXAnchor];
    rightPanelNewPasswordTextFieldTopAnchor = [rightPanelNewPasswordTextField.topAnchor constraintEqualToAnchor:rightPanelNewPasswordTextFieldBackground.topAnchor constant:1];
    rightPanelNewPasswordTextFieldWidthAnchor = [rightPanelNewPasswordTextField.widthAnchor constraintEqualToAnchor:rightPanelNewPasswordTextFieldBackground.widthAnchor multiplier:1];
    rightPanelNewPasswordTextFieldHeightAnchor = [rightPanelNewPasswordTextField.heightAnchor constraintEqualToAnchor:rightPanelNewPasswordTextFieldBackground.heightAnchor multiplier:1];
    [rightPanelNewPasswordTextFieldCenterXAnchor setActive:YES];
    [rightPanelNewPasswordTextFieldTopAnchor setActive:YES];
    [rightPanelNewPasswordTextFieldWidthAnchor setActive:YES];
    [rightPanelNewPasswordTextFieldHeightAnchor setActive:YES];
    
    [rightPanelChangePasswordButtonCenterXAnchor setActive:NO];
    [rightPanelChangePasswordButtonTopAnchor setActive:NO];
    [rightPanelChangePasswordButtonWidthAnchor setActive:NO];
    [rightPanelChangePasswordButtonHeightAnchor setActive:NO];
    rightPanelChangePasswordButtonCenterXAnchor = [rightPanelChangePasswordButton.centerXAnchor constraintEqualToAnchor:rightPanelNewPasswordTextField.centerXAnchor];
    rightPanelChangePasswordButtonTopAnchor = [rightPanelChangePasswordButton.topAnchor constraintEqualToAnchor:rightPanelNewPasswordTextField.bottomAnchor constant:padding];
    rightPanelChangePasswordButtonWidthAnchor = [rightPanelChangePasswordButton.widthAnchor constraintEqualToAnchor:rightPanelNewPasswordTextField.widthAnchor multiplier:1];
    rightPanelChangePasswordButtonHeightAnchor = [rightPanelChangePasswordButton.heightAnchor constraintEqualToAnchor:rightPanelNewPasswordTextField.heightAnchor multiplier:1];
    [rightPanelChangePasswordButtonCenterXAnchor setActive:YES];
    [rightPanelChangePasswordButtonTopAnchor setActive:YES];
    [rightPanelChangePasswordButtonWidthAnchor setActive:YES];
    [rightPanelChangePasswordButtonHeightAnchor setActive:YES];
    
    if(SHOW_BACK_BUTTON) {
        leftBackButtonImg.hidden = NO;
        leftBackButtonText.hidden = NO;
    } else {
        leftBackButtonImg.hidden = YES;
        leftBackButtonText.hidden = YES;
    }
    
    // iphone SE
    if(VGP_SCREEN_WIDTH <= 320) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_10];
    }
    // iphone 6 - 6s - 7 - 8 - X
    else if(VGP_SCREEN_WIDTH > 320 && VGP_SCREEN_WIDTH <= 375) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_13];
    }
    // iphone 7+ - 8+
    else if(VGP_SCREEN_WIDTH > 375 && VGP_SCREEN_WIDTH <= 414) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
    }
    else {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
    }
}

- (void)updateUIText {
    [leftBackButtonImg setImage:[VGPHelper getUIImageWithImageName:@"btn-back" andType:@"tiff"] forState:UIControlStateNormal];
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    [leftSupportButton setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-support-%@", [UIData getLocalization]] andType:@"tiff"] forState:UIControlStateNormal];
    
    rightPanelOldPasswordTextField.font = VGP_FONT_LABEL_13;
    rightPanelNewPasswordTextField.font = VGP_FONT_LABEL_13;
    
    rightPanelOldPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[VGPHelper localizationForString:@"profile.old_password"] attributes:@ { NSForegroundColorAttributeName: [UIColor lightGrayColor], NSFontAttributeName : VGP_FONT_LABEL_13 }];
    rightPanelNewPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[VGPHelper localizationForString:@"profile.new_password"] attributes:@ { NSForegroundColorAttributeName: [UIColor lightGrayColor], NSFontAttributeName : VGP_FONT_LABEL_13 }];
    
    [rightPanelChangePasswordButton setTitle:[VGPHelper localizationForString:@"update"] forState:UIControlStateNormal];
    [super updateUIText];
}

- (void)rightPanelChangePasswordButtonClick {
    [self showLoadingView];
    
    NSString *old_password = [rightPanelOldPasswordTextField text];
    NSString *new_password = [rightPanelNewPasswordTextField text];
    
    [VGPAPI changePassword:old_password password:new_password success:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
        self->rightPanelOldPasswordTextField.text = @"";
        self->rightPanelNewPasswordTextField.text = @"";
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"notification"] message:[VGPHelper localizationForString:@"update.success"] handler:^(UIAlertAction * _Nonnull action) {
            [[VGPInterface sharedInstance] logoutGame];
        }];
    } failure:^(NSError * _Nonnull error) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        [self hideLoadingView];
    }];
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    MyLog(@"textField %@", textField);
    [textField resignFirstResponder];
    if(textField == rightPanelOldPasswordTextField) [rightPanelNewPasswordTextField becomeFirstResponder];
    if(textField == rightPanelNewPasswordTextField) [self rightPanelChangePasswordButtonClick];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [super textFieldDidBeginEditing:textField];
    if(textField == rightPanelNewPasswordTextField) {
        textField.returnKeyType = UIReturnKeySend;
    } else {
        textField.returnKeyType = UIReturnKeyNext;
    }
}

- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    [rightPanelOldPasswordTextField resignFirstResponder];
    [rightPanelNewPasswordTextField resignFirstResponder];
}

@end
