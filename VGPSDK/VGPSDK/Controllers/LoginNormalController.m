//
//  LoginNormalController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/4/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "LoginNormalController.h"
#import "VGPUI.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPLogger.h"
#import "VGPAPI.h"

@interface LoginNormalController () {
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
    
    UIButton *rightPanelLoginButton;
    UIButton *rightPanelRegisterButton;
    UIButton *rightPanelForgotPasswordButton;
}
@end

@implementation LoginNormalController

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
    
    // USERNAME
    rightPanelUsernameTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelUsernameTextFieldBackground];
    rightPanelUsernameTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelUsernameTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanelUsernameTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.1] setActive:YES];
    [[rightPanelUsernameTextFieldBackground.widthAnchor constraintEqualToConstant:width*.50] setActive:YES];
    [[rightPanelUsernameTextFieldBackground.heightAnchor constraintEqualToConstant:width*.0615] setActive:YES];
    
    rightPanelUsernameTextField = [[UITextField alloc] init];
    rightPanelUsernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    if (@available(iOS 11.0, *)) rightPanelUsernameTextField.textContentType = UITextContentTypeUsername;
    rightPanelUsernameTextField.placeholder = [VGPHelper localizationForString:@"login.right.username"];
    rightPanelUsernameTextField.font = VGP_FONT_LABEL_13;
    rightPanelUsernameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    rightPanelUsernameTextField.delegate = self;
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
    if (@available(iOS 11.0, *)) rightPanelPasswordTextField.textContentType = UITextContentTypePassword;
    rightPanelPasswordTextField.placeholder = [VGPHelper localizationForString:@"login.right.password"];
    rightPanelPasswordTextField.font = VGP_FONT_LABEL_13;
    rightPanelPasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    rightPanelPasswordTextField.delegate = self;
    [rightPanel addSubview:rightPanelPasswordTextField];
    
    rightPanelPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelPasswordTextField.leftAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelPasswordTextField.topAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.topAnchor] setActive:YES];
    [[rightPanelPasswordTextField.widthAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelPasswordTextField.heightAnchor constraintEqualToAnchor:rightPanelPasswordTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    // BUTTON
    rightPanelLoginButton = [[UIButton alloc] init];
    [rightPanelLoginButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelLoginButton setTitle:[VGPHelper localizationForString:@"login.right.login"] forState:UIControlStateNormal];
    [rightPanelLoginButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelLoginButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelLoginButton.titleLabel setFont:VGP_FONT_LABEL_15];
    rightPanelLoginButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelLoginButton];
    
    rightPanelLoginButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelLoginButton.centerXAnchor constraintEqualToAnchor:rightPanelPasswordTextField.centerXAnchor] setActive:YES];
    [[rightPanelLoginButton.topAnchor constraintEqualToAnchor:rightPanelPasswordTextField.bottomAnchor constant:width*0.01] setActive:YES];
    [[rightPanelLoginButton.widthAnchor constraintEqualToAnchor:rightPanelPasswordTextField.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelLoginButton.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    rightPanelRegisterButton = [[UIButton alloc] init];
    [rightPanelRegisterButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-green-small" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelRegisterButton setTitle:[VGPHelper localizationForString:@"login.right.register"] forState:UIControlStateNormal];
    [rightPanelRegisterButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelRegisterButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelRegisterButton.titleLabel setFont:VGP_FONT_LABEL_15];
    rightPanelRegisterButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelRegisterButton];
    
    rightPanelRegisterButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelRegisterButton.topAnchor constraintEqualToAnchor:rightPanelLoginButton.bottomAnchor constant:width*0.01] setActive:YES];
    [[rightPanelRegisterButton.leftAnchor constraintEqualToAnchor:rightPanelLoginButton.leftAnchor] setActive:YES];
    [[rightPanelRegisterButton.widthAnchor constraintEqualToAnchor:rightPanelLoginButton.widthAnchor multiplier:.49] setActive:YES];
    [[rightPanelRegisterButton.heightAnchor constraintEqualToConstant:width*.0615] setActive:YES];
    
    rightPanelForgotPasswordButton = [[UIButton alloc] init];
    [rightPanelForgotPasswordButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-pink-small" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelForgotPasswordButton setTitle:[VGPHelper localizationForString:@"login.right.forgot_password"] forState:UIControlStateNormal];
    [rightPanelForgotPasswordButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelForgotPasswordButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelForgotPasswordButton.titleLabel setFont:VGP_FONT_LABEL_15];
    rightPanelForgotPasswordButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelForgotPasswordButton];
    
    rightPanelForgotPasswordButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelForgotPasswordButton.topAnchor constraintEqualToAnchor:rightPanelRegisterButton.topAnchor constant:0] setActive:YES];
    [[rightPanelForgotPasswordButton.rightAnchor constraintEqualToAnchor:rightPanelLoginButton.rightAnchor] setActive:YES];
    [[rightPanelForgotPasswordButton.widthAnchor constraintEqualToAnchor:rightPanelRegisterButton.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelForgotPasswordButton.heightAnchor constraintEqualToAnchor:rightPanelRegisterButton.heightAnchor multiplier:1] setActive:YES];
    
    // events
    [rightCloseButton addTarget:self action:@selector(rightCloseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelLoginButton addTarget:self action:@selector(rightPanelLoginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelRegisterButton addTarget:self action:@selector(rightPanelRegisterButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelForgotPasswordButton addTarget:self action:@selector(rightPanelForgotPasswordButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUI {
    
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    rightPanelUsernameTextField.placeholder = [VGPHelper localizationForString:@"login.right.username"];
    rightPanelPasswordTextField.placeholder = [VGPHelper localizationForString:@"login.right.password"];
    [rightPanelLoginButton setTitle:[VGPHelper localizationForString:@"login.right.login"] forState:UIControlStateNormal];
    [rightPanelRegisterButton setTitle:[VGPHelper localizationForString:@"login.right.register"] forState:UIControlStateNormal];
    [rightPanelForgotPasswordButton setTitle:[VGPHelper localizationForString:@"login.right.forgot_password"] forState:UIControlStateNormal];
}

- (void)rightPanelLoginButtonClick
{
    [self showLoadingView];
    [[VGPLogger sharedInstance] loginNormalClick];
    
    NSString *username = [rightPanelUsernameTextField text];
    NSString *password = [rightPanelPasswordTextField text];
    
    [VGPAPI normalLogin:username password:password success:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
    } failure:^(NSError * _Nonnull error) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        [self hideLoadingView];
    }];
}

- (void)rightPanelRegisterButtonClick
{
    MyLog(@"rightPanelRegisterButtonClick");
    [[VGPUI sharedInstance] showRegisterController:^{
        // @TODO: TEST UI
    }];
}

- (void)rightPanelForgotPasswordButtonClick
{
    MyLog(@"rightPanelForgotPasswordButtonClick");
    [[VGPUI sharedInstance] showForgotController:^{
        // @TODO: TEST UI
    }];
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    MyLog(@"textField %@", textField);
    [textField resignFirstResponder];
    if(textField == rightPanelUsernameTextField) [rightPanelPasswordTextField becomeFirstResponder];
    if(textField == rightPanelPasswordTextField) [self rightPanelLoginButtonClick];
    return YES;
}

- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    [rightPanelUsernameTextField resignFirstResponder];
    [rightPanelPasswordTextField resignFirstResponder];
}

@end
