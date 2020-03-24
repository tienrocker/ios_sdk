//
//  ForgotPhoneController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/17/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ForgotPhoneController.h"
#import "VGPUI.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUserData.h"

@interface ForgotPhoneController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIView *leftPanelImage;

    UIView *rightPanel;
    UILabel *rightPanelForgotPhoneText1Label;
    UIButton *rightPanelForgotPhone1Button;
    UIButton *rightPanelForgotPhone2Button;
}

@end

@implementation ForgotPhoneController

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
    
    rightPanelForgotPhoneText1Label = [[UILabel alloc] init];
    rightPanelForgotPhoneText1Label.text = [VGPHelper localizationForString:@"forgot.right.phone.text1"];
    rightPanelForgotPhoneText1Label.textColor = [UIColor blackColor];
    rightPanelForgotPhoneText1Label.font = VGP_FONT_LABEL_13;
    rightPanelForgotPhoneText1Label.numberOfLines = 0;
    [rightPanelForgotPhoneText1Label setTextAlignment:NSTextAlignmentLeft];
    [rightPanel addSubview:rightPanelForgotPhoneText1Label];
    
    rightPanelForgotPhoneText1Label.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelForgotPhoneText1Label.topAnchor constraintEqualToAnchor:leftPanelImage.topAnchor constant:0] setActive:YES];
    [[rightPanelForgotPhoneText1Label.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanelForgotPhoneText1Label.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8] setActive:YES];
    [[rightPanelForgotPhoneText1Label.heightAnchor constraintEqualToConstant:width*0.05] setActive:YES];
    [rightPanelForgotPhoneText1Label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    rightPanelForgotPhone1Button = [[UIButton alloc] init];
    rightPanelForgotPhone1Button.layer.cornerRadius = 5;
    rightPanelForgotPhone1Button.layer.borderWidth = 2;
    rightPanelForgotPhone1Button.layer.borderColor = VGP_MAIN_TEXT_COLOR.CGColor;
    
    [rightPanelForgotPhone1Button setTitle:[VGPHelper localizationForString:@"profile.protect.phone"] forState:UIControlStateNormal];
    [rightPanelForgotPhone1Button setTitleColor:VGP_MAIN_TEXT_COLOR forState:UIControlStateNormal];
    rightPanelForgotPhone1Button.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelForgotPhone1Button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightPanel addSubview:rightPanelForgotPhone1Button];
    
    rightPanelForgotPhone1Button.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelForgotPhone1Button.centerXAnchor constraintEqualToAnchor:rightPanelForgotPhoneText1Label.centerXAnchor] setActive:YES];
    [[rightPanelForgotPhone1Button.topAnchor constraintEqualToAnchor:rightPanelForgotPhoneText1Label.bottomAnchor constant:width*0.02] setActive:YES];
    [[rightPanelForgotPhone1Button.widthAnchor constraintEqualToAnchor:rightPanelForgotPhoneText1Label.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelForgotPhone1Button.heightAnchor constraintEqualToConstant:width*.077] setActive:YES];
    
    rightPanelForgotPhoneText1Label = [[UILabel alloc] init];
    rightPanelForgotPhoneText1Label.text = [VGPHelper localizationForString:@"forgot.right.phone.text1"];
    rightPanelForgotPhoneText1Label.textColor = [UIColor blackColor];
    rightPanelForgotPhoneText1Label.font = VGP_FONT_LABEL_13;
    rightPanelForgotPhoneText1Label.numberOfLines = 0;
    [rightPanelForgotPhoneText1Label setTextAlignment:NSTextAlignmentLeft];
    [rightPanel addSubview:rightPanelForgotPhoneText1Label];
    
    rightPanelForgotPhoneText1Label.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelForgotPhoneText1Label.topAnchor constraintEqualToAnchor:leftPanelImage.topAnchor constant:0] setActive:YES];
    [[rightPanelForgotPhoneText1Label.leftAnchor constraintEqualToAnchor:rightPanel.leftAnchor] setActive:YES];
    [[rightPanelForgotPhoneText1Label.widthAnchor constraintEqualToAnchor:rightPanel.widthAnchor multiplier:.8] setActive:YES];
    [[rightPanelForgotPhoneText1Label.heightAnchor constraintEqualToConstant:width*0.05] setActive:YES];
    [rightPanelForgotPhoneText1Label setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    
    rightPanelForgotPhone2Button = [[UIButton alloc] init];
    [rightPanelForgotPhone2Button setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-forgot-byphone" andType:@"tiff"] forState:UIControlStateNormal];
    [rightPanelForgotPhone2Button setTitle:[VGPHelper localizationForString:@"send"] forState:UIControlStateNormal];
    [rightPanelForgotPhone2Button setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    rightPanelForgotPhone2Button.titleLabel.adjustsFontSizeToFitWidth = YES;
    rightPanelForgotPhone2Button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    rightPanelForgotPhone2Button.contentEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
    [rightPanel addSubview:rightPanelForgotPhone2Button];
    
    rightPanelForgotPhone2Button.translatesAutoresizingMaskIntoConstraints = NO;
    [[rightPanelForgotPhone2Button.topAnchor constraintEqualToAnchor:rightPanelForgotPhone1Button.bottomAnchor constant:width*0.01] setActive:YES];
    [[rightPanelForgotPhone2Button.leftAnchor constraintEqualToAnchor:rightPanelForgotPhone1Button.leftAnchor] setActive:YES];
    [[rightPanelForgotPhone2Button.widthAnchor constraintEqualToAnchor:rightPanelForgotPhone1Button.widthAnchor multiplier:1] setActive:YES];
    [[rightPanelForgotPhone2Button.heightAnchor constraintEqualToAnchor:rightPanelForgotPhone1Button.heightAnchor multiplier:1] setActive:YES];
    
    // events
    [rightPanelForgotPhone1Button addTarget:self action:@selector(rightPanelForgotPhone1ButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightPanelForgotPhone2Button addTarget:self action:@selector(rightPanelForgotPhone2ButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    rightPanelForgotPhoneText1Label.text = [VGPHelper localizationForString:@"forgot.right.phone.text1"];
    [rightPanelForgotPhone1Button setTitle:[VGPHelper localizationForString:@"profile.protect.phone"] forState:UIControlStateNormal];
    [rightPanelForgotPhone2Button setTitle:[VGPHelper localizationForString:@"send"] forState:UIControlStateNormal];
}

- (void)rightPanelForgotPhone1ButtonClick {
    MyLog(@"rightPanelForgotPhone1ButtonClick");
    [self composeSMS];
}

- (void)rightPanelForgotPhone2ButtonClick {
    MyLog(@"rightPanelForgotPhone2ButtonClick");
    [self composeSMS];
}

- (void)composeSMS {
    NSString *phone = @"";
    NSString *sendMessage = @"FORGOT PASSWORD";
    NSString *sms = [NSString stringWithFormat:@"sms:%@&body=%@", phone, sendMessage];
    NSString *url = [sms stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
