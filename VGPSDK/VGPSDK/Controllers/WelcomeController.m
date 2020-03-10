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

@interface WelcomeController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIImageView *leftPanelImage;
    UIButton *leftSupportButton;
    
    UIView *rightPanel;
    UIButton *rightPanelLoginNormal;
    UIButton *rightPanelLoginFacebook;
    UIButton *rightPanelLoginQuick;
    UIButton *rightPanelLoginApple;
}

@end

@implementation WelcomeController

- (instancetype)init {
    self = [super init];
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    return self;
}

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
    [panel addSubview:leftPanel];
    
    leftPanel.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftPanel.leftAnchor constraintEqualToAnchor:panel.leftAnchor] setActive:YES];
    [[leftPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor] setActive:YES];
    [[leftPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.48] setActive:YES];
    [[leftPanel.heightAnchor constraintEqualToAnchor:panel.heightAnchor] setActive:YES];
    
    leftPanelImage = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"img" andType:@"tiff"]];
    [leftPanel addSubview:leftPanelImage];

    leftPanelImage.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftPanelImage.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor] setActive:YES];
    [[leftPanelImage.topAnchor constraintEqualToAnchor:leftPanel.topAnchor constant:width*0.03] setActive:YES];
    [[leftPanelImage.widthAnchor constraintEqualToAnchor:leftPanel.widthAnchor multiplier:0.68f] setActive:YES];
    [[leftPanelImage.heightAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1] setActive:YES];
    
    leftSupportButton = [[UIButton alloc] init];
    [leftSupportButton setImage:[VGPHelper getUIImageWithImageName:@"btn-support" andType:@"tiff"] forState:UIControlStateNormal];
    [leftPanel addSubview:leftSupportButton];
    
    leftSupportButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftSupportButton.centerXAnchor constraintEqualToAnchor:leftPanel.centerXAnchor] setActive:YES];
    [[leftSupportButton.topAnchor constraintEqualToAnchor:leftPanelImage.bottomAnchor constant:width*0.02] setActive:YES];
    [[leftSupportButton.widthAnchor constraintEqualToAnchor:leftPanelImage.widthAnchor multiplier:1] setActive:YES];
    [[leftSupportButton.heightAnchor constraintEqualToAnchor:leftSupportButton.widthAnchor multiplier:.25] setActive:YES];
    
    // right
    rightPanel = [[UIView alloc] init];
    [panel addSubview:rightPanel];
    
    rightPanel.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanel.rightAnchor constraintEqualToAnchor:panel.rightAnchor] setActive:YES];
    [[rightPanel.centerYAnchor constraintEqualToAnchor:panel.centerYAnchor] setActive:YES];
    [[rightPanel.widthAnchor constraintEqualToAnchor:panel.widthAnchor multiplier:.52] setActive:YES];
    [[rightPanel.heightAnchor constraintEqualToAnchor:leftPanel.heightAnchor] setActive:YES];
    
    rightPanelLoginNormal = [[UIButton alloc] init];
    [rightPanelLoginNormal setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-vgp" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginNormal setTitle:[VGPHelper localizationForString:@"login.right.normal"] forState:UIControlStateNormal];
    [rightPanelLoginNormal setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginNormal.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginNormal.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginNormal.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelLoginNormal.contentEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
    [rightPanel addSubview:rightPanelLoginNormal];
    
    rightPanelLoginNormal.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelLoginNormal.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanelLoginNormal.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.06] setActive:YES];
    [[rightPanelLoginNormal.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8] setActive:YES];
    [[rightPanelLoginNormal.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    rightPanelLoginFacebook = [[UIButton alloc] init];
    [rightPanelLoginFacebook setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-facebook" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitle:[VGPHelper localizationForString:@"login.right.facebook"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginFacebook.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginFacebook.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginFacebook.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelLoginFacebook.contentEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
    [rightPanel addSubview:rightPanelLoginFacebook];
    
    rightPanelLoginFacebook.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelLoginFacebook.centerXAnchor constraintEqualToAnchor:rightPanelLoginNormal.centerXAnchor] setActive:YES];
    [[rightPanelLoginFacebook.topAnchor constraintEqualToAnchor:rightPanelLoginNormal.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelLoginFacebook.widthAnchor constraintEqualToAnchor:rightPanelLoginNormal.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelLoginFacebook.heightAnchor constraintEqualToAnchor:rightPanelLoginNormal.heightAnchor multiplier:1] setActive:YES];
    
    rightPanelLoginQuick = [[UIButton alloc] init];
    [rightPanelLoginQuick setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-quickplay" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitle:[VGPHelper localizationForString:@"login.right.quick"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginQuick.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginQuick.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginQuick.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelLoginQuick.contentEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
    [rightPanel addSubview:rightPanelLoginQuick];

    rightPanelLoginQuick.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelLoginQuick.centerXAnchor constraintEqualToAnchor:rightPanelLoginFacebook.centerXAnchor] setActive:YES];
    [[rightPanelLoginQuick.topAnchor constraintEqualToAnchor:rightPanelLoginFacebook.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelLoginQuick.widthAnchor constraintEqualToAnchor:rightPanelLoginFacebook.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelLoginQuick.heightAnchor constraintEqualToAnchor:rightPanelLoginFacebook.heightAnchor multiplier:1] setActive:YES];
    
    rightPanelLoginApple = [[UIButton alloc] init];
    [rightPanelLoginApple setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-login-apple" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitle:[VGPHelper localizationForString:@"login.right.apple"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginApple.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginApple.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelLoginApple.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelLoginApple.contentEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
    [rightPanel addSubview:rightPanelLoginApple];
    
    rightPanelLoginApple.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelLoginApple.centerXAnchor constraintEqualToAnchor:rightPanelLoginQuick.centerXAnchor] setActive:YES];
    [[rightPanelLoginApple.topAnchor constraintEqualToAnchor:rightPanelLoginQuick.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelLoginApple.widthAnchor constraintEqualToAnchor:rightPanelLoginQuick.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelLoginApple.heightAnchor constraintEqualToAnchor:rightPanelLoginQuick.heightAnchor multiplier:1] setActive:YES];
    
    // events
    [leftSupportButton addTarget:self action:@selector(leftSupportButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginNormal addTarget:self action:@selector(rightPanelLoginNormalClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginFacebook addTarget:self action:@selector(rightPanelLoginFacebookClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginQuick addTarget:self action:@selector(rightPanelLoginQuickClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginApple addTarget:self action:@selector(rightPanelLoginAppleClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self updateUIText];
}

- (void)updateUIText {
    [rightPanelLoginNormal setTitle:[VGPHelper localizationForString:@"login.right.normal"] forState:UIControlStateNormal];
    [rightPanelLoginFacebook setTitle:[VGPHelper localizationForString:@"login.right.facebook"] forState:UIControlStateNormal];
    [rightPanelLoginQuick setTitle:[VGPHelper localizationForString:@"login.right.quick"] forState:UIControlStateNormal];
    [rightPanelLoginApple setTitle:[VGPHelper localizationForString:@"login.right.apple"] forState:UIControlStateNormal];
}

- (void)leftSupportButtonClick
{
    MyLog(@"leftSupportButtonClick");
    if([[UIData getLocalization] isEqualToString:@"en"]){
        [VGPHelper changeLocalization:@"vi"];
    } else {
        [VGPHelper changeLocalization:@"en"];
    }
}

- (void)rightPanelLoginNormalClick
{
    MyLog(@"rightPanelLoginNormalClick");
    [[VGPUI sharedInstance] showLoginNormalController:^{
        // @TODO: TEST UI
        // [[VGPInterface sharedInstance].LoginNormalController rightPanelRegisterButtonClick];
        // [[VGPInterface sharedInstance].LoginNormalController rightPanelForgotPasswordButtonClick];
    }];
}

- (void)rightPanelLoginFacebookClick
{
    MyLog(@"rightPanelLoginFacebookClick");
}

- (void)rightPanelLoginQuickClick
{
    MyLog(@"rightPanelLoginQuickClick");
}

- (void)rightPanelLoginAppleClick
{
    MyLog(@"rightPanelLoginAppleClick");
}

@end
