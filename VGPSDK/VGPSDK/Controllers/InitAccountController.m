//
//  InitAccountController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/11/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "InitAccountController.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUI.h"
#import "UIData.h"
#import "VGPAPI.h"
#import "VGPFBSDKLoginManager.h"

@interface InitAccountController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIImageView *leftPanelImage;
    UIButton *leftSupportButton;
    
    UIView *rightPanel;
    UIImageView *rightPanelUsernameTextFieldBackground;
    UITextField *rightPanelUsernameTextField;
    UIImageView *rightPanelPasswordTextFieldBackground;
    UITextField *rightPanelPasswordTextField;
    UIButton *rightPanelInitAccountButton;
    
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

    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundLeftAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundTopAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundWidthAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundHeightAnchor;
    
    NSLayoutConstraint *rightPanelUsernameTextFieldLeftAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldTopAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldWidthAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldHeightAnchor;

    NSLayoutConstraint *rightPanelPasswordTextFieldBackgroundCenterXAnchor;
    NSLayoutConstraint *rightPanelPasswordTextFieldBackgroundTopAnchor;
    NSLayoutConstraint *rightPanelPasswordTextFieldBackgroundWidthAnchor;
    NSLayoutConstraint *rightPanelPasswordTextFieldBackgroundHeightAnchor;

    NSLayoutConstraint *rightPanelPasswordTextFieldCenterXAnchor;
    NSLayoutConstraint *rightPanelPasswordTextFieldTopAnchor;
    NSLayoutConstraint *rightPanelPasswordTextFieldWidthAnchor;
    NSLayoutConstraint *rightPanelPasswordTextFieldHeightAnchor;

    NSLayoutConstraint *rightPanelInitAccountButtonCenterXAnchor;
    NSLayoutConstraint *rightPanelInitAccountButtonTopAnchor;
    NSLayoutConstraint *rightPanelInitAccountButtonWidthAnchor;
    NSLayoutConstraint *rightPanelInitAccountButtonHeightAnchor;
}

@end

