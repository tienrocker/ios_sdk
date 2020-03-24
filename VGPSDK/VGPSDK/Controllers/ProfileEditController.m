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
#import "VGPAPI.h"
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
    NSDateFormatter *dateFormatter;
    
    // ================== BASIC ==================
    UIImageView *iconPersonalProfileTextLabel;
    UILabel *personalProfileTextLabel;
    UIView *personalProfileTextLabelNav;
    
    UILabel *nameLabel;
    UIImageView *nameInputBackground;
    UITextField *nameInputTextField;
    
    NSNumber *genderValue;
    UILabel *genderLabel;
    UIImageView *genderInputBackground;
    UITextField *genderInputTextField;
    UIButton *genderButton;
    
    UILabel *birthdayLabel;
    UIImageView *birthdayInputBackground;
    UITextField *birthdayInputTextField;
    UIDatePicker *birthdayPicker;
    
    UILabel *addressLabel;
    UIImageView *addressInputBackground;
    UITextField *addressInputTextField;
    
    // ================== ADVANCE ==================
    UIImageView *iconPersonalSecurityTextLabel;
    UILabel *personalSecurityTextLabel;
    UIView *personalSecurityTextLabelNav;
    
    UILabel *personalIDLabel;
    UIImageView *personalIDInputBackground;
    UITextField *personalIDInputTextField;
    
    UILabel *dateIDLabel;
    UIImageView *dateIDInputBackground;
    UITextField *dateIDInputTextField;
    UIDatePicker *dateIDPicker;
    
    UILabel *placeIDLabel;
    UIImageView *placeIDInputBackground;
    UITextField *placeIDInputTextField;
    
    UILabel *phoneLabel;
    UIImageView *phoneInputBackground;
    UITextField *phoneInputTextField;
    UIButton *phoneButton;
    
    UILabel *emailLabel;
    UIImageView *emailInputBackground;
    UITextField *emailInputTextField;
    UIButton *emailButton;
    
    UIButton *updateProfileButton;
}

@end

