//
//  ForgotPhoneController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/11/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ForgotPhoneController.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUI.h"
#import "UIData.h"
#import "VGPAPI.h"
#import "VGPFBSDKLoginManager.h"

@interface ForgotPhoneController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIImageView *leftPanelImage;
    UIButton *leftSupportButton;
    
    UIView *rightPanel;
    UILabel *rightPanelTitleLabel;
    UIImageView *rightPanelUsernameTextFieldBackground;
    UITextField *rightPanelUsernameTextField;
    UIButton *rightPanelForgotPhoneButton;
    
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

    NSLayoutConstraint *rightPanelTitleLabelLeftAnchor;
    NSLayoutConstraint *rightPanelTitleLabelTopAnchor;
    NSLayoutConstraint *rightPanelTitleLabelWidthAnchor;
    NSLayoutConstraint *rightPanelTitleLabelHeightAnchor;

    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundLeftAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundTopAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundWidthAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldBackgroundHeightAnchor;
    
    NSLayoutConstraint *rightPanelUsernameTextFieldLeftAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldTopAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldWidthAnchor;
    NSLayoutConstraint *rightPanelUsernameTextFieldHeightAnchor;
    
    NSLayoutConstraint *rightPanelForgotPhoneButtonCenterXAnchor;
    NSLayoutConstraint *rightPanelForgotPhoneButtonTopAnchor;
    NSLayoutConstraint *rightPanelForgotPhoneButtonWidthAnchor;
    NSLayoutConstraint *rightPanelForgotPhoneButtonHeightAnchor;
}

@end

