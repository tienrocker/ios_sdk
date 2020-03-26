//
//  ProfileController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/5/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ProfileController.h"
#import "VGPUI.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUserData.h"
#import "VGPAPI.h"

@interface ProfileController () {
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
    UILabel *rightPanelUserIDLabel;
    UIButton *rightPanelEditProfileButton;
    UIButton *rightPanelLinkButton;
    UIButton *rightPanelLogoutButton;
    
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
    
    NSLayoutConstraint *rightPanelUserIDLabelCenterXAnchor;
    NSLayoutConstraint *rightPanelUserIDLabelTopAnchor;
    NSLayoutConstraint *rightPanelUserIDLabelWidthAnchor;
    NSLayoutConstraint *rightPanelUserIDLabelHeightAnchor;
    
    NSLayoutConstraint *rightPanelEditProfileButtonCenterXAnchor;
    NSLayoutConstraint *rightPanelEditProfileButtonTopAnchor;
    NSLayoutConstraint *rightPanelEditProfileButtonWidthAnchor;
    NSLayoutConstraint *rightPanelEditProfileButtonHeightAnchor;
    
    NSLayoutConstraint *rightPanelLinkButtonLeftAnchor;
    NSLayoutConstraint *rightPanelLinkButtonTopAnchor;
    NSLayoutConstraint *rightPanelLinkButtonWidthAnchor;
    NSLayoutConstraint *rightPanelLinkButtonHeightAnchor;
    
    NSLayoutConstraint *rightPanelLogoutButtonLeftAnchor;
    NSLayoutConstraint *rightPanelLogoutButtonTopAnchor;
    NSLayoutConstraint *rightPanelLogoutButtonWidthAnchor;
    NSLayoutConstraint *rightPanelLogoutButtonHeightAnchor;
}
@end

@implementation ProfileController