@implementation ProfileEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:VGP_USER_DATE_FORMAT];
    }
    
    CGFloat screenWidth = [VGPHelper getScreenWidth];
    // CGFloat screenHeight = [VGPHelper getScreenHeight];
    CGFloat width = LAYOUT_WIDTH < screenWidth ? LAYOUT_WIDTH : screenWidth - screenWidth * LAYOUT_OFFSET;
    CGFloat height = (LAYOUT_HEIGHT / LAYOUT_WIDTH) * width;
    CGFloat padding = width * 0.02;
    
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
    [[leftBackButtonImg.leftAnchor constraintEqualToAnchor:panel.leftAnchor constant:padding] setActive:YES];
    [[leftBackButtonImg.topAnchor constraintEqualToAnchor:panel.topAnchor constant:padding] setActive:YES];
    [[leftBackButtonImg.widthAnchor constraintEqualToConstant:width*.03] setActive:YES];
    [[leftBackButtonImg.heightAnchor constraintEqualToConstant:width*.04] setActive:YES];
    
    leftBackButtonText = [[UIButton alloc] init];
    leftBackButtonText.layer.zPosition = 3;
    [leftBackButtonText setTitleColor:VGP_MAIN_TEXT_COLOR forState:UIControlStateNormal];
    leftBackButtonText.titleLabel.adjustsFontSizeToFitWidth = YES;
    [leftBackButtonText.titleLabel setFont:VGP_FONT_LABEL_13];
    leftBackButtonText.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [panel addSubview:leftBackButtonText];
    leftBackButtonText.translatesAutoresizingMaskIntoConstraints = NO;
    [[leftBackButtonText.topAnchor constraintEqualToAnchor:leftBackButtonImg.topAnchor constant:0] setActive:YES];
    [[leftBackButtonText.leftAnchor constraintEqualToAnchor:leftBackButtonImg.rightAnchor constant:padding] setActive:YES];
    [[leftBackButtonText.widthAnchor constraintEqualToConstant:width*.5] setActive:YES];
    [[leftBackButtonText.heightAnchor constraintEqualToAnchor:leftBackButtonImg.heightAnchor multiplier:1] setActive:YES];
    
    [leftBackButtonImg addTarget:self action:@selector(leftBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBackButtonText addTarget:self action:@selector(leftBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // ===================================
    
    scrollView = [[UIScrollView alloc] init];
    // scrollView.backgroundColor = [UIColor redColor];
    [scrollView layoutIfNeeded]; //set a frame based on constraints
    scrollView.contentSize = CGSizeMake(width*0.8, width*.85);
    
    [panel addSubview:scrollView];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [[scrollView.topAnchor constraintEqualToAnchor:panel.topAnchor constant:width*0.06] setActive:YES];
    [[scrollView.leftAnchor constraintEqualToAnchor:panel.leftAnchor constant:width*0.1] setActive:YES];
    [[scrollView.widthAnchor constraintEqualToConstant:width*0.8] setActive:YES];
    [[scrollView.heightAnchor constraintEqualToConstant:width*0.4] setActive:YES];
    
    // ================== BASIC ==================
    iconPersonalProfileTextLabel = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"icon-info-grey" andType:@"tiff"]];
    [scrollView addSubview:iconPersonalProfileTextLabel];
    iconPersonalProfileTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[iconPersonalProfileTextLabel.topAnchor constraintEqualToAnchor:scrollView.topAnchor constant:padding] setActive:YES];
    [[iconPersonalProfileTextLabel.leftAnchor constraintEqualToAnchor:scrollView.leftAnchor constant:0] setActive:YES];
    [[iconPersonalProfileTextLabel.widthAnchor constraintEqualToConstant:padding] setActive:YES];
    [[iconPersonalProfileTextLabel.heightAnchor constraintEqualToConstant:padding] setActive:YES];
    
    personalProfileTextLabel = [[UILabel alloc] init];
    personalProfileTextLabel.adjustsFontSizeToFitWidth = YES;
    [personalProfileTextLabel setFont:VGP_FONT_LABEL_10];
    [personalProfileTextLabel setTextColor:[UIColor grayColor]];
    [personalProfileTextLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:personalProfileTextLabel];
    personalProfileTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalProfileTextLabel.leftAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.rightAnchor constant:width*.01] setActive:YES];
    [[personalProfileTextLabel.centerYAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.centerYAnchor constant:0] setActive:YES];
    [[personalProfileTextLabel.widthAnchor constraintEqualToAnchor:scrollView.widthAnchor multiplier:1] setActive:YES];
    [[personalProfileTextLabel.heightAnchor constraintEqualToConstant:width*0.025] setActive:YES];
    
    personalProfileTextLabelNav = [[UIView alloc] init];
    personalProfileTextLabelNav.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:personalProfileTextLabelNav];
    personalProfileTextLabelNav.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalProfileTextLabelNav.topAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.bottomAnchor constant:width*.005] setActive:YES];
    [[personalProfileTextLabelNav.leftAnchor constraintEqualToAnchor:scrollView.leftAnchor constant:0] setActive:YES];
    [[personalProfileTextLabelNav.widthAnchor constraintEqualToAnchor:scrollView.widthAnchor multiplier:.95] setActive:YES];
    [[personalProfileTextLabelNav.heightAnchor constraintEqualToConstant:width*.001] setActive:YES];
    
    // name
    nameLabel = [[UILabel alloc] init];
    nameLabel.textColor = VGP_MAIN_TEXT_COLOR;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    [nameLabel setFont:VGP_FONT_LABEL_13];
    [nameLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:nameLabel];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[nameLabel.topAnchor constraintEqualToAnchor:personalProfileTextLabelNav.bottomAnchor constant:padding] setActive:YES];
    [[nameLabel.leftAnchor constraintEqualToAnchor:personalProfileTextLabelNav.leftAnchor constant:0] setActive:YES];
    [[nameLabel.widthAnchor constraintEqualToAnchor:personalProfileTextLabelNav.widthAnchor multiplier:.3] setActive:YES];
    [[nameLabel.heightAnchor constraintEqualToConstant:width*0.05] setActive:YES];
    
    nameInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:nameInputBackground];
    nameInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[nameInputBackground.topAnchor constraintEqualToAnchor:nameLabel.topAnchor constant:0] setActive:YES];
    [[nameInputBackground.leftAnchor constraintEqualToAnchor:nameLabel.rightAnchor constant:0] setActive:YES];
    [[nameInputBackground.widthAnchor constraintEqualToAnchor:personalProfileTextLabelNav.widthAnchor multiplier:.7] setActive:YES];
    [[nameInputBackground.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    nameInputTextField = [[UITextField alloc] init];
    nameInputTextField.font = VGP_FONT_LABEL_13;
    nameInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    nameInputTextField.delegate = self;
    [scrollView addSubview:nameInputTextField];
    
    nameInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[nameInputTextField.leftAnchor constraintEqualToAnchor:nameInputBackground.leftAnchor] setActive:YES];
    [[nameInputTextField.topAnchor constraintEqualToAnchor:nameInputBackground.topAnchor] setActive:YES];
    [[nameInputTextField.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[nameInputTextField.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    // gender
    genderLabel = [[UILabel alloc] init];
    genderLabel.textColor = VGP_MAIN_TEXT_COLOR;
    genderLabel.adjustsFontSizeToFitWidth = YES;
    [genderLabel setFont:VGP_FONT_LABEL_13];
    [genderLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:genderLabel];
    genderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[genderLabel.topAnchor constraintEqualToAnchor:nameLabel.bottomAnchor constant:padding] setActive:YES];
    [[genderLabel.leftAnchor constraintEqualToAnchor:nameLabel.leftAnchor constant:0] setActive:YES];
    [[genderLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[genderLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    genderInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:genderInputBackground];
    genderInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[genderInputBackground.topAnchor constraintEqualToAnchor:genderLabel.topAnchor constant:0] setActive:YES];
    [[genderInputBackground.leftAnchor constraintEqualToAnchor:genderLabel.rightAnchor constant:0] setActive:YES];
    [[genderInputBackground.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[genderInputBackground.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    genderInputTextField = [[UITextField alloc] init];
    genderInputTextField.font = VGP_FONT_LABEL_13;
    genderInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    genderInputTextField.delegate = self;
    [scrollView addSubview:genderInputTextField];
    
    genderInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[genderInputTextField.leftAnchor constraintEqualToAnchor:genderInputBackground.leftAnchor] setActive:YES];
    [[genderInputTextField.topAnchor constraintEqualToAnchor:genderInputBackground.topAnchor] setActive:YES];
    [[genderInputTextField.widthAnchor constraintEqualToAnchor:genderInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[genderInputTextField.heightAnchor constraintEqualToAnchor:genderInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    genderButton = [[UIButton alloc] init];
    [scrollView addSubview:genderButton];
    
    genderButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[genderButton.leftAnchor constraintEqualToAnchor:genderInputBackground.leftAnchor] setActive:YES];
    [[genderButton.topAnchor constraintEqualToAnchor:genderInputBackground.topAnchor] setActive:YES];
    [[genderButton.widthAnchor constraintEqualToAnchor:genderInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[genderButton.heightAnchor constraintEqualToAnchor:genderInputBackground.heightAnchor multiplier:1] setActive:YES];
    [genderButton addTarget:self action:@selector(genderButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // date of birth
    birthdayLabel = [[UILabel alloc] init];
    birthdayLabel.textColor = VGP_MAIN_TEXT_COLOR;
    birthdayLabel.adjustsFontSizeToFitWidth = YES;
    [birthdayLabel setFont:VGP_FONT_LABEL_13];
    [birthdayLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:birthdayLabel];
    birthdayLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[birthdayLabel.topAnchor constraintEqualToAnchor:genderLabel.bottomAnchor constant:padding] setActive:YES];
    [[birthdayLabel.leftAnchor constraintEqualToAnchor:genderLabel.leftAnchor constant:0] setActive:YES];
    [[birthdayLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[birthdayLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    birthdayInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:birthdayInputBackground];
    birthdayInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[birthdayInputBackground.topAnchor constraintEqualToAnchor:birthdayLabel.topAnchor constant:0] setActive:YES];
    [[birthdayInputBackground.leftAnchor constraintEqualToAnchor:birthdayLabel.rightAnchor constant:0] setActive:YES];
    [[birthdayInputBackground.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[birthdayInputBackground.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    birthdayInputTextField = [[UITextField alloc] init];
    birthdayInputTextField.font = VGP_FONT_LABEL_13;
    birthdayInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    birthdayInputTextField.delegate = self;
    [scrollView addSubview:birthdayInputTextField];
    
    birthdayInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[birthdayInputTextField.topAnchor constraintEqualToAnchor:birthdayInputBackground.topAnchor constant:0] setActive:YES];
    [[birthdayInputTextField.leftAnchor constraintEqualToAnchor:birthdayInputBackground.leftAnchor constant:0] setActive:YES];
    [[birthdayInputTextField.widthAnchor constraintEqualToAnchor:birthdayInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[birthdayInputTextField.heightAnchor constraintEqualToAnchor:birthdayInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    birthdayPicker = [[UIDatePicker alloc]init];
    [birthdayPicker setDate:[VGPUserData getBirthDay] animated:YES];
    [birthdayPicker setDatePickerMode:UIDatePickerModeDate];
    [birthdayPicker addTarget:self action:@selector(updateBirthdayInputTextField:) forControlEvents:UIControlEventValueChanged];
    [birthdayInputTextField setInputView:birthdayPicker];
    birthdayInputTextField.text = [VGPHelper formatDate:birthdayPicker.date];
    
    // address
    addressLabel = [[UILabel alloc] init];
    addressLabel.textColor = VGP_MAIN_TEXT_COLOR;
    addressLabel.adjustsFontSizeToFitWidth = YES;
    [addressLabel setFont:VGP_FONT_LABEL_13];
    [addressLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:addressLabel];
    addressLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[addressLabel.topAnchor constraintEqualToAnchor:birthdayLabel.bottomAnchor constant:padding] setActive:YES];
    [[addressLabel.leftAnchor constraintEqualToAnchor:birthdayLabel.leftAnchor constant:0] setActive:YES];
    [[addressLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[addressLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    addressInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:addressInputBackground];
    addressInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[addressInputBackground.topAnchor constraintEqualToAnchor:addressLabel.topAnchor constant:0] setActive:YES];
    [[addressInputBackground.leftAnchor constraintEqualToAnchor:addressLabel.rightAnchor constant:0] setActive:YES];
    [[addressInputBackground.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[addressInputBackground.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    addressInputTextField = [[UITextField alloc] init];
    addressInputTextField.font = VGP_FONT_LABEL_13;
    addressInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    addressInputTextField.delegate = self;
    [scrollView addSubview:addressInputTextField];
    
    addressInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[addressInputTextField.leftAnchor constraintEqualToAnchor:addressInputBackground.leftAnchor] setActive:YES];
    [[addressInputTextField.topAnchor constraintEqualToAnchor:addressInputBackground.topAnchor] setActive:YES];
    [[addressInputTextField.widthAnchor constraintEqualToAnchor:addressInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[addressInputTextField.heightAnchor constraintEqualToAnchor:addressInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    // ================== ADVANCE ==================
    iconPersonalSecurityTextLabel = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"icon-info-grey" andType:@"tiff"]];
    [scrollView addSubview:iconPersonalSecurityTextLabel];
    iconPersonalSecurityTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[iconPersonalSecurityTextLabel.topAnchor constraintEqualToAnchor:addressInputTextField.bottomAnchor constant:padding] setActive:YES];
    [[iconPersonalSecurityTextLabel.leftAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.leftAnchor constant:0] setActive:YES];
    [[iconPersonalSecurityTextLabel.widthAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.widthAnchor multiplier:1] setActive:YES];
    [[iconPersonalSecurityTextLabel.heightAnchor constraintEqualToAnchor:iconPersonalProfileTextLabel.heightAnchor multiplier:1] setActive:YES];
    
    personalSecurityTextLabel = [[UILabel alloc] init];
    personalSecurityTextLabel.adjustsFontSizeToFitWidth = YES;
    [personalSecurityTextLabel setFont:VGP_FONT_LABEL_10];
    [personalSecurityTextLabel setTextColor:[UIColor grayColor]];
    [personalSecurityTextLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:personalSecurityTextLabel];
    personalSecurityTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalSecurityTextLabel.centerYAnchor constraintEqualToAnchor:iconPersonalSecurityTextLabel.centerYAnchor constant:0] setActive:YES];
    [[personalSecurityTextLabel.leftAnchor constraintEqualToAnchor:personalProfileTextLabel.leftAnchor constant:0] setActive:YES];
    [[personalSecurityTextLabel.widthAnchor constraintEqualToAnchor:personalProfileTextLabel.widthAnchor multiplier:1] setActive:YES];
    [[personalSecurityTextLabel.heightAnchor constraintEqualToAnchor:personalProfileTextLabel.heightAnchor multiplier:1] setActive:YES];
    
    personalSecurityTextLabelNav = [[UIView alloc] init];
    personalSecurityTextLabelNav.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:personalSecurityTextLabelNav];
    personalSecurityTextLabelNav.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalSecurityTextLabelNav.topAnchor constraintEqualToAnchor:personalSecurityTextLabel.bottomAnchor constant:width*.005] setActive:YES];
    [[personalSecurityTextLabelNav.leftAnchor constraintEqualToAnchor:personalProfileTextLabelNav.leftAnchor constant:0] setActive:YES];
    [[personalSecurityTextLabelNav.widthAnchor constraintEqualToAnchor:personalProfileTextLabelNav.widthAnchor multiplier:1] setActive:YES];
    [[personalSecurityTextLabelNav.heightAnchor constraintEqualToAnchor:personalProfileTextLabelNav.heightAnchor multiplier:1] setActive:YES];
    
    // personal ID
    personalIDLabel = [[UILabel alloc] init];
    personalIDLabel.textColor = VGP_MAIN_TEXT_COLOR;
    personalIDLabel.adjustsFontSizeToFitWidth = YES;
    [personalIDLabel setFont:VGP_FONT_LABEL_13];
    [personalIDLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:personalIDLabel];
    personalIDLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalIDLabel.topAnchor constraintEqualToAnchor:personalSecurityTextLabelNav.bottomAnchor constant:padding] setActive:YES];
    [[personalIDLabel.leftAnchor constraintEqualToAnchor:personalSecurityTextLabelNav.leftAnchor constant:0] setActive:YES];
    [[personalIDLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[personalIDLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    personalIDInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:personalIDInputBackground];
    personalIDInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalIDInputBackground.topAnchor constraintEqualToAnchor:personalIDLabel.topAnchor constant:0] setActive:YES];
    [[personalIDInputBackground.leftAnchor constraintEqualToAnchor:personalIDLabel.rightAnchor constant:0] setActive:YES];
    [[personalIDInputBackground.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[personalIDInputBackground.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    personalIDInputTextField = [[UITextField alloc] init];
    personalIDInputTextField.font = VGP_FONT_LABEL_13;
    personalIDInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    personalIDInputTextField.delegate = self;
    [scrollView addSubview:personalIDInputTextField];
    
    personalIDInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[personalIDInputTextField.leftAnchor constraintEqualToAnchor:personalIDInputBackground.leftAnchor] setActive:YES];
    [[personalIDInputTextField.topAnchor constraintEqualToAnchor:personalIDInputBackground.topAnchor] setActive:YES];
    [[personalIDInputTextField.widthAnchor constraintEqualToAnchor:personalIDInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[personalIDInputTextField.heightAnchor constraintEqualToAnchor:personalIDInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    // date
    dateIDLabel = [[UILabel alloc] init];
    dateIDLabel.textColor = VGP_MAIN_TEXT_COLOR;
    dateIDLabel.adjustsFontSizeToFitWidth = YES;
    [dateIDLabel setFont:VGP_FONT_LABEL_13];
    [dateIDLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:dateIDLabel];
    dateIDLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[dateIDLabel.topAnchor constraintEqualToAnchor:personalIDLabel.bottomAnchor constant:padding] setActive:YES];
    [[dateIDLabel.leftAnchor constraintEqualToAnchor:personalIDLabel.leftAnchor constant:0] setActive:YES];
    [[dateIDLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[dateIDLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    dateIDInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:dateIDInputBackground];
    dateIDInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[dateIDInputBackground.topAnchor constraintEqualToAnchor:dateIDLabel.topAnchor constant:0] setActive:YES];
    [[dateIDInputBackground.leftAnchor constraintEqualToAnchor:dateIDLabel.rightAnchor constant:0] setActive:YES];
    [[dateIDInputBackground.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[dateIDInputBackground.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    dateIDInputTextField = [[UITextField alloc] init];
    dateIDInputTextField.font = VGP_FONT_LABEL_13;
    dateIDInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    dateIDInputTextField.delegate = self;
    [scrollView addSubview:dateIDInputTextField];
    
    dateIDInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[dateIDInputTextField.topAnchor constraintEqualToAnchor:dateIDInputBackground.topAnchor constant:0] setActive:YES];
    [[dateIDInputTextField.leftAnchor constraintEqualToAnchor:dateIDInputBackground.leftAnchor constant:0] setActive:YES];
    [[dateIDInputTextField.widthAnchor constraintEqualToAnchor:dateIDInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[dateIDInputTextField.heightAnchor constraintEqualToAnchor:dateIDInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    dateIDPicker = [[UIDatePicker alloc]init];
    [dateIDPicker setDate:[VGPUserData getDateOfIssue] animated:YES];
    [dateIDPicker setDatePickerMode:UIDatePickerModeDate];
    [dateIDPicker addTarget:self action:@selector(updateDateIDInputTextField:) forControlEvents:UIControlEventValueChanged];
    [dateIDInputTextField setInputView:dateIDPicker];
    dateIDInputTextField.text = [VGPHelper formatDate:dateIDPicker.date];
    
    // place ID
    placeIDLabel = [[UILabel alloc] init];
    placeIDLabel.textColor = VGP_MAIN_TEXT_COLOR;
    placeIDLabel.adjustsFontSizeToFitWidth = YES;
    [placeIDLabel setFont:VGP_FONT_LABEL_13];
    [placeIDLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:placeIDLabel];
    placeIDLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[placeIDLabel.topAnchor constraintEqualToAnchor:dateIDLabel.bottomAnchor constant:padding] setActive:YES];
    [[placeIDLabel.leftAnchor constraintEqualToAnchor:dateIDLabel.leftAnchor constant:0] setActive:YES];
    [[placeIDLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[placeIDLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    placeIDInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:placeIDInputBackground];
    placeIDInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[placeIDInputBackground.topAnchor constraintEqualToAnchor:placeIDLabel.topAnchor constant:0] setActive:YES];
    [[placeIDInputBackground.leftAnchor constraintEqualToAnchor:placeIDLabel.rightAnchor constant:0] setActive:YES];
    [[placeIDInputBackground.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[placeIDInputBackground.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    placeIDInputTextField = [[UITextField alloc] init];
    placeIDInputTextField.font = VGP_FONT_LABEL_13;
    placeIDInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    placeIDInputTextField.delegate = self;
    [scrollView addSubview:placeIDInputTextField];
    
    placeIDInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[placeIDInputTextField.leftAnchor constraintEqualToAnchor:placeIDInputBackground.leftAnchor] setActive:YES];
    [[placeIDInputTextField.topAnchor constraintEqualToAnchor:placeIDInputBackground.topAnchor] setActive:YES];
    [[placeIDInputTextField.widthAnchor constraintEqualToAnchor:placeIDInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[placeIDInputTextField.heightAnchor constraintEqualToAnchor:placeIDInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    // phone
    phoneLabel = [[UILabel alloc] init];
    phoneLabel.textColor = VGP_MAIN_TEXT_COLOR;
    phoneLabel.adjustsFontSizeToFitWidth = YES;
    [phoneLabel setFont:VGP_FONT_LABEL_13];
    [phoneLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:phoneLabel];
    phoneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[phoneLabel.topAnchor constraintEqualToAnchor:placeIDLabel.bottomAnchor constant:padding] setActive:YES];
    [[phoneLabel.leftAnchor constraintEqualToAnchor:nameLabel.leftAnchor constant:0] setActive:YES];
    [[phoneLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[phoneLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    phoneInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:phoneInputBackground];
    phoneInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[phoneInputBackground.topAnchor constraintEqualToAnchor:phoneLabel.topAnchor constant:0] setActive:YES];
    [[phoneInputBackground.leftAnchor constraintEqualToAnchor:phoneLabel.rightAnchor constant:0] setActive:YES];
    [[phoneInputBackground.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:.75] setActive:YES];
    [[phoneInputBackground.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    phoneInputTextField = [[UITextField alloc] init];
    phoneInputTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneInputTextField.font = VGP_FONT_LABEL_13;
    phoneInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    phoneInputTextField.delegate = self;
    [scrollView addSubview:phoneInputTextField];
    
    phoneInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[phoneInputTextField.topAnchor constraintEqualToAnchor:phoneInputBackground.topAnchor constant:0] setActive:YES];
    [[phoneInputTextField.leftAnchor constraintEqualToAnchor:phoneInputBackground.leftAnchor constant:0] setActive:YES];
    [[phoneInputTextField.widthAnchor constraintEqualToAnchor:phoneInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[phoneInputTextField.heightAnchor constraintEqualToAnchor:phoneInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    phoneButton = [[UIButton alloc] init];
    phoneButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [phoneButton.titleLabel setFont:VGP_FONT_LABEL_10];
    phoneButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [phoneButton addTarget:self action:@selector(phoneButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:phoneButton];
    
    phoneButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[phoneButton.topAnchor constraintEqualToAnchor:phoneLabel.topAnchor constant:0] setActive:YES];
    [[phoneButton.rightAnchor constraintEqualToAnchor:personalSecurityTextLabelNav.rightAnchor constant:0] setActive:YES];
    [[phoneButton.widthAnchor constraintEqualToAnchor:nameInputBackground.widthAnchor multiplier:.2] setActive:YES];
    [[phoneButton.heightAnchor constraintEqualToAnchor:nameInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    // email
    emailLabel = [[UILabel alloc] init];
    emailLabel.textColor = VGP_MAIN_TEXT_COLOR;
    emailLabel.adjustsFontSizeToFitWidth = YES;
    [emailLabel setFont:VGP_FONT_LABEL_13];
    [emailLabel setTextAlignment:NSTextAlignmentLeft];
    [scrollView addSubview:emailLabel];
    emailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [[emailLabel.topAnchor constraintEqualToAnchor:phoneLabel.bottomAnchor constant:padding] setActive:YES];
    [[emailLabel.leftAnchor constraintEqualToAnchor:nameLabel.leftAnchor constant:0] setActive:YES];
    [[emailLabel.widthAnchor constraintEqualToAnchor:nameLabel.widthAnchor multiplier:1] setActive:YES];
    [[emailLabel.heightAnchor constraintEqualToAnchor:nameLabel.heightAnchor multiplier:1] setActive:YES];
    
    emailInputBackground = [[UIImageView alloc] initWithImage:[VGPHelper getUIImageWithImageName:@"input" andType:@"tiff"]];
    [scrollView addSubview:emailInputBackground];
    emailInputBackground.translatesAutoresizingMaskIntoConstraints = NO;
    [[emailInputBackground.topAnchor constraintEqualToAnchor:emailLabel.topAnchor constant:0] setActive:YES];
    [[emailInputBackground.leftAnchor constraintEqualToAnchor:emailLabel.rightAnchor constant:0] setActive:YES];
    [[emailInputBackground.widthAnchor constraintEqualToAnchor:phoneInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[emailInputBackground.heightAnchor constraintEqualToAnchor:phoneInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    emailInputTextField = [[UITextField alloc] init];
    emailInputTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailInputTextField.keyboardType = UIKeyboardTypeEmailAddress;
    emailInputTextField.font = VGP_FONT_LABEL_13;
    emailInputTextField.layer.sublayerTransform = CATransform3DMakeTranslation(padding,0,0);
    emailInputTextField.delegate = self;
    [scrollView addSubview:emailInputTextField];
    
    emailInputTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [[emailInputTextField.topAnchor constraintEqualToAnchor:emailInputBackground.topAnchor constant:0] setActive:YES];
    [[emailInputTextField.leftAnchor constraintEqualToAnchor:emailInputBackground.leftAnchor constant:0] setActive:YES];
    [[emailInputTextField.widthAnchor constraintEqualToAnchor:emailInputBackground.widthAnchor multiplier:1] setActive:YES];
    [[emailInputTextField.heightAnchor constraintEqualToAnchor:emailInputBackground.heightAnchor multiplier:1] setActive:YES];
    
    emailButton = [[UIButton alloc] init];
    emailButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [emailButton.titleLabel setFont:VGP_FONT_LABEL_10];
    emailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [emailButton addTarget:self action:@selector(emailButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:emailButton];
    
    emailButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[emailButton.topAnchor constraintEqualToAnchor:emailLabel.topAnchor constant:0] setActive:YES];
    [[emailButton.leftAnchor constraintEqualToAnchor:phoneButton.leftAnchor constant:0] setActive:YES];
    [[emailButton.widthAnchor constraintEqualToAnchor:phoneButton.widthAnchor multiplier:1] setActive:YES];
    [[emailButton.heightAnchor constraintEqualToAnchor:phoneButton.heightAnchor multiplier:1] setActive:YES];
    
    updateProfileButton = [[UIButton alloc] init];
    [updateProfileButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange" andType:@"tiff"] forState:UIControlStateNormal];
    [updateProfileButton setTitleColor:[UIColor colorWithWhite:1 alpha:1] forState:UIControlStateNormal];
    updateProfileButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [updateProfileButton.titleLabel setFont:VGP_FONT_LABEL_15];
    updateProfileButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [scrollView addSubview:updateProfileButton];
    
    updateProfileButton.translatesAutoresizingMaskIntoConstraints = NO;
    [[updateProfileButton.topAnchor constraintEqualToAnchor:emailLabel.bottomAnchor constant:padding] setActive:YES];
    [[updateProfileButton.centerXAnchor constraintEqualToAnchor:personalProfileTextLabelNav.centerXAnchor constant:0] setActive:YES];
    [[updateProfileButton.widthAnchor constraintEqualToAnchor:personalProfileTextLabelNav.widthAnchor multiplier:.5] setActive:YES];
    [[updateProfileButton.heightAnchor constraintEqualToAnchor:emailLabel.heightAnchor multiplier:1.5] setActive:YES];
    [updateProfileButton addTarget:self action:@selector(updateProfileButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateUIText {
    [leftBackButtonText setTitle:[VGPHelper localizationForString:@"back"] forState:UIControlStateNormal];
    personalProfileTextLabel.text = [VGPHelper localizationForString:@"profile.info"];
    nameLabel.text = [NSString stringWithFormat:@"%@ *", [VGPHelper localizationForString:@"profile.fullname"]];
    nameInputTextField.placeholder = [VGPHelper localizationForString:@"profile.fullname"];
    genderLabel.text = [VGPHelper localizationForString:@"profile.gender"];
    birthdayLabel.text = [NSString stringWithFormat:@"%@ *", [VGPHelper localizationForString:@"profile.birthday"]];
    addressLabel.text = [VGPHelper localizationForString:@"profile.address"];
    addressInputTextField.placeholder = [VGPHelper localizationForString:@"profile.address"];
    
    personalSecurityTextLabel.text = [VGPHelper localizationForString:@"profile.security"];
    personalIDLabel.text = [VGPHelper localizationForString:@"profile.personal_identity"];
    personalIDInputTextField.placeholder = [VGPHelper localizationForString:@"profile.personal_identity"];
    dateIDLabel.text = [VGPHelper localizationForString:@"profile.date_of_issue"];
    dateIDInputTextField.placeholder = [VGPHelper localizationForString:@"profile.date_of_issue"];
    placeIDLabel.text = [VGPHelper localizationForString:@"profile.place_of_issue"];
    placeIDInputTextField.placeholder = [VGPHelper localizationForString:@"profile.place_of_issue"];
    phoneLabel.text = [VGPHelper localizationForString:@"profile.phone"];
    phoneInputTextField.placeholder = [VGPHelper localizationForString:@"profile.phone"];
    emailLabel.text = [VGPHelper localizationForString:@"profile.email"];
    emailInputTextField.placeholder = [VGPHelper localizationForString:@"profile.email"];
    [updateProfileButton setTitle:[VGPHelper localizationForString:@"update"] forState:UIControlStateNormal];
    
    nameInputTextField.text = [VGPUserData getName];
    genderInputTextField.text = [VGPUserData getGenderText];
    genderValue = [NSNumber numberWithInteger:[VGPUserData getGender]];
    [birthdayPicker setDate:[VGPUserData getBirthDay] animated:YES];
    birthdayInputTextField.text = [VGPHelper formatDate:birthdayPicker.date];
    addressInputTextField.text = [VGPUserData getAddress];
    
    personalIDInputTextField.text = [VGPUserData getPersonalIdentity];
    [dateIDPicker setDate:[VGPUserData getDateOfIssue] animated:YES];
    dateIDInputTextField.text = [VGPHelper formatDate:dateIDPicker.date];
    placeIDInputTextField.text = [VGPUserData getPlaceOfIssue];
    phoneInputTextField.text = [VGPUserData getPhone];
    emailInputTextField.text = [VGPUserData getEmail];
    
    [phoneButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-mini" andType:@"tiff"] forState:UIControlStateNormal];
    [phoneButton setTitle:[VGPHelper localizationForString:@"verify"] forState:UIControlStateNormal];
    [phoneButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-grey-mini" andType:@"tiff"] forState:UIControlStateNormal];
        [phoneButton setTitle:[VGPHelper localizationForString:@"verified"] forState:UIControlStateNormal];
    
    if([VGPUserData getPhoneVerified]) {
        phoneButton.enabled = NO;
    } else {
        phoneButton.enabled = YES;
        phoneInputTextField.enabled = YES;
    }
    
    [emailButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-grey-mini" andType:@"tiff"] forState:UIControlStateDisabled];
    [emailButton setTitle:[VGPHelper localizationForString:@"verified"] forState:UIControlStateDisabled];
    emailInputTextField.enabled = NO;
    [emailButton setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-orange-mini" andType:@"tiff"] forState:UIControlStateNormal];
    [emailButton setTitle:[VGPHelper localizationForString:@"verify"] forState:UIControlStateNormal];
    emailInputTextField.enabled = YES;
    
    if([VGPUserData getEmailVerified]) {
        emailButton.enabled = NO;
    } else {
        emailButton.enabled = YES;
        emailInputTextField.enabled = YES;
    }
}

- (void) genderButtonClick {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:[VGPHelper localizationForString:@"profile.gender.select"] message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *male = [UIAlertAction actionWithTitle:[VGPHelper localizationForString:@"profile.gender.select.male"]
                                                   style:UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction *action) {
        self->genderValue = [NSNumber numberWithInteger:0];
        self->genderInputTextField.text = [VGPHelper localizationForString:@"profile.gender.select.male"];
    }];
    UIAlertAction *female = [UIAlertAction actionWithTitle:[VGPHelper localizationForString:@"profile.gender.select.female"]
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
        self->genderValue = [NSNumber numberWithInteger:1];
        self->genderInputTextField.text = [VGPHelper localizationForString:@"profile.gender.select.female"];
    }];
    
    UIAlertAction *other = [UIAlertAction actionWithTitle:[VGPHelper localizationForString:@"profile.gender.select.other"]
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
        self->genderValue = [NSNumber numberWithInteger:2];
        self->genderInputTextField.text = [VGPHelper localizationForString:@"profile.gender.select.other"];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:[VGPHelper localizationForString:@"cancel"]
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
    }];
    
    [alertVC addAction:male];
    [alertVC addAction:female];
    [alertVC addAction:other];
    [alertVC addAction:cancel];
    [alertVC setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alertVC popoverPresentationController];
    popPresenter.sourceView = genderButton;
    popPresenter.sourceRect = genderButton.bounds;
    
    [[VGPHelper topViewController] presentViewController:alertVC animated:YES completion:nil];
}

- (void)phoneButtonClick {
    [self showLoadingView];
    [self cancelInput:nil];
    
    NSString *phone = phoneInputTextField.text;
    [VGPAPI updatePhone:phone success:^(id _Nonnull responseObject) {
        [self hideLoadingView];
        
        [[VGPUI sharedInstance] showVerifyPhoneController];
    } failure:^(NSError * _Nonnull error) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        [self hideLoadingView];
    }];
}

- (void)emailButtonClick {
    [self showLoadingView];
    [self cancelInput:nil];
    
    NSString *email = emailInputTextField.text;
    
    [VGPAPI resendVerifyEmail:email success:^(id  _Nonnull responseObject) {
        [self hideLoadingView];
    } failure:^(NSError * _Nonnull error) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        [self hideLoadingView];
    }];
}

- (void)updateProfileButtonClick {
    [self showLoadingView];
    [self cancelInput:nil];
    
    NSString *name = nameInputTextField.text;
    NSNumber *gender = genderValue;
    NSString *birthday = [VGPHelper formatDate:birthdayPicker.date withDateFormat:@"yyyy/MM/dd" ];
    NSString *address = addressInputTextField.text;
    NSString *personal_identity = personalIDInputTextField.text;
    NSString *place_of_issue = placeIDInputTextField.text;
    NSString *date_of_issue = [VGPHelper formatDate:dateIDPicker.date withDateFormat:@"yyyy/MM/dd" ];
    
    [VGPAPI updateUserInfo:name gender:gender birthday:birthday address:address personal_identity:personal_identity place_of_issue:place_of_issue date_of_issue:date_of_issue success:^(id  _Nonnull responseObject) {
        
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"notification"] message:[VGPHelper localizationForString:@"update.success"] handler:^(UIAlertAction * _Nonnull action) {
           [self hideLoadingView];
        }];
        
    } failure:^(NSError * _Nonnull error) {
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[error localizedDescription]];
        [self hideLoadingView];
    }];
}

- (void)updateBirthdayInputTextField:(id)sender {
    MyLog(@"updateBirthdayInputTextField");
    UIDatePicker *picker = (UIDatePicker*)birthdayInputTextField.inputView;
    birthdayInputTextField.text = [VGPHelper formatDate:picker.date];
}

- (void)updateDateIDInputTextField:(id)sender {
    MyLog(@"updateDateIDInputTextField");
    UIDatePicker *picker = (UIDatePicker*)dateIDInputTextField.inputView;
    dateIDInputTextField.text = [VGPHelper formatDate:picker.date];
}

#pragma mark - TextField Delegate
- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    [nameInputTextField resignFirstResponder];
    [genderInputTextField resignFirstResponder];
    [birthdayInputTextField resignFirstResponder];
    [addressInputTextField resignFirstResponder];
    [personalIDInputTextField resignFirstResponder];
    [dateIDInputTextField resignFirstResponder];
    [placeIDInputTextField resignFirstResponder];
    [phoneInputTextField resignFirstResponder];
    [emailInputTextField resignFirstResponder];
}

@end
