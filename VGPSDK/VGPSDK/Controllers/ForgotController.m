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
#import "VGPUserData.h"

@interface ForgotController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIView *leftPanelImage;

    UIView *rightPanel;
    UILabel *rightPanalForgotAccountLabel;
    UIButton *rightPanelForgotPhoneButton;
    UIButton *rightPanelForgotEmailButton;
}

@end

@implementation ForgotController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenWidth = [VGPHelper getScreenWidth];
    // CGFloat screenHeight = [VGPHelper getScreenHeight];
    CGFloat width = LAYOUT_WIDTH < screenWidth ? LAYOUT_WIDTH : screenWidth - screenWidth * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    
    // ===================================
    
    // background
    imgLayout = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"background" andType:@"tiff"]];
    imgLayout.layer.zPosition = 1;
    [self.view addSubview:imgLayout];
    imgLayout.translatesAutoresizingMaskIntoConstraints = NO;
    [[imgLayout.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[imgLayout.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[imgLayout.widthAnchor constraintEqualToConstant:width+width*0.04] setActive:YES];
    [[imgLayout.heightAnchor constraintEqualToConstant:height+width*0.04] setActive:YES];
    
    // create layout
    panel = [[UIView alloc] init];
    panel.layer.zPosition = 2;
    [self.view addSubview:panel];
    panel.translatesAutoresizingMaskIntoConstraints = NO;
    [[panel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[panel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[panel.widthAnchor constraintEqualToConstant:width] setActive:YES];
    [[panel.heightAnchor constraintEqualToConstant:height] setActive:YES];
    
    // close button
    rightCloseButton = [[UIButton alloc] init];
    rightCloseButton.layer.zPosition = 3;
    [rightCloseButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-close" andType:@"tiff"] forState:UIControlStateNormal];
    [self.view addSubview:rightCloseButton];
    rightCloseButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightCloseButton.rightAnchor constraintEqualToAnchor:panel.rightAnchor constant:width*0.04] setActive:YES];
    [[rightCloseButton.topAnchor constraintEqualToAnchor:panel.topAnchor constant:-width*0.04] setActive:YES];
    [[rightCloseButton.widthAnchor constraintEqualToConstant:width*0.08] setActive:YES];
    [[rightCloseButton.heightAnchor constraintEqualToConstant:width*0.08] setActive:YES];
    [rightCloseButton addTarget:self action:@selector(rightCloseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    leftBackButtonImg = [[UIButton alloc] init];
    leftBackButtonImg.layer.zPosition = 3;
    [leftBackButtonImg setImage:[VGPHelper getUIImageWithImageName:@"btn-back" andType:@"tiff"] forState:UIControlStateNormal];
    leftBackButtonText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [panel addSubview:leftBackButtonImg];
    leftBackButtonImg.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftBackButtonImg.leftAnchor constraintEqualToAnchor:panel.leftAnchor constant:width*.02] setActive:YES];
    [[leftBackButtonImg.topAnchor constraintEqualToAnchor:panel.topAnchor constant:width*.02] setActive:YES];
    [[leftBackButtonImg.widthAnchor constraintEqualToConstant:width*.03] setActive:YES];
    [[leftBackButtonImg.heightAnchor constraintEqualToConstant:width*.04] setActive:YES];
    
    leftBackButtonText = [[UIButton alloc] init];
    leftBackButtonText.layer.zPosition = 3;
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    [leftBackButtonText setTitleColor:VGP_MAIN_TEXT_COLOR forState:UIControlStateNormal];
    leftBackButtonText.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftBackButtonText.titleLabel setFont:[UIFont fontWithName:@"LexendDeca-Regular" size:15]];
    leftBackButtonText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [panel addSubview:leftBackButtonText];
    leftBackButtonText.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftBackButtonText.topAnchor constraintEqualToAnchor:leftBackButtonImg.topAnchor constant:0] setActive:YES];
    [[leftBackButtonText.leftAnchor constraintEqualToAnchor:leftBackButtonImg.rightAnchor constant:width*.02] setActive:YES];
    [[leftBackButtonText.widthAnchor constraintEqualToConstant:width*.94] setActive:YES];
    [[leftBackButtonText.heightAnchor constraintEqualToAnchor:leftBackButtonImg.heightAnchor multiplier:1] setActive:YES];
    
    [leftBackButtonImg addTarget:self action:@selector(leftBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBackButtonText addTarget:self action:@selector(leftBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // ===================================
    
    // left
    leftPanel = [[UIView alloc] init];
    leftPanel.userInteractionEnabled = NO;
    [panel addSubview:leftPanel];
    
    leftPanel.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftPanel.leftAnchor constraintEqualToAnchor:panel.leftAnchor] setActive:YES];
    [[leftPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor] setActive:YES];
    [[leftPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.43] setActive:YES];
    [[leftPanel.heightAnchor constraintEqualToAnchor:panel.heightAnchor] setActive:YES];
    
    leftPanelImage = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"img" andType:@"tiff"]];
    [leftPanel addSubview:leftPanelImage];
    
    leftPanelImage.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftPanelImage.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor] setActive:YES];
    [[leftPanelImage.topAnchor constraintEqualToAnchor:leftPanel.topAnchor constant:width*0.06] setActive:YES];
    [[leftPanelImage.widthAnchor constraintEqualToAnchor:leftPanel.widthAnchor multiplier:0.8f] setActive:YES];
    [[leftPanelImage.heightAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1] setActive:YES];
    
    // right
    rightPanel = [[UIView alloc] init];
    [panel addSubview:rightPanel];
    
    rightPanel.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanel.rightAnchor constraintEqualToAnchor:panel.rightAnchor] setActive:YES];
    [[rightPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor] setActive:YES];
    [[rightPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.57] setActive:YES];
    [[rightPanel.heightAnchor constraintEqualToAnchor:leftPanel.heightAnchor] setActive:YES];
    
    rightPanalForgotAccountLabel = [[UILabel alloc] init];
    rightPanalForgotAccountLabel.backgroundColor = [UIColor redColor];
    rightPanalForgotAccountLabel.text = [VGPHelper localizationForString:@"forgot.right.txt"];
    rightPanalForgotAccountLabel.textColor = [UIColor blackColor];
    rightPanalForgotAccountLabel.font = [UIFont fontWithName:@"LexendDeca-Regular" size:15];
    rightPanalForgotAccountLabel.numberOfLines = 0;
    [rightPanalForgotAccountLabel setTextAlignment:NSTextAlignmentLeft];
    [rightPanel addSubview:rightPanalForgotAccountLabel];
    
    rightPanalForgotAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanalForgotAccountLabel.topAnchor constraintEqualToAnchor:leftPanelImage.topAnchor constant:0] setActive:YES];
    [[rightPanalForgotAccountLabel.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanalForgotAccountLabel.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8] setActive:YES];
    [[rightPanalForgotAccountLabel.heightAnchor constraintEqualToConstant:width*.15] setActive:YES];
    [rightPanalForgotAccountLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    rightPanelForgotPhoneButton = [[UIButton alloc] init];
    [rightPanelForgotPhoneButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-forgot-byphone" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelForgotPhoneButton setTitle:[VGPHelper localizationForString:@"profile.protect.phone"] forState:UIControlStateNormal];
    [rightPanelForgotPhoneButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelForgotPhoneButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelForgotPhoneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelForgotPhoneButton.contentEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    [rightPanel addSubview:rightPanelForgotPhoneButton];
    
    rightPanelForgotPhoneButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelForgotPhoneButton.centerXAnchor constraintEqualToAnchor:rightPanalForgotAccountLabel.centerXAnchor] setActive:YES];
    [[rightPanelForgotPhoneButton.topAnchor constraintEqualToAnchor:rightPanalForgotAccountLabel.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelForgotPhoneButton.widthAnchor constraintEqualToAnchor:rightPanalForgotAccountLabel.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelForgotPhoneButton.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    rightPanelForgotEmailButton = [[UIButton alloc] init];
    [rightPanelForgotEmailButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-forgot-byemail" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelForgotEmailButton setTitle:[VGPHelper localizationForString:@"profile.protect.email"] forState:UIControlStateNormal];
    [rightPanelForgotEmailButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelForgotEmailButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelForgotEmailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelForgotEmailButton.contentEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    [rightPanel addSubview:rightPanelForgotEmailButton];
    
    rightPanelForgotEmailButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelForgotEmailButton.topAnchor constraintEqualToAnchor:rightPanelForgotPhoneButton.bottomAnchor constant:width*0.01] setActive:YES];
    [[rightPanelForgotEmailButton.leftAnchor constraintEqualToAnchor:rightPanelForgotPhoneButton.leftAnchor] setActive:YES];
    [[rightPanelForgotEmailButton.widthAnchor constraintEqualToAnchor:rightPanelForgotPhoneButton.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelForgotEmailButton.heightAnchor constraintEqualToAnchor:rightPanelForgotPhoneButton.heightAnchor multiplier:1] setActive:YES];
    
    // events
    [rightPanelForgotPhoneButton addTarget:self action:@selector(rightPanelForgotPhoneButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelForgotEmailButton addTarget:self action:@selector(rightPanelForgotEmailButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self updateUIText];
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    rightPanalForgotAccountLabel.text = [VGPHelper localizationForString:@"profile.protect.text"];
    [rightPanelForgotPhoneButton setTitle:[VGPHelper localizationForString:@"profile.protect.phone"] forState:UIControlStateNormal];
    [rightPanelForgotEmailButton setTitle:[VGPHelper localizationForString:@"profile.protect.email"] forState:UIControlStateNormal];
}

- (void)rightPanelForgotPhoneButtonClick {
    MyLog(@"rightPanelForgotPhoneButtonClick");
}

- (void)rightPanelForgotEmailButtonClick {
    MyLog(@"rightPanelForgotEmailButtonClick");
}

@end
