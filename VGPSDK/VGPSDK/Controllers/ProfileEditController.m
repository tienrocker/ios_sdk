//
//  ProfileEditController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/11/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ProfileEditController.h"
#import "VGPUI.h"
#import "VGPInterface.h"
#import "VGPHelper.h"
#import "VGPUserData.h"

@interface ProfileEditController () {
    UIImageView *imgLayout;
    UIView *panel;
    UIButton *rightCloseButton;
    
    UIView *leftPanel;
    UIButton *leftBackButtonImg;
    UIButton *leftBackButtonText;
    UIView *leftPanelImage;
    
    UIScrollView *scrollView;
    UIImageView *iconPersonalProfileTextLabel;
    UILabel *personalProfileTextLabel;
    UIView *personalProfileTextLabelNav;
}

@end

@implementation ProfileEditController

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
    
    scrollView = [[UIScrollView alloc] init];
    // scrollView.backgroundColor = [UIColor redColor];
    [scrollView layoutIfNeeded]; //set a frame based on constraints
    scrollView.contentSize = CGSizeMake(width*0.8, width);
    
    [panel addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [[scrollView.topAnchor constraintEqualToAnchor:panel.topAnchor constant:width*0.06] setActive:YES];
    [[scrollView.leftAnchor constraintEqualToAnchor:panel.leftAnchor constant:width*0.1] setActive:YES];
    [[scrollView.widthAnchor constraintEqualToConstant:width*0.8] setActive:YES];
    [[scrollView.heightAnchor constraintEqualToConstant:width*0.4] setActive:YES];
    
    //
    iconPersonalProfileTextLabel = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"icon-info-grey" andType:@"tiff"]];
    [scrollView addSubview:iconPersonalProfileTextLabel];
    iconPersonalProfileTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[iconPersonalProfileTextLabel.topAnchor constraintEqualToAnchor:scrollView.topAnchor constant:width*0.02] setActive:YES];
    [[iconPersonalProfileTextLabel.leftAnchor constraintEqualToAnchor:scrollView.leftAnchor constant:0] setActive:YES];
    [[iconPersonalProfileTextLabel.widthAnchor constraintEqualToConstant:width*0.02] setActive:YES];
    [[iconPersonalProfileTextLabel.heightAnchor constraintEqualToConstant:width*0.02] setActive:YES];
    
    personalProfileTextLabel = [[UILabel alloc] init];
    personalProfileTextLabel.text = @"Thông tin cá nhân";
    personalProfileTextLabel.adjustsFontSizeToFitWidth = YES;
    [personalProfileTextLabel setFont:[UIFont fontWithName:@"LexendDeca-Regular" size:13]];
    [personalProfileTextLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:personalProfileTextLabel];
    personalProfileTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalProfileTextLabel.topAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.topAnchor constant:0] setActive:YES];
    [[personalProfileTextLabel.leftAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.rightAnchor constant:width*.01] setActive:YES];
    [[personalProfileTextLabel.widthAnchor constraintEqualToAnchor:scrollView.widthAnchor multiplier:1] setActive:YES];
    [[personalProfileTextLabel.heightAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.heightAnchor multiplier:1] setActive:YES];
    
    personalProfileTextLabelNav = [[UIView alloc] init];
    personalProfileTextLabelNav.backgroundColor = [UIColor blackColor];
    [scrollView addSubview:personalProfileTextLabelNav];
    personalProfileTextLabelNav.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalProfileTextLabelNav.topAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.bottomAnchor constant:width*.005] setActive:YES];
    [[personalProfileTextLabelNav.leftAnchor constraintEqualToAnchor:scrollView.leftAnchor constant:0] setActive:YES];
    [[personalProfileTextLabelNav.widthAnchor constraintEqualToAnchor:scrollView.widthAnchor multiplier:1] setActive:YES];
    [[personalProfileTextLabelNav.heightAnchor constraintEqualToConstant:width*.001] setActive:YES];
    
//    UIView *test = [[UIView alloc] init];
//    test.backgroundColor = [UIColor redColor];
//    [scrollView addSubview:test];
//    test.translatesAutoresizingMaskIntoConstraints = NO;
//    [[test.topAnchor constraintEqualToAnchor:personalProfileTextLabelNav.bottomAnchor constant:width*.005] setActive:YES];
//    [[test.leftAnchor constraintEqualToAnchor:scrollView.leftAnchor constant:0] setActive:YES];
//    [[test.widthAnchor constraintEqualToAnchor:scrollView.widthAnchor multiplier:1] setActive:YES];
//    [[test.heightAnchor constraintEqualToConstant:width*1] setActive:YES];
    
    [self updateUIText];
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
}

@end
