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

@interface VGPSDKController()

@end

@implementation VGPSDKController

BOOL SHOW_BACK_BUTTON = NO;

- (instancetype)init{
    self = [super init];
    if (@available(iOS 13.0, *)) {
        self.modalPresentationStyle = UIModalPresentationAutomatic;
    } else {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    //self.view.layer.zPosition = 200;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUIText) name:VGP_EVENT_UPDATE_LANGUAGE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI) name:VGP_EVENT_UPDATE_LAYOUT object:nil];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess) name:VGP_EVENT_LOGIN_SUCCESS object:nil];
    
    UITapGestureRecognizer *cancelInput = [[UITapGestureRecognizer alloc] init];
    [cancelInput addTarget:self action:@selector(cancelInput:)];
    [self.view addGestureRecognizer:cancelInput];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.curentFrame = self.view.frame;
}

- (void)viewWillAppear:(BOOL)animated{
    [[[VGPUI sharedInstance] FlyButton] hideButton];
    [super viewWillAppear:animated];
    [self updateUIText];
    [self updateUI];
}

- (void)showLoadingView{
    
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
- (void)hideLoadingView{
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

- (void)updateUI{}

- (void)updateUIText{}

- (void)rightCloseButtonClick{
    [[VGPUI sharedInstance] dismiss];
}

- (void)leftBackButtonClick{
    MyLog(@"leftBackButtonClick");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)leftSupportButtonClick{
    if([[UIData getLocalization] isEqualToString:@"en"]) {
        [VGPHelper changeLocalization:@"vi"];
    } else {
        [VGPHelper changeLocalization:@"en"];
    }
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    MyLog(@"textField %@", textField);
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.view.frame = CGRectOffset(self.view.frame, 0, DIS_MOVE_POPUP);
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.view.frame = self.curentFrame;
}

- (void)cancelInput:(UITapGestureRecognizer *)gesture{
    
}

@end