@implementation InitAccountController

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
    
    // USERNAME
    rightPanelUsernameTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelUsernameTextFieldBackground];
    rightPanelUsernameTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelUsernameTextField = [[UITextField alloc] init];
    rightPanelUsernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    if (@available(iOS 11.0, *)) rightPanelUsernameTextField.textContentType = UITextContentTypeUsername;
    rightPanelUsernameTextField.textColor = [UIColor blackColor];
    rightPanelUsernameTextField.delegate = self;
    [rightPanel addSubview:rightPanelUsernameTextField];
    rightPanelUsernameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    // PASSWORD
    rightPanelPasswordTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelPasswordTextFieldBackground];
    rightPanelPasswordTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelPasswordTextField = [[UITextField alloc] init];
    rightPanelPasswordTextField.secureTextEntry = YES;
    if (@available(iOS 11.0, *)) rightPanelPasswordTextField.textContentType = UITextContentTypePassword;
    rightPanelPasswordTextField.textColor = [UIColor blackColor];
    rightPanelPasswordTextField.delegate = self;
    [rightPanel addSubview:rightPanelPasswordTextField];
    rightPanelPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    // BUTTON
    rightPanelInitAccountButton = [[UIButton alloc] init];
    [rightPanelInitAccountButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelInitAccountButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelInitAccountButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelInitAccountButton.titleLabel setFont:VGP_FONT_LABEL_15];
    rightPanelInitAccountButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelInitAccountButton];
    rightPanelInitAccountButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelInitAccountButton addTarget:self action:@selector(rightPanelInitAccountButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {

    CGFloat width = LAYOUT_WIDTH < VGP_SCREEN_WIDTH ? LAYOUT_WIDTH : VGP_SCREEN_WIDTH - VGP_SCREEN_WIDTH * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    CGFloat padding = width * 0.02;
    
    // ===================================
    
    rightPanelUsernameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    rightPanelPasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    
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
    [rightPanelUsernameTextFieldBackgroundLeftAnchor setActive:NO];
    [rightPanelUsernameTextFieldBackgroundTopAnchor setActive:NO];
    [rightPanelUsernameTextFieldBackgroundWidthAnchor setActive:NO];
    [rightPanelUsernameTextFieldBackgroundHeightAnchor setActive:NO];
    rightPanelUsernameTextFieldBackgroundLeftAnchor = [rightPanelUsernameTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelUsernameTextFieldBackgroundTopAnchor = [rightPanelUsernameTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.12];
    rightPanelUsernameTextFieldBackgroundWidthAnchor = [rightPanelUsernameTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8];
    rightPanelUsernameTextFieldBackgroundHeightAnchor = [rightPanelUsernameTextFieldBackground.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelUsernameTextFieldBackgroundLeftAnchor setActive:YES];
    [rightPanelUsernameTextFieldBackgroundTopAnchor setActive:YES];
    [rightPanelUsernameTextFieldBackgroundWidthAnchor setActive:YES];
    [rightPanelUsernameTextFieldBackgroundHeightAnchor setActive:YES];
    
    [rightPanelUsernameTextFieldLeftAnchor setActive:NO];
    [rightPanelUsernameTextFieldTopAnchor setActive:NO];
    [rightPanelUsernameTextFieldWidthAnchor setActive:NO];
    [rightPanelUsernameTextFieldHeightAnchor setActive:NO];
    rightPanelUsernameTextFieldLeftAnchor = [rightPanelUsernameTextField.leftAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.leftAnchor];
    rightPanelUsernameTextFieldTopAnchor = [rightPanelUsernameTextField.topAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.topAnchor constant:1];
    rightPanelUsernameTextFieldWidthAnchor = [rightPanelUsernameTextField.widthAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.widthAnchor multiplier:1];
    rightPanelUsernameTextFieldHeightAnchor = [rightPanelUsernameTextField.heightAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.heightAnchor multiplier:1];
    [rightPanelUsernameTextFieldLeftAnchor setActive:YES];
    [rightPanelUsernameTextFieldTopAnchor setActive:YES];
    [rightPanelUsernameTextFieldWidthAnchor setActive:YES];
    [rightPanelUsernameTextFieldHeightAnchor setActive:YES];
    
    // password
    [rightPanelPasswordTextFieldBackgroundCenterXAnchor setActive:NO];
    [rightPanelPasswordTextFieldBackgroundTopAnchor setActive:NO];
    [rightPanelPasswordTextFieldBackgroundWidthAnchor setActive:NO];
    [rightPanelPasswordTextFieldBackgroundHeightAnchor setActive:NO];
    rightPanelPasswordTextFieldBackgroundCenterXAnchor = [rightPanelPasswordTextFieldBackground.centerXAnchor constraintEqualToAnchor:rightPanelUsernameTextField.centerXAnchor];
    rightPanelPasswordTextFieldBackgroundTopAnchor = [rightPanelPasswordTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanelUsernameTextField.bottomAnchor constant:padding];
    rightPanelPasswordTextFieldBackgroundWidthAnchor = [rightPanelPasswordTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanelUsernameTextField.widthAnchor multiplier:1];
    rightPanelPasswordTextFieldBackgroundHeightAnchor = [rightPanelPasswordTextFieldBackground.heightAnchor constraintEqualToAnchor:rightPanelUsernameTextField.heightAnchor multiplier:1];
    [rightPanelPasswordTextFieldBackgroundCenterXAnchor setActive:YES];
    [rightPanelPasswordTextFieldBackgroundTopAnchor setActive:YES];
    [rightPanelPasswordTextFieldBackgroundWidthAnchor setActive:YES];
    [rightPanelPasswordTextFieldBackgroundHeightAnchor setActive:YES];
    
    [rightPanelPasswordTextFieldCenterXAnchor setActive:NO];
    [rightPanelPasswordTextFieldTopAnchor setActive:NO];
    [rightPanelPasswordTextFieldWidthAnchor setActive:NO];
    [rightPanelPasswordTextFieldHeightAnchor setActive:NO];
    rightPanelPasswordTextFieldCenterXAnchor = [rightPanelPasswordTextField.centerXAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.centerXAnchor];
    rightPanelPasswordTextFieldTopAnchor = [rightPanelPasswordTextField.topAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.topAnchor constant:1];
    rightPanelPasswordTextFieldWidthAnchor = [rightPanelPasswordTextField.widthAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.widthAnchor multiplier:1];
    rightPanelPasswordTextFieldHeightAnchor = [rightPanelPasswordTextField.heightAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.heightAnchor multiplier:1];
    [rightPanelPasswordTextFieldCenterXAnchor setActive:YES];
    [rightPanelPasswordTextFieldTopAnchor setActive:YES];
    [rightPanelPasswordTextFieldWidthAnchor setActive:YES];
    [rightPanelPasswordTextFieldHeightAnchor setActive:YES];
    
    [rightPanelInitAccountButtonCenterXAnchor setActive:NO];
    [rightPanelInitAccountButtonTopAnchor setActive:NO];
    [rightPanelInitAccountButtonWidthAnchor setActive:NO];
    [rightPanelInitAccountButtonHeightAnchor setActive:NO];
    rightPanelInitAccountButtonCenterXAnchor = [rightPanelInitAccountButton.centerXAnchor constraintEqualToAnchor:rightPanelPasswordTextField.centerXAnchor];
    rightPanelInitAccountButtonTopAnchor = [rightPanelInitAccountButton.topAnchor constraintEqualToAnchor:rightPanelPasswordTextField.bottomAnchor constant:padding];
    rightPanelInitAccountButtonWidthAnchor = [rightPanelInitAccountButton.widthAnchor constraintEqualToAnchor:rightPanelPasswordTextField.widthAnchor multiplier:1];
    rightPanelInitAccountButtonHeightAnchor = [rightPanelInitAccountButton.heightAnchor constraintEqualToAnchor:rightPanelPasswordTextField.heightAnchor multiplier:1];
    [rightPanelInitAccountButtonCenterXAnchor setActive:YES];
    [rightPanelInitAccountButtonTopAnchor setActive:YES];
    [rightPanelInitAccountButtonWidthAnchor setActive:YES];
    [rightPanelInitAccountButtonHeightAnchor setActive:YES];
    
    if(SHOW_BACK_BUTTON) {
        leftBackButtonImg.hidden = NO;
        leftBackButtonText.hidden = NO;
    } else {
        leftBackButtonImg.hidden = YES;
        leftBackButtonText.hidden = YES;
    }
}

- (void)updateUIText {
    [leftBackButtonImg setImage:[VGPHelper getUIImageWithImageName:@"btn-back" andType:@"tiff"] forState:UIControlStateNormal];
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    [leftSupportButton setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-support-%@", [UIData getLocalization]] andType:@"tiff"] forState:UIControlStateNormal];
    
    rightPanelUsernameTextField.font = VGP_FONT_LABEL_13;
    rightPanelPasswordTextField.font = VGP_FONT_LABEL_13;
    
    rightPanelUsernameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[VGPHelper localizationForString:@"login.right.username"]
      attributes:@ {
         NSForegroundColorAttributeName: [UIColor lightGrayColor],
         NSFontAttributeName : VGP_FONT_LABEL_13
      }
    ];
    rightPanelPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[VGPHelper localizationForString:@"login.right.password"]
      attributes:@ {
         NSForegroundColorAttributeName: [UIColor lightGrayColor],
         NSFontAttributeName : VGP_FONT_LABEL_13
      }
    ];
    
    [rightPanelInitAccountButton setTitle:[VGPHelper localizationForString:@"update"] forState:UIControlStateNormal];
    [super updateUIText];
}

- (void)rightPanelInitAccountButtonClick {
    [self showLoadingView];
    
    NSString *username = [rightPanelUsernameTextField text];
    NSString *password = [rightPanelPasswordTextField text];
    
    [VGPAPI protectAccount:username password:password success:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
        [VGPUserData setUsername:self->rightPanelUsernameTextField.text];
        [VGPUserData setCanUpdateUsername:NO];
        [VGPUserData setShowProtectDialog:NO];
        self->rightPanelUsernameTextField.text = @"";
        self->rightPanelPasswordTextField.text = @"";
        if(SHOW_BACK_BUTTON) {
            [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_UPDATE_LAYOUT object:nil userInfo:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_UPDATE_LANGUAGE object:nil userInfo:nil];
            [self leftBackButtonClick];
        } else {
            [[VGPUI sharedInstance] dismiss];
        }
    } failure:^(NSError * _Nonnull error) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        [self hideLoadingView];
    }];
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    MyLog(@"textField %@", textField);
    [textField resignFirstResponder];
    if(textField == rightPanelUsernameTextField) [rightPanelPasswordTextField becomeFirstResponder];
    if(textField == rightPanelPasswordTextField) [self rightPanelInitAccountButtonClick];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [super textFieldDidBeginEditing:textField];
    if(textField == rightPanelPasswordTextField) {
        textField.returnKeyType = UIReturnKeySend;
    } else {
        textField.returnKeyType = UIReturnKeyNext;
    }
}

- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    [rightPanelUsernameTextField resignFirstResponder];
    [rightPanelPasswordTextField resignFirstResponder];
}

@end
