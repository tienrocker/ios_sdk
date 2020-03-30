//
//  VerifyCodeControllerViewController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/4/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VerifyPhoneController.h"
#import "VGPUI.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPLogger.h"
#import "VGPAPI.h"

@interface VerifyPhoneController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIView *leftPanelImage;
    
    UIView *rightPanel;
    
    UIImageView *rightPanelCodeTextFieldBackground;
    UITextField IBOutlet *rightPanelCodeTextField;
    
    UIButton *rightPanelVerifyButton;
    UIButton *rightPanelResendButton;
}
@end

@implementation VerifyPhoneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = LAYOUT_WIDTH < VGP_SCREEN_WIDTH ? LAYOUT_WIDTH : VGP_SCREEN_WIDTH - VGP_SCREEN_WIDTH * LAYOUT_OFFSET;
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
    [panel addSubview:leftBackButtonImg];
    leftBackButtonImg.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftBackButtonImg.leftAnchor constraintEqualToAnchor:panel.leftAnchor constant:width*.02] setActive:YES];
    [[leftBackButtonImg.topAnchor constraintEqualToAnchor:panel.topAnchor constant:width*.02] setActive:YES];
    [[leftBackButtonImg.widthAnchor constraintEqualToConstant:width*.03] setActive:YES];
    [[leftBackButtonImg.heightAnchor constraintEqualToConstant:width*.04] setActive:YES];
    
    leftBackButtonText = [[UIButton alloc] init];
    leftBackButtonText.layer.zPosition = 3;
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
    
    // PHONE
    rightPanelCodeTextFieldBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [rightPanel addSubview:rightPanelCodeTextFieldBackground];
    rightPanelCodeTextFieldBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelCodeTextFieldBackground.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanelCodeTextFieldBackground.topAnchor constraintEqualToAnchor:rightPanel.topAnchor constant:width*0.1] setActive:YES];
    [[rightPanelCodeTextFieldBackground.widthAnchor constraintEqualToConstant:width*.50] setActive:YES];
    [[rightPanelCodeTextFieldBackground.heightAnchor constraintEqualToConstant:width*.0615] setActive:YES];
    
    rightPanelCodeTextField = [[UITextField alloc] init];
    [rightPanelCodeTextField setKeyboardType:UIKeyboardTypeNumberPad];
    if (@available(iOS 12.0, *)) rightPanelCodeTextField.textContentType = UITextContentTypeOneTimeCode;
    rightPanelCodeTextField.font = VGP_FONT_LABEL_13;
    rightPanelCodeTextField.layer.sublayerTransform = CATransform3DMakeTranslation(width*.02,0,0);
    rightPanelCodeTextField.delegate = self;
    [rightPanel addSubview:rightPanelCodeTextField];
    
    rightPanelCodeTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelCodeTextField.leftAnchor constraintEqualToAnchor:rightPanelCodeTextFieldBackground.leftAnchor] setActive:YES];
    [[rightPanelCodeTextField.topAnchor constraintEqualToAnchor:rightPanelCodeTextFieldBackground.topAnchor] setActive:YES];
    [[rightPanelCodeTextField.widthAnchor constraintEqualToAnchor:rightPanelCodeTextFieldBackground.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelCodeTextField.heightAnchor constraintEqualToAnchor:rightPanelCodeTextFieldBackground.heightAnchor multiplier:1] setActive:YES];
    
    // BUTTON
    rightPanelVerifyButton = [[UIButton alloc] init];
    [rightPanelVerifyButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelVerifyButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelVerifyButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelVerifyButton.titleLabel setFont:VGP_FONT_LABEL_15];
    rightPanelVerifyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelVerifyButton];
    
    rightPanelVerifyButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelVerifyButton.centerXAnchor constraintEqualToAnchor:rightPanelCodeTextField.centerXAnchor] setActive:YES];
    [[rightPanelVerifyButton.topAnchor constraintEqualToAnchor:rightPanelCodeTextField.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelVerifyButton.widthAnchor constraintEqualToAnchor:rightPanelCodeTextField.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelVerifyButton.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    // RESEND BUTTON
    rightPanelResendButton = [[UIButton alloc] init];
    [rightPanelResendButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-green-big" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelResendButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelResendButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [rightPanelResendButton.titleLabel setFont:VGP_FONT_LABEL_13];
    rightPanelResendButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelResendButton];
    
    rightPanelResendButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelResendButton.centerXAnchor constraintEqualToAnchor:rightPanelVerifyButton.centerXAnchor] setActive:YES];
    [[rightPanelResendButton.topAnchor constraintEqualToAnchor:rightPanelVerifyButton.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelResendButton.widthAnchor constraintEqualToAnchor:rightPanelVerifyButton.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelResendButton.heightAnchor constraintEqualToAnchor:rightPanelVerifyButton.heightAnchor multiplier:.7] setActive:YES];
    
    // events
    [rightCloseButton addTarget:self action:@selector(rightCloseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelVerifyButton addTarget:self action:@selector(rightPanelVerifyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelResendButton addTarget:self action:@selector(rightPanelResendButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [rightPanelCodeTextField becomeFirstResponder];
}

- (void)updateUI {
    
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    rightPanelCodeTextField.placeholder = [VGPHelper localizationForString:@"verify.code"];
    [rightPanelVerifyButton setTitle:[VGPHelper localizationForString:@"verify"] forState:UIControlStateNormal];
    [rightPanelResendButton setTitle:[VGPHelper localizationForString:@"resend"] forState:UIControlStateNormal];
}

- (void)rightPanelVerifyButtonClick
 {
    [self showLoadingView];
    [rightPanelCodeTextField resignFirstResponder];
    rightPanelCodeTextField.text = @"";
    
    NSString *code = rightPanelCodeTextField.text;
    
    [VGPAPI verifyPhone:code success:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
        
        [VGPAPI getProfile:^(id  _Nonnull responseObject) {
            [self leftBackButtonClick];
        } failure:^(NSError * _Nonnull error) {
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        }];
    } failure:^(NSError * _Nonnull error) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        [self hideLoadingView];
    }];
}

- (void)rightPanelResendButtonClick
 {
    [self showLoadingView];
    [rightPanelCodeTextField resignFirstResponder];
    rightPanelCodeTextField.text = @"";
    
    [VGPAPI resendVerifyPhone:^(id  _Nonnull responseObject) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"notification"] message:[VGPHelper localizationForString:@"resend.success"] handler:^(UIAlertAction * _Nonnull action) {
            [self hideLoadingView];
            [self->rightPanelCodeTextField becomeFirstResponder];
        }];
    } failure:^(NSError * _Nonnull error) {
        [self hideLoadingView];
        if([error code] == 201) {
            // người dùng không còn mã xác thực nên quay về màn hình cũ
            [self leftBackButtonClick];
        } else {
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        }
    }];
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    MyLog(@"textField %@", textField);
    [textField resignFirstResponder];
    return YES;
}

- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    [rightPanelCodeTextField resignFirstResponder];
}

@end
