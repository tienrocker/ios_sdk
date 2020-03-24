//
//  VGPSDKController.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/4/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VGPSDKController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate, UIActionSheetDelegate, UIApplicationDelegate>

@property (nonatomic) CGRect curentFrame;
- (void)updateUI;
- (void)updateUIText;
- (void)rightCloseButtonClick;
- (void)leftBackButtonClick;

@property (strong, nonatomic) UIActivityIndicatorView *loadingIndicatorView;
@property (strong, nonatomic) UIView *loadingView;
- (void)showLoadingView;
- (void)hideLoadingView;

@end

NS_ASSUME_NONNULL_END
