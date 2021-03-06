//
//  ForgotController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/11/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ForgotController.h"
#import "VGPUI.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPLogger.h"
#import "VGPAPI.h"

@interface ForgotController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIImageView *leftPanelImage;
    UIButton *leftSupportButton;
    
    UIView *rightPanel;
    UILabel *rightPanelForgotAccountLabel;
    
    UIButton *rightPanelForgotByPhoneButton;
    UIButton *rightPanelForgotByEmailButton;
    
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
    
    NSLayoutConstraint *rightPanelForgotAccountLabelLeftAnchor;
    NSLayoutConstraint *rightPanelForgotAccountLabelTopAnchor;
    NSLayoutConstraint *rightPanelForgotAccountLabelWidthAnchor;
    NSLayoutConstraint *rightPanelForgotAccountLabelHeightAnchor;
    
    NSLayoutConstraint *rightPanelForgotByPhoneButtonLeftAnchor;
    NSLayoutConstraint *rightPanelForgotByPhoneButtonTopAnchor;
    NSLayoutConstraint *rightPanelForgotByPhoneButtonWidthAnchor;
    NSLayoutConstraint *rightPanelForgotByPhoneButtonHeightAnchor;
    
    NSLayoutConstraint *rightPanelForgotByEmailButtonLeftAnchor;
    NSLayoutConstraint *rightPanelForgotByEmailButtonTopAnchor;
    NSLayoutConstraint *rightPanelForgotByEmailButtonWidthAnchor;
    NSLayoutConstraint *rightPanelForgotByEmailButtonHeightAnchor;
}
@end