@implementation ForgotPhoneController

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
    rightPanelTitleLabel = [[UILabel alloc] init];
    rightPanelTitleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelTitleLabel setFont:VGP_FONT_LABEL_10];
    [rightPanelTitleLabel setTextColor:[UIColor grayColor]];
    [rightPanelTitleLabel setTextAlignment:NSTextAlignmentLeft];
    [rightPanel addSubview:rightPanelTitleLabel];
    rightPanelTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // PHONE
    rightPanelUsernameTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelUsernameTextFieldBackground];
    rightPanelUsernameTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelUsernameTextField = [[UITextField alloc] init];
    rightPanelUsernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    if (@available(iOS 10.0, *)) rightPanelUsernameTextField.textContentType = UITextContentTypeTelephoneNumber;
    rightPanelUsernameTextField.textColor = [UIColor blackColor];
    rightPanelUsernameTextField.delegate = self;
    [rightPanel addSubview:rightPanelUsernameTextField];
    rightPanelUsernameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    // BUTTON
    rightPanelForgotPhoneButton = [[UIButton alloc] init];
    [rightPanelForgotPhoneButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelForgotPhoneButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelForgotPhoneButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelForgotPhoneButton.titleLabel setFont:VGP_FONT_LABEL_15];
    rightPanelForgotPhoneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelForgotPhoneButton];
    rightPanelForgotPhoneButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelForgotPhoneButton addTarget:self action:@selector(rightPanelForgotPhoneButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {

    CGFloat width = LAYOUT_WIDTH < VGP_SCREEN_WIDTH ? LAYOUT_WIDTH : VGP_SCREEN_WIDTH - VGP_SCREEN_WIDTH * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    CGFloat padding = width * 0.02;
    
    // ===================================
    
    rightPanelUsernameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    rightPanelUsernameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    
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
    
    // TITLE
    [rightPanelTitleLabelLeftAnchor setActive:NO];
    [rightPanelTitleLabelTopAnchor setActive:NO];
    [rightPanelTitleLabelWidthAnchor setActive:NO];
    [rightPanelTitleLabelHeightAnchor setActive:NO];
    rightPanelTitleLabelLeftAnchor = [rightPanelTitleLabel.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelTitleLabelTopAnchor = [rightPanelTitleLabel.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.08];
    rightPanelTitleLabelWidthAnchor = [rightPanelTitleLabel.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8];
    rightPanelTitleLabelHeightAnchor = [rightPanelTitleLabel.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelTitleLabelLeftAnchor setActive:YES];
    [rightPanelTitleLabelTopAnchor setActive:YES];
    [rightPanelTitleLabelWidthAnchor setActive:YES];
    [rightPanelTitleLabelHeightAnchor setActive:YES];
    
    // USERNAME
    [rightPanelUsernameTextFieldBackgroundLeftAnchor setActive:NO];
    [rightPanelUsernameTextFieldBackgroundTopAnchor setActive:NO];
    [rightPanelUsernameTextFieldBackgroundWidthAnchor setActive:NO];
    [rightPanelUsernameTextFieldBackgroundHeightAnchor setActive:NO];
    rightPanelUsernameTextFieldBackgroundLeftAnchor = [rightPanelUsernameTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanelTitleLabel.leftAnchor];
    rightPanelUsernameTextFieldBackgroundTopAnchor = [rightPanelUsernameTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanelTitleLabel.bottomAnchor constant:padding];
    rightPanelUsernameTextFieldBackgroundWidthAnchor = [rightPanelUsernameTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanelTitleLabel.widthAnchor multiplier:1];
    rightPanelUsernameTextFieldBackgroundHeightAnchor = [rightPanelUsernameTextFieldBackground.heightAnchor constraintEqualToAnchor:rightPanelTitleLabel.heightAnchor multiplier:1];
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
    
    [rightPanelForgotPhoneButtonCenterXAnchor setActive:NO];
    [rightPanelForgotPhoneButtonTopAnchor setActive:NO];
    [rightPanelForgotPhoneButtonWidthAnchor setActive:NO];
    [rightPanelForgotPhoneButtonHeightAnchor setActive:NO];
    rightPanelForgotPhoneButtonCenterXAnchor = [rightPanelForgotPhoneButton.centerXAnchor constraintEqualToAnchor:rightPanelUsernameTextField.centerXAnchor];
    rightPanelForgotPhoneButtonTopAnchor = [rightPanelForgotPhoneButton.topAnchor constraintEqualToAnchor:rightPanelUsernameTextField.bottomAnchor constant:padding];
    rightPanelForgotPhoneButtonWidthAnchor = [rightPanelForgotPhoneButton.widthAnchor constraintEqualToAnchor:rightPanelUsernameTextField.widthAnchor multiplier:1];
    rightPanelForgotPhoneButtonHeightAnchor = [rightPanelForgotPhoneButton.heightAnchor constraintEqualToAnchor:rightPanelUsernameTextField.heightAnchor multiplier:1];
    [rightPanelForgotPhoneButtonCenterXAnchor setActive:YES];
    [rightPanelForgotPhoneButtonTopAnchor setActive:YES];
    [rightPanelForgotPhoneButtonWidthAnchor setActive:YES];
    [rightPanelForgotPhoneButtonHeightAnchor setActive:YES];
    
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
    
    rightPanelTitleLabel.font = VGP_FONT_LABEL_13;
    rightPanelUsernameTextField.font = VGP_FONT_LABEL_13;
    rightPanelTitleLabel.text = @"xxxxxxxxxxxxxxxxx";
    
    rightPanelUsernameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[VGPHelper localizationForString:@"login.right.username"] attributes:@ { NSForegroundColorAttributeName: [UIColor lightGrayColor], NSFontAttributeName : VGP_FONT_LABEL_13 }];
    
    [rightPanelForgotPhoneButton setTitle:[VGPHelper localizationForString:@"send"] forState:UIControlStateNormal];
    [super updateUIText];
}

- (void)viewDidAppear:(BOOL)animated {
    rightPanelUsernameTextField.text = @"";
}

- (void)rightPanelForgotPhoneButtonClick {
    NSArray* contentArr = [[UIData getPhoneChangeSMSMessage] componentsSeparatedByString:@":"];
    NSString* messContent = [contentArr objectAtIndex:0];
    NSString* phoneContent = [contentArr objectAtIndex:1];
    NSString *username = [rightPanelUsernameTextField text];
    
    messContent = [messContent stringByReplacingOccurrencesOfString:@"[username]" withString:username];
    
    NSString *sms = [NSString stringWithFormat:@"sms:%@&body=%@", phoneContent, messContent];
    NSString *url = [sms stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    MyLog(@"textField %@", textField);
    [textField resignFirstResponder];
    if(textField == rightPanelUsernameTextField) [self rightPanelForgotPhoneButtonClick];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [super textFieldDidBeginEditing:textField];
    if(textField == rightPanelUsernameTextField)
        textField.returnKeyType = UIReturnKeyNext;
    else
        textField.returnKeyType = UIReturnKeySend;
}

- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    [rightPanelUsernameTextField resignFirstResponder];
}

@end
