//
//  VGPSDKController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/4/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPSDKController.h"
#import "VGPConfig.h"
#import "VGPHelper.h"
#import "VGPUI.h"
#import "UIData.h"
#import "VGPLogger.h"
#import "VGPInterface.h"

@interface VGPSDKController()

@end

@implementation VGPSDKController

BOOL SHOW_BACK_BUTTON = YES;

- (instancetype)init {
    self = [super init];
    if (@available(iOS 13.0, *)) {
        self.modalPresentationStyle = UIModalPresentationAutomatic;
    } else {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUIText) name:VGP_EVENT_UPDATE_LANGUAGE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI) name:VGP_EVENT_UPDATE_LAYOUT object:nil];
    
    UITapGestureRecognizer *cancelInput = [[UITapGestureRecognizer alloc] init];
    [cancelInput addTarget:self action:@selector(cancelInput:)];
    [self.view addGestureRecognizer:cancelInput];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.curentFrame = self.view.frame;
}

- (void)viewWillAppear:(BOOL)animated {
    [[[VGPUI sharedInstance] FlyButton] hideButton];
    [super viewWillAppear:animated];
    [self updateUIText];
    [self updateUI];
}

- (void)viewDidDisappear:(BOOL)animated {
    if(SHOW_BACK_BUTTON == NO) {
        [[VGPInterface sharedInstance] showFlyButton];
    }
}

- (void)showLoadingView {
    
    self->_loadingView = [[UIView alloc] init];
    [self->_loadingView setFrame:CGRectMake(0, 0, [VGPHelper getScreenWidth], [VGPHelper getScreenHeight])];
    self->_loadingView.backgroundColor = [UIColor clearColor];
    self->_loadingIndicatorView.layer.zPosition = 101;
    [[VGPHelper topViewController].view addSubview:self->_loadingView];
    
    self->_loadingIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self->_loadingIndicatorView.center = self.view.center;
    self->_loadingIndicatorView.layer.zPosition = 102;
    [self->_loadingIndicatorView startAnimating];
    [self.view addSubview:self->_loadingIndicatorView];
    
    self->_loadingIndicatorView.hidden = NO;
}
- (void)hideLoadingView {
    if(self->_loadingView) {
        self->_loadingView.hidden = YES;
        [self->_loadingView removeFromSuperview];
    }
    if(self->_loadingIndicatorView) {
        [self->_loadingIndicatorView stopAnimating];
        self->_loadingIndicatorView.hidden = YES;
        [self->_loadingIndicatorView removeFromSuperview];
    }
}

- (void)updateUI {}

- (void)updateUIText {}

- (void)rightCloseButtonClick {
    [[VGPUI sharedInstance] dismiss];
}

- (void)leftBackButtonClick {
    if(SHOW_BACK_BUTTON == NO) return;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)leftSupportButtonClick {
    if([[UIData getLocalization] isEqualToString:@"en"]) {
        [VGPHelper changeLocalization:@"vi"];
    } else {
        [VGPHelper changeLocalization:@"en"];
    }
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    MyLog(@"textField %@", textField);
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    //[self animateTextField:textField up:YES withOffset:textField.frame.origin.y / 2];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    //[self animateTextField:textField up:NO withOffset:textField.frame.origin.y / 2];
}

- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    
}

-(void)animateTextField:(UITextField*)textField up:(BOOL)up withOffset:(CGFloat)offset
 {
    const int movementDistance = -offset;
    const float movementDuration = 0.4f;
    int movement = (up ? movementDistance : -movementDistance);
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