@implementation ForgotController

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
    
    // FORGOT TEXT
    rightPanelForgotAccountLabel = [[UILabel alloc] init];
    rightPanelForgotAccountLabel.textColor = [UIColor blackColor];
    [rightPanel addSubview:rightPanelForgotAccountLabel];
    rightPanelForgotAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    // BUTTON
    rightPanelForgotByPhoneButton = [[UIButton alloc] init];
    [rightPanelForgotByPhoneButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-forgot-byphone" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelForgotByPhoneButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelForgotByPhoneButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelForgotByPhoneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelForgotByPhoneButton];
    rightPanelForgotByPhoneButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelForgotByPhoneButton addTarget:self action:@selector(rightPanelForgotByPhoneButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    rightPanelForgotByEmailButton = [[UIButton alloc] init];
    [rightPanelForgotByEmailButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-forgot-byemail" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelForgotByEmailButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelForgotByEmailButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelForgotByEmailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelForgotByEmailButton];
    rightPanelForgotByEmailButton.translatesAutoresizingMaskIntoConstraints = NO;
    [rightPanelForgotByEmailButton addTarget:self action:@selector(rightPanelForgotByEmailButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {
    
    CGFloat width = LAYOUT_WIDTH < VGP_SCREEN_WIDTH ? LAYOUT_WIDTH : VGP_SCREEN_WIDTH - VGP_SCREEN_WIDTH * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    CGFloat padding = width * 0.02;
    
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
    
    // FOTGOT TEXT
    [rightPanelForgotAccountLabelLeftAnchor setActive:NO];
    [rightPanelForgotAccountLabelTopAnchor setActive:NO];
    [rightPanelForgotAccountLabelWidthAnchor setActive:NO];
    [rightPanelForgotAccountLabelHeightAnchor setActive:NO];
    rightPanelForgotAccountLabelLeftAnchor = [rightPanelForgotAccountLabel.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelForgotAccountLabelTopAnchor = [rightPanelForgotAccountLabel.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:padding*3];
    rightPanelForgotAccountLabelWidthAnchor = [rightPanelForgotAccountLabel.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:1];
    rightPanelForgotAccountLabelHeightAnchor = [rightPanelForgotAccountLabel.heightAnchor constraintEqualToConstant:padding*2];
    [rightPanelForgotAccountLabelLeftAnchor setActive:YES];
    [rightPanelForgotAccountLabelTopAnchor setActive:YES];
    [rightPanelForgotAccountLabelWidthAnchor setActive:YES];
    [rightPanelForgotAccountLabelHeightAnchor setActive:YES];
    
    // BUTTON
    [rightPanelForgotByPhoneButtonLeftAnchor setActive:NO];
    [rightPanelForgotByPhoneButtonTopAnchor setActive:NO];
    [rightPanelForgotByPhoneButtonWidthAnchor setActive:NO];
    [rightPanelForgotByPhoneButtonHeightAnchor setActive:NO];
    rightPanelForgotByPhoneButtonLeftAnchor = [rightPanelForgotByPhoneButton.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelForgotByPhoneButtonTopAnchor = [rightPanelForgotByPhoneButton.topAnchor constraintEqualToAnchor:rightPanelForgotAccountLabel.bottomAnchor constant:padding];
    rightPanelForgotByPhoneButtonWidthAnchor = [rightPanelForgotByPhoneButton.widthAnchor constraintEqualToAnchor:rightPanelForgotAccountLabel.widthAnchor multiplier:.8];
    rightPanelForgotByPhoneButtonHeightAnchor = [rightPanelForgotByPhoneButton.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelForgotByPhoneButtonLeftAnchor setActive:YES];
    [rightPanelForgotByPhoneButtonTopAnchor setActive:YES];
    [rightPanelForgotByPhoneButtonWidthAnchor setActive:YES];
    [rightPanelForgotByPhoneButtonHeightAnchor setActive:YES];
    
    [rightPanelForgotByEmailButtonLeftAnchor setActive:NO];
    [rightPanelForgotByEmailButtonTopAnchor setActive:NO];
    [rightPanelForgotByEmailButtonWidthAnchor setActive:NO];
    [rightPanelForgotByEmailButtonHeightAnchor setActive:NO];
    rightPanelForgotByEmailButtonLeftAnchor = [rightPanelForgotByEmailButton.leftAnchor constraintEqualToAnchor:rightPanelForgotByPhoneButton.leftAnchor];
    rightPanelForgotByEmailButtonTopAnchor = [rightPanelForgotByEmailButton.topAnchor constraintEqualToAnchor:rightPanelForgotByPhoneButton.bottomAnchor constant:padding];
    rightPanelForgotByEmailButtonWidthAnchor = [rightPanelForgotByEmailButton.widthAnchor constraintEqualToAnchor:rightPanelForgotByPhoneButton.widthAnchor multiplier:1];
    rightPanelForgotByEmailButtonHeightAnchor = [rightPanelForgotByEmailButton.heightAnchor constraintEqualToAnchor:rightPanelForgotByPhoneButton.heightAnchor multiplier:1];
    [rightPanelForgotByEmailButtonLeftAnchor setActive:YES];
    [rightPanelForgotByEmailButtonTopAnchor setActive:YES];
    [rightPanelForgotByEmailButtonWidthAnchor setActive:YES];
    [rightPanelForgotByEmailButtonHeightAnchor setActive:YES];
    
    // iphone SE
    if(width <= 320) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_10];
        [rightPanelForgotByPhoneButton.titleLabel setFont:VGP_FONT_LABEL_10];
        [rightPanelForgotByEmailButton.titleLabel setFont:VGP_FONT_LABEL_08];
    }
    // iphone 6 - 6s - 7 - 8 - X
    else if(width > 320 && width <= 375) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_13];
        [rightPanelForgotByPhoneButton.titleLabel setFont:VGP_FONT_LABEL_13];
        [rightPanelForgotByEmailButton.titleLabel setFont:VGP_FONT_LABEL_10];
    }
    // iphone 7+ - 8+
    else if(width > 375 && width <= 414) {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
        [rightPanelForgotByPhoneButton.titleLabel setFont:VGP_FONT_LABEL_13];
        [rightPanelForgotByEmailButton.titleLabel setFont:VGP_FONT_LABEL_10];
    }
    else {
        [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
        [rightPanelForgotByPhoneButton.titleLabel setFont:VGP_FONT_LABEL_15];
        [rightPanelForgotByEmailButton.titleLabel setFont:VGP_FONT_LABEL_13];
    }
}

- (void)updateUIText {
    [leftBackButtonImg setImage:[VGPHelper getUIImageWithImageName:@"btn-back" andType:@"tiff"] forState:UIControlStateNormal];
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    [leftSupportButton setImage:[VGPHelper getUIImageWithImageName:[NSString stringWithFormat:@"btn-support-%@", [UIData getLocalization]] andType:@"tiff"] forState:UIControlStateNormal];
    
    rightPanelForgotAccountLabel.text = [VGPHelper localizationForString:@"profile.protect.text"];
    [rightPanelForgotByPhoneButton setTitle:[VGPHelper localizationForString:@"profile.protect.phone"] forState:UIControlStateNormal];
    [rightPanelForgotByEmailButton setTitle:[VGPHelper localizationForString:@"profile.protect.email"] forState:UIControlStateNormal];
}

- (void)rightPanelForgotByPhoneButtonClick {
    [[VGPUI sharedInstance] showForgotPhoneController];
}

- (void)rightPanelForgotByEmailButtonClick {

}

@end
