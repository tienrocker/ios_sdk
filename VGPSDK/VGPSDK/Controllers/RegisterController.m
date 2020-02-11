//
//  RegisterController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/4/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "RegisterController.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUI.h"

@interface RegisterController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIView *leftPanelImage;

    UIView *rightPanel;
    UIImageView *rightPanelUsernameTextFieldBackground;
    UITextField IBOutlet *rightPanelUsernameTextField;
    UIImageView *rightPanelPasswordTextFieldBackground;
    UITextField IBOutlet *rightPanelPasswordTextField;
    UIImageView *rightPanelRePasswordTextFieldBackground;
    UITextField IBOutlet *rightPanelRePasswordTextField;
    UIImageView *rightPanelEmailTextFieldBackground;
    UITextField IBOutlet *rightPanelEmailTextField;
    UIButton *rightPanelRegisterButton;
}
@end

@implementation RegisterController

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
    
    // USERNAME
    rightPanelUsernameTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelUsernameTextFieldBackground];
    rightPanelUsernameTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelUsernameTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanelUsernameTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.06] setActive:YES];
    [[rightPanelUsernameTextFieldBackground.widthAnchor constraintEqualToConstant:width*.50] setActive:YES];
    [[rightPanelUsernameTextFieldBackground.heightAnchor constraintEqualToConstant:width*.0615] setActive:YES];
    
    rightPanelUsernameTextField = [[UITextField alloc] init];
    rightPanelUsernameTextField.placeholder = [VGPHelper localizationForString:@"login.right.username"];
    rightPanelUsernameTextField.font = [UIFont systemFontOfSize:13];
    rightPanelUsernameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    [rightPanel addSubview:rightPanelUsernameTextField];
    
    rightPanelUsernameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelUsernameTextField.leftAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelUsernameTextField.topAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.topAnchor] setActive:YES];
    [[rightPanelUsernameTextField.widthAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelUsernameTextField.heightAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    // PASSWORD
    rightPanelPasswordTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelPasswordTextFieldBackground];
    rightPanelPasswordTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelPasswordTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelPasswordTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.bottomAnchor constant:width*.01] setActive:YES];
    [[rightPanelPasswordTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelPasswordTextFieldBackground.heightAnchor constraintEqualToAnchor:rightPanelUsernameTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    rightPanelPasswordTextField = [[UITextField alloc] init];
    rightPanelPasswordTextField.secureTextEntry = YES;
    rightPanelPasswordTextField.placeholder = [VGPHelper localizationForString:@"login.right.password"];
    rightPanelPasswordTextField.font = [UIFont systemFontOfSize:13];
    rightPanelPasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    [rightPanel addSubview:rightPanelPasswordTextField];
    
    rightPanelPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelPasswordTextField.leftAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelPasswordTextField.topAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.topAnchor] setActive:YES];
    [[rightPanelPasswordTextField.widthAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelPasswordTextField.heightAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    // RE-PASSWORD
    rightPanelRePasswordTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelRePasswordTextFieldBackground];
    rightPanelRePasswordTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelRePasswordTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelRePasswordTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.bottomAnchor constant:width*.01] setActive:YES];
    [[rightPanelRePasswordTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelRePasswordTextFieldBackground.heightAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    rightPanelRePasswordTextField = [[UITextField alloc] init];
    rightPanelRePasswordTextField.secureTextEntry = YES;
    rightPanelRePasswordTextField.placeholder = [VGPHelper localizationForString:@"login.right.repassword"];
    rightPanelRePasswordTextField.font = [UIFont systemFontOfSize:13];
    rightPanelRePasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    [rightPanel addSubview:rightPanelRePasswordTextField];
    
    rightPanelRePasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelRePasswordTextField.leftAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelRePasswordTextField.topAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.topAnchor] setActive:YES];
    [[rightPanelRePasswordTextField.widthAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelRePasswordTextField.heightAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    // EMAIL
    rightPanelEmailTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelEmailTextFieldBackground];
    rightPanelEmailTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelEmailTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelEmailTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.bottomAnchor constant:width*.01] setActive:YES];
    [[rightPanelEmailTextFieldBackground.widthAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelEmailTextFieldBackground.heightAnchor constraintEqualToAnchor:rightPanelRePasswordTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    rightPanelEmailTextField = [[UITextField alloc] init];
    rightPanelEmailTextField.secureTextEntry = YES;
    rightPanelEmailTextField.placeholder = [VGPHelper localizationForString:@"login.right.email"];
    rightPanelEmailTextField.font = [UIFont systemFontOfSize:13];
    rightPanelEmailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    [rightPanel addSubview:rightPanelEmailTextField];
    
    rightPanelEmailTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelEmailTextField.leftAnchor constraintEqualToAnchor:rightPanelEmailTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelEmailTextField.topAnchor constraintEqualToAnchor:rightPanelEmailTextFieldBackground.topAnchor] setActive:YES];
    [[rightPanelEmailTextField.widthAnchor constraintEqualToAnchor:rightPanelEmailTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelEmailTextField.heightAnchor constraintEqualToAnchor:rightPanelEmailTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    
    // BUTTON
    rightPanelRegisterButton = [[UIButton alloc] init];
    [rightPanelRegisterButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-green-small" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelRegisterButton setTitle:[VGPHelper localizationForString:@"login.right.register"] forState:UIControlStateNormal];
    [rightPanelRegisterButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelRegisterButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelRegisterButton.titleLabel setFont:[UIFont fontWithName:@"LexendDeca-Regular" size:15]];
    rightPanelRegisterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelRegisterButton];
    
    rightPanelRegisterButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelRegisterButton.centerXAnchor constraintEqualToAnchor:rightPanelEmailTextFieldBackground.centerXAnchor] setActive:YES];
    [[rightPanelRegisterButton.topAnchor constraintEqualToAnchor:rightPanelEmailTextFieldBackground.bottomAnchor constant:width*0.01] setActive:YES];
    [[rightPanelRegisterButton.widthAnchor constraintEqualToAnchor:rightPanelEmailTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelRegisterButton.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    // events
    [rightPanelRegisterButton addTarget:self action:@selector(rightPanelRegisterButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self updateUIText];
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    rightPanelUsernameTextField.placeholder = [VGPHelper localizationForString:@"login.right.username"];
    rightPanelPasswordTextField.placeholder = [VGPHelper localizationForString:@"login.right.password"];
    rightPanelRePasswordTextField.placeholder = [VGPHelper localizationForString:@"login.right.repassword"];
    rightPanelEmailTextField.placeholder = [VGPHelper localizationForString:@"login.right.email"];
    [rightPanelRegisterButton setTitle:[VGPHelper localizationForString:@"login.right.register"] forState:UIControlStateNormal];
}

- (void)rightPanelRegisterButtonClick
{
    MyLog(@"rightPanelRegisterButtonClick");
}

@end