- (void)viewDidLoad{
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
    
    rightPanelUsernameLabel = [[UILabel alloc] init];
    rightPanelUsernameLabel.textColor = VGP_MAIN_TEXT_COLOR;
    rightPanelUsernameLabel.font = VGP_FONT_LABEL_20;
    rightPanelUsernameLabel.numberOfLines = 0;
    rightPanelUsernameLabel.textAlignment = NSTextAlignmentCenter;
    [rightPanel addSubview:rightPanelUsernameLabel];
    rightPanelUsernameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelUserIDLabel = [[UILabel alloc] init];
    rightPanelUserIDLabel.text = [NSString stringWithFormat:@"Account ID %ld", (long)[VGPUserData getUserID]];
    rightPanelUserIDLabel.textColor = [UIColor grayColor];
    rightPanelUserIDLabel.font = VGP_FONT_LABEL_13;
    rightPanelUserIDLabel.numberOfLines = 0;
    rightPanelUserIDLabel.textAlignment = NSTextAlignmentCenter;
    [rightPanel addSubview:rightPanelUserIDLabel];
    rightPanelUserIDLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelEditProfileButton = [[UIButton alloc] init];
    [rightPanelEditProfileButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-blue-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelEditProfileButton setTitle:[VGPHelper localizationForString:@"profile.edit_profile"] forState:UIControlStateNormal];
    rightPanelEditProfileButton.titleLabel.font = VGP_FONT_LABEL_13;
    [rightPanelEditProfileButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelEditProfileButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanel addSubview:rightPanelEditProfileButton];
    rightPanelEditProfileButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelLinkButton = [[UIButton alloc] init];
    [rightPanelLinkButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-pink" andType:@"tiff"] forState:UIControlStateNormal];
    rightPanelLinkButton.titleLabel.font = VGP_FONT_LABEL_13;
    [rightPanelLinkButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLinkButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanel addSubview:rightPanelLinkButton];
    rightPanelLinkButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightPanelLogoutButton = [[UIButton alloc] init];
    [rightPanelLogoutButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-pink" andType:@"tiff"] forState:UIControlStateNormal];
    rightPanelLogoutButton.titleLabel.font = VGP_FONT_LABEL_13;
    [rightPanelLogoutButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLogoutButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanel addSubview:rightPanelLogoutButton];
    rightPanelLogoutButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // events
    [rightPanelEditProfileButton addTarget:self action:@selector(rightPanelEditProfileButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLinkButton addTarget:self action:@selector(rightPanelLinkButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLogoutButton addTarget:self action:@selector(rightPanelLogoutButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI{
    CGFloat screenWidth = [VGPHelper getScreenWidth];
    // CGFloat screenHeight = [VGPHelper getScreenHeight];
    CGFloat width = LAYOUT_WIDTH < screenWidth ? LAYOUT_WIDTH : screenWidth - screenWidth * LAYOUT_OFFSET;
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
    
    [rightPanelUsernameLabelLeftAnchor setActive:NO];
    [rightPanelUsernameLabelTopAnchor setActive:NO];
    [rightPanelUsernameLabelWidthAnchor setActive:NO];
    [rightPanelUsernameLabelHeightAnchor setActive:NO];
    rightPanelUsernameLabelLeftAnchor = [rightPanelUsernameLabel.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor];
    rightPanelUsernameLabelTopAnchor = [rightPanelUsernameLabel.topAnchor constraintEqualToAnchor:leftPanelImage.topAnchor constant:1];
    rightPanelUsernameLabelWidthAnchor = [rightPanelUsernameLabel.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8];
    rightPanelUsernameLabelHeightAnchor = [rightPanelUsernameLabel.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelUsernameLabelLeftAnchor setActive:YES];
    [rightPanelUsernameLabelTopAnchor setActive:YES];
    [rightPanelUsernameLabelWidthAnchor setActive:YES];
    [rightPanelUsernameLabelHeightAnchor setActive:YES];
    
    [rightPanelUserIDLabelCenterXAnchor setActive:NO];
    [rightPanelUserIDLabelTopAnchor setActive:NO];
    [rightPanelUserIDLabelWidthAnchor setActive:NO];
    [rightPanelUserIDLabelHeightAnchor setActive:NO];
    rightPanelUserIDLabelCenterXAnchor = [rightPanelUserIDLabel.centerXAnchor constraintEqualToAnchor:rightPanelUsernameLabel.centerXAnchor];
    rightPanelUserIDLabelTopAnchor = [rightPanelUserIDLabel.topAnchor constraintEqualToAnchor:rightPanelUsernameLabel.bottomAnchor constant:1];
    rightPanelUserIDLabelWidthAnchor = [rightPanelUserIDLabel.widthAnchor constraintEqualToAnchor:rightPanelUsernameLabel.widthAnchor multiplier:1];
    rightPanelUserIDLabelHeightAnchor = [rightPanelUserIDLabel.heightAnchor constraintEqualToAnchor:rightPanelUsernameLabel.heightAnchor multiplier:.5];
    [rightPanelUserIDLabelCenterXAnchor setActive:YES];
    [rightPanelUserIDLabelTopAnchor setActive:YES];
    [rightPanelUserIDLabelWidthAnchor setActive:YES];
    [rightPanelUserIDLabelHeightAnchor setActive:YES];
    
    [rightPanelEditProfileButtonCenterXAnchor setActive:NO];
    [rightPanelEditProfileButtonTopAnchor setActive:NO];
    [rightPanelEditProfileButtonWidthAnchor setActive:NO];
    [rightPanelEditProfileButtonHeightAnchor setActive:NO];
    rightPanelEditProfileButtonCenterXAnchor = [rightPanelEditProfileButton.centerXAnchor constraintEqualToAnchor:rightPanelUserIDLabel.centerXAnchor];
    rightPanelEditProfileButtonTopAnchor = [rightPanelEditProfileButton.topAnchor constraintEqualToAnchor:rightPanelUserIDLabel.bottomAnchor constant:width*0.02];
    rightPanelEditProfileButtonWidthAnchor = [rightPanelEditProfileButton.widthAnchor constraintEqualToAnchor:rightPanelUserIDLabel.widthAnchor multiplier:1];
    rightPanelEditProfileButtonHeightAnchor = [rightPanelEditProfileButton.heightAnchor constraintEqualToConstant:width*.077];
    [rightPanelEditProfileButtonCenterXAnchor setActive:YES];
    [rightPanelEditProfileButtonTopAnchor setActive:YES];
    [rightPanelEditProfileButtonWidthAnchor setActive:YES];
    [rightPanelEditProfileButtonHeightAnchor setActive:YES];
    
    [rightPanelLinkButtonLeftAnchor setActive:NO];
    [rightPanelLinkButtonTopAnchor setActive:NO];
    [rightPanelLinkButtonWidthAnchor setActive:NO];
    [rightPanelLinkButtonHeightAnchor setActive:NO];
    rightPanelLinkButtonLeftAnchor = [rightPanelLinkButton.leftAnchor constraintEqualToAnchor:rightPanelEditProfileButton.leftAnchor];
    rightPanelLinkButtonTopAnchor = [rightPanelLinkButton.topAnchor constraintEqualToAnchor:rightPanelEditProfileButton.bottomAnchor constant:width*0.01];
    rightPanelLinkButtonWidthAnchor = [rightPanelLinkButton.widthAnchor constraintEqualToAnchor:rightPanelEditProfileButton.widthAnchor multiplier:1];
    rightPanelLinkButtonHeightAnchor = [rightPanelLinkButton.heightAnchor constraintEqualToAnchor:rightPanelEditProfileButton.heightAnchor multiplier:1];
    [rightPanelLinkButtonLeftAnchor setActive:YES];
    [rightPanelLinkButtonTopAnchor setActive:YES];
    [rightPanelLinkButtonWidthAnchor setActive:YES];
    [rightPanelLinkButtonHeightAnchor setActive:YES];
    
    [rightPanelLogoutButtonLeftAnchor setActive:NO];
    [rightPanelLogoutButtonTopAnchor setActive:NO];
    [rightPanelLogoutButtonWidthAnchor setActive:NO];
    [rightPanelLogoutButtonHeightAnchor setActive:NO];
    rightPanelLogoutButtonLeftAnchor = [rightPanelLogoutButton.leftAnchor constraintEqualToAnchor:rightPanelLinkButton.leftAnchor];
    rightPanelLogoutButtonTopAnchor = [rightPanelLogoutButton.topAnchor constraintEqualToAnchor:rightPanelLinkButton.bottomAnchor constant:width*0.01];
    rightPanelLogoutButtonWidthAnchor = [rightPanelLogoutButton.widthAnchor constraintEqualToAnchor:rightPanelLinkButton.widthAnchor multiplier:1];
    rightPanelLogoutButtonHeightAnchor = [rightPanelLogoutButton.heightAnchor constraintEqualToAnchor:rightPanelLinkButton.heightAnchor multiplier:1];
    [rightPanelLogoutButtonLeftAnchor setActive:YES];
    [rightPanelLogoutButtonTopAnchor setActive:YES];
    [rightPanelLogoutButtonWidthAnchor setActive:YES];
    [rightPanelLogoutButtonHeightAnchor setActive:YES];
}

- (void)updateUIText{
    rightPanelUsernameLabel.text = [VGPUserData getUsername];
    rightPanelUserIDLabel.text = [NSString stringWithFormat:@"Account ID %ld", (long)[VGPUserData getUserID]];
    [rightPanelEditProfileButton setTitle:[VGPHelper localizationForString:@"profile.edit_profile"] forState:UIControlStateNormal];
    [rightPanelLinkButton setTitle:[VGPHelper localizationForString:@"profile.link"] forState:UIControlStateNormal];
    [rightPanelLogoutButton setTitle:[VGPHelper localizationForString:@"profile.logout"] forState:UIControlStateNormal];
}

- (void)rightPanelEditProfileButtonClick{
    [self showLoadingView];
    [VGPAPI getProfile:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
        [[VGPUI sharedInstance] showProfileEditController];
    } failure:^(NSError * _Nonnull error) {
        [self hideLoadingView];
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
    }];
}

- (void)rightPanelLinkButtonClick{
    [self showLoadingView];
    [VGPAPI getProfile:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
        [[VGPUI sharedInstance] showLinkAccountController];
    } failure:^(NSError * _Nonnull error) {
        [self hideLoadingView];
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
    }];
}

- (void)rightPanelLogoutButtonClick{
    /**
         @TODO:
         - CLEAR USER PROFILE
         - QUIT TO USER LOGIN
         */
    [[VGPInterface sharedInstance] logoutGame:^{
            MyLog(@"LOGOUT");
    }];
}


@end
