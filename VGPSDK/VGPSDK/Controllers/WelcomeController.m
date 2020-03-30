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
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
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
    
    rightPanelLoginNormal = [[UIButton alloc] init];
    [rightPanelLoginNormal setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-vgp" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginNormal setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginNormal.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginNormal.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginNormal.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginNormal];
    rightPanelLoginNormal.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginNormal addTarget:self action:@selector(rightPanelLoginNormalClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelLoginFacebook = [[UIButton alloc] init];
    [rightPanelLoginFacebook setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-facebook" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginFacebook.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginFacebook.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginFacebook.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginFacebook];
    rightPanelLoginFacebook.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginFacebook addTarget:self action:@selector(rightPanelLoginFacebookClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelLoginQuick = [[UIButton alloc] init];
    [rightPanelLoginQuick setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-quickplay" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginQuick.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginQuick.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginQuick.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginQuick];
    rightPanelLoginQuick.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginQuick addTarget:self action:@selector(rightPanelLoginQuickClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelLoginApple = [[UIButton alloc] init];
    [rightPanelLoginApple setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-apple" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginApple.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginApple.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginApple.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rightPanel addSubview:rightPanelLoginApple];
    rightPanelLoginApple.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelLoginApple addTarget:self action:@selector(rightPanelLoginAppleClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {

    CGFloat width = LAYOUT_WIDTH < VGP_SCREEN_WIDTH ? LAYOUT_WIDTH : VGP_SCREEN_WIDTH - VGP_SCREEN_WIDTH * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    CGFloat padding = width * 0.02;
    
    // ===================================
    
    rightPanelLoginNormal.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, width*0.05);
    rightPanelLoginFacebook.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, width*0.05);
    rightPanelLoginQuick.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, width*0.05);
    rightPanelLoginApple.contentEdgeInsets = UIEdgeInsetsMake(0, width*0.077, 0, width*0.05);
    
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
    
    [rightPanelLoginNormalLeftAnchor setActive:NO];
    [rightPanelLoginNormalTopAnchor setActive:NO];
    [rightPanelLoginNormalWidthAnchor setActive:NO];
    [rightPanelLoginNormalHeightAnchor setActive:NO];
    rightPanelLoginNormalLeftAnchor = [rightPanelLoginNormal.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelLoginNormalTopAnchor = [rightPanelLoginNormal.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.06];
    rightPanelLoginNormalWidthAnchor = [rightPanelLoginNormal.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8];
    rightPanelLoginNormalHeightAnchor = [rightPanelLoginNormal.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelLoginNormalLeftAnchor setActive:YES];
    [rightPanelLoginNormalTopAnchor setActive:YES];
    [rightPanelLoginNormalWidthAnchor setActive:YES];
    [rightPanelLoginNormalHeightAnchor setActive:YES];
    
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
    
    if(SHOW_BACK_BUTTON) {
        leftBackButtonImg.hidden = NO;
        leftBackButtonText.hidden = NO;
    } else {
        leftBackButtonImg.hidden = YES;
        leftBackButtonText.hidden = YES;
    }
    
    // iphone SE
    if(VGP_SCREEN_WIDTH <= 320) {
        [rightPanelLoginNormal.titleLabel setFont:VGP_FONT_LABEL_08];
        [rightPanelLoginFacebook.titleLabel setFont:VGP_FONT_LABEL_08];
        [rightPanelLoginQuick.titleLabel setFont:VGP_FONT_LABEL_08];
        [rightPanelLoginApple.titleLabel setFont:VGP_FONT_LABEL_08];
    }
    // iphone 6 - 6s - 7 - 8 - X
    else if(VGP_SCREEN_WIDTH > 320 && VGP_SCREEN_WIDTH <= 375) {
        [rightPanelLoginNormal.titleLabel setFont:VGP_FONT_LABEL_10];
        [rightPanelLoginFacebook.titleLabel setFont:VGP_FONT_LABEL_10];
        [rightPanelLoginQuick.titleLabel setFont:VGP_FONT_LABEL_10];
        [rightPanelLoginApple.titleLabel setFont:VGP_FONT_LABEL_10];
    }
    // iphone 7+ - 8+
    else if(VGP_SCREEN_WIDTH > 375 && VGP_SCREEN_WIDTH <= 414) {
        [rightPanelLoginNormal.titleLabel setFont:VGP_FONT_LABEL_13];
        [rightPanelLoginFacebook.titleLabel setFont:VGP_FONT_LABEL_13];
        [rightPanelLoginQuick.titleLabel setFont:VGP_FONT_LABEL_13];
        [rightPanelLoginApple.titleLabel setFont:VGP_FONT_LABEL_13];
    }
    else {
        [rightPanelLoginNormal.titleLabel setFont:VGP_FONT_LABEL_14];
        [rightPanelLoginFacebook.titleLabel setFont:VGP_FONT_LABEL_14];
        [rightPanelLoginQuick.titleLabel setFont:VGP_FONT_LABEL_14];
        [rightPanelLoginApple.titleLabel setFont:VGP_FONT_LABEL_14];
    }
}

- (void)updateUIText {
    [leftBackButtonImg setImage:[VGPHelper getUIImageWithImageName:@"btn-back" andType:@"tiff"] forState:UIControlStateNormal];
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    [leftSupportButton setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-support-%@", [UIData getLocalization]] andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginNormal setTitle:[VGPHelper localizationForString:@"login.right.normal"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitle:[VGPHelper localizationForString:@"login.right.facebook"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitle:[VGPHelper localizationForString:@"login.right.quick"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitle:[VGPHelper localizationForString:@"login.right.apple"] forState:UIControlStateNormal];
}

#pragma mark -  Sign in with VGP

- (void)rightPanelLoginNormalClick {
    [[VGPUI sharedInstance] showLoginNormalController:^ {
        // @TODO: TEST UI
        [[VGPLogger sharedInstance] loginViewDisplay];
    }];
}

#pragma mark -  Sign in with Facebook

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
            if([FBSDKAccessToken currentAccessToken]) {
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"/me" parameters:@ {@"fields":@"id,name,email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection* connection, id result, NSError* error) {
                    if (!error) {
                        NSLog(@"Facebook fetched user:%@", result);
                        NSDictionary *data = (NSDictionary*)result;
                        // login with facebook
                        [VGPAPI facebookLogin:[data objectForKey:@"id"] success:^(id  _Nonnull responseObject) {
                            [self hideLoadingView];
                        } failure:^(NSError * _Nonnull error) {
                            [self hideLoadingView];
                            MyLog(@"%@", [error localizedDescription]);
                        }];
                    } else {
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

#pragma mark -  Sign in with Device

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

#pragma mark -  Sign in with Apple

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

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization NS_SWIFT_NAME(authorizationController(controller:didCompleteWithAuthorization:)) API_AVAILABLE(ios(13.0)) {
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

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error  NS_SWIFT_NAME(authorizationController(controller:didCompleteWithError:)) API_AVAILABLE(ios(13.0)) {
    [self hideLoadingView];
    [[VGPLogger sharedInstance] loginError:@"apple"];
    [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[NSString stringWithFormat:[VGPHelper localizationForString:@"login.apple.error"], (long)[error code]]];
}

@end
