//
//  ProtectController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/11/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ProtectController.h"
#import "VGPUI.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUserData.h"

@interface ProtectController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIView *leftPanelImage;

    UIView *rightPanel;
    UILabel *rightPanelProtectAccountLabel;
    UIButton *rightPanelProtectPhoneButton;
    UIButton *rightPanelProtectEmailButton;
}

@end

@implementation ProtectController

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
    [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_15];
    leftBackButtonText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [panel addSubview:leftBackButtonText];
    leftBackButtonText.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftBackButtonText.topAnchor constraintEqualToAnchor:leftBackButtonImg.topAnchor constant:0] setActive:YES];
    [[leftBackButtonText.leftAnchor constraintEqualToAnchor:leftBackButtonImg.rightAnchor constant:0] setActive:YES];
    [[leftBackButtonText.widthAnchor constraintEqualToConstant:width*.5] setActive:YES];
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
    
    rightPanelProtectAccountLabel = [[UILabel alloc] init];
    rightPanelProtectAccountLabel.text = [VGPHelper localizationForString:@"profile.protect.text"];
    rightPanelProtectAccountLabel.textColor = VGP_MAIN_TEXT_COLOR;
    rightPanelProtectAccountLabel.font = VGP_FONT_LABEL_20;
    rightPanelProtectAccountLabel.numberOfLines = 0;
    rightPanelProtectAccountLabel.textAlignment = NSTextAlignmentCenter;
    [rightPanel addSubview:rightPanelProtectAccountLabel];
    
    rightPanelProtectAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelProtectAccountLabel.topAnchor constraintEqualToAnchor:leftPanelImage.topAnchor constant:0] setActive:YES];
    [[rightPanelProtectAccountLabel.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanelProtectAccountLabel.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8] setActive:YES];
    [[rightPanelProtectAccountLabel.heightAnchor constraintEqualToConstant:width*.15] setActive:YES];
    [rightPanelProtectAccountLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    rightPanelProtectPhoneButton = [[UIButton alloc] init];
    [rightPanelProtectPhoneButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-protect-byphone" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelProtectPhoneButton setTitle:[VGPHelper localizationForString:@"profile.protect.phone"] forState:UIControlStateNormal];
    [rightPanelProtectPhoneButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelProtectPhoneButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelProtectPhoneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelProtectPhoneButton.contentEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    [rightPanel addSubview:rightPanelProtectPhoneButton];
    
    rightPanelProtectPhoneButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelProtectPhoneButton.centerXAnchor constraintEqualToAnchor:rightPanelProtectAccountLabel.centerXAnchor] setActive:YES];
    [[rightPanelProtectPhoneButton.topAnchor constraintEqualToAnchor:rightPanelProtectAccountLabel.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelProtectPhoneButton.widthAnchor constraintEqualToAnchor:rightPanelProtectAccountLabel.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelProtectPhoneButton.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    rightPanelProtectEmailButton = [[UIButton alloc] init];
    [rightPanelProtectEmailButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-protect-byemail" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelProtectEmailButton setTitle:[VGPHelper localizationForString:@"profile.protect.email"] forState:UIControlStateNormal];
    [rightPanelProtectEmailButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelProtectEmailButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelProtectEmailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelProtectEmailButton.contentEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    [rightPanel addSubview:rightPanelProtectEmailButton];
    
    rightPanelProtectEmailButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelProtectEmailButton.topAnchor constraintEqualToAnchor:rightPanelProtectPhoneButton.bottomAnchor constant:width*0.01] setActive:YES];
    [[rightPanelProtectEmailButton.leftAnchor constraintEqualToAnchor:rightPanelProtectPhoneButton.leftAnchor] setActive:YES];
    [[rightPanelProtectEmailButton.widthAnchor constraintEqualToAnchor:rightPanelProtectPhoneButton.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelProtectEmailButton.heightAnchor constraintEqualToAnchor:rightPanelProtectPhoneButton.heightAnchor multiplier:1] setActive:YES];
    
    // events
    [rightPanelProtectPhoneButton addTarget:self action:@selector(rightPanelProtectPhoneButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelProtectEmailButton addTarget:self action:@selector(rightPanelProtectEmailButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    rightPanelProtectAccountLabel.text = [VGPHelper localizationForString:@"profile.protect.text"];
    [rightPanelProtectPhoneButton setTitle:[VGPHelper localizationForString:@"profile.protect.phone"] forState:UIControlStateNormal];
    [rightPanelProtectEmailButton setTitle:[VGPHelper localizationForString:@"profile.protect.email"] forState:UIControlStateNormal];
}

- (void)rightPanelProtectPhoneButtonClick {
    MyLog(@"rightPanelProtectPhoneButtonClick");
}

- (void)rightPanelProtectEmailButtonClick {
    MyLog(@"rightPanelProtectEmailButtonClick");
}

@end
