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

@interface ProfileController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIView *leftPanelImage;

    UIView *rightPanel;
    UILabel *rightPanalUsernameLabel;
    UILabel *rightPanelUserIDLabel;
    UIButton *rightPanelEditProfileButton;
    UIButton *rightPanelLogoutButton;
}
@end

@implementation ProfileController


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
    
    rightPanalUsernameLabel = [[UILabel alloc] init];
    rightPanalUsernameLabel.text = [VGPUserData getUsername];
    rightPanalUsernameLabel.textColor = VGP_MAIN_TEXT_COLOR;
    rightPanalUsernameLabel.font = [UIFont fontWithName:@"LexendDeca-Regular" size:20];
    rightPanalUsernameLabel.numberOfLines = 0;
    rightPanalUsernameLabel.textAlignment = NSTextAlignmentCenter;
    [rightPanel addSubview:rightPanalUsernameLabel];
    
    rightPanalUsernameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanalUsernameLabel.topAnchor constraintEqualToAnchor:leftPanelImage.topAnchor constant:width*.01] setActive:YES];
    [[rightPanalUsernameLabel.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanalUsernameLabel.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8] setActive:YES];
    [[rightPanalUsernameLabel.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    [rightPanalUsernameLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    rightPanelUserIDLabel = [[UILabel alloc] init];
    rightPanelUserIDLabel.text = [NSString stringWithFormat:@"Account ID %@", [VGPUserData getUserID]];
    rightPanelUserIDLabel.textColor = [UIColor grayColor];
    rightPanelUserIDLabel.font = [UIFont fontWithName:@"LexendDeca-Regular" size:13];
    rightPanelUserIDLabel.numberOfLines = 0;
    rightPanelUserIDLabel.textAlignment = NSTextAlignmentCenter;
    [rightPanel addSubview:rightPanelUserIDLabel];
    
    rightPanelUserIDLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelUserIDLabel.topAnchor constraintEqualToAnchor:rightPanalUsernameLabel.bottomAnchor constant:0] setActive:YES];
    [[rightPanelUserIDLabel.centerXAnchor constraintEqualToAnchor:rightPanalUsernameLabel.centerXAnchor] setActive:YES];
    [[rightPanelUserIDLabel.widthAnchor constraintEqualToAnchor:rightPanalUsernameLabel.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelUserIDLabel.heightAnchor constraintEqualToAnchor:rightPanalUsernameLabel.heightAnchor multiplier:.5] setActive:YES];
    [rightPanelUserIDLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    rightPanelEditProfileButton = [[UIButton alloc] init];
    [rightPanelEditProfileButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-blue-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelEditProfileButton setTitle:[VGPHelper localizationForString:@"profile.edit_profile"] forState:UIControlStateNormal];
    [rightPanelEditProfileButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelEditProfileButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanel addSubview:rightPanelEditProfileButton];
    
    rightPanelEditProfileButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelEditProfileButton.centerXAnchor constraintEqualToAnchor:rightPanelUserIDLabel.centerXAnchor] setActive:YES];
    [[rightPanelEditProfileButton.topAnchor constraintEqualToAnchor:rightPanelUserIDLabel.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelEditProfileButton.widthAnchor constraintEqualToAnchor:rightPanelUserIDLabel.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelEditProfileButton.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    rightPanelLogoutButton = [[UIButton alloc] init];
    [rightPanelLogoutButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-pink" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLogoutButton setTitle:[VGPHelper localizationForString:@"profile.logout"] forState:UIControlStateNormal];
    [rightPanelLogoutButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLogoutButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanel addSubview:rightPanelLogoutButton];
    
    rightPanelLogoutButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelLogoutButton.topAnchor constraintEqualToAnchor:rightPanelEditProfileButton.bottomAnchor constant:width*0.01] setActive:YES];
    [[rightPanelLogoutButton.leftAnchor constraintEqualToAnchor:rightPanelEditProfileButton.leftAnchor] setActive:YES];
    [[rightPanelLogoutButton.widthAnchor constraintEqualToAnchor:rightPanelEditProfileButton.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelLogoutButton.heightAnchor constraintEqualToAnchor:rightPanelEditProfileButton.heightAnchor multiplier:1] setActive:YES];
    
    // events
    [rightPanelEditProfileButton addTarget:self action:@selector(rightPanelEditProfileButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLogoutButton addTarget:self action:@selector(rightPanelLogoutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self updateUIText];
}

- (void)updateUIText {
    rightPanelUserIDLabel.text = [NSString stringWithFormat:@"Account ID %@", [VGPUserData getUserID]];
    [rightPanelEditProfileButton setTitle:[VGPHelper localizationForString:@"profile.edit_profile"] forState:UIControlStateNormal];
    [rightPanelLogoutButton setTitle:[VGPHelper localizationForString:@"profile.logout"] forState:UIControlStateNormal];
}

- (void)rightPanelEditProfileButtonClick
{
    MyLog(@"rightPanelEditProfileButtonClick");
    [[VGPUI sharedInstance] showProfileEditController];
}

- (void)rightPanelLogoutButtonClick
{
    MyLog(@"rightPanelLogoutButtonClick");
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
