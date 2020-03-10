//
//  VGPSDKController.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/4/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPSDKController.h"
#import "VGPHelper.h"
#import "VGPUI.h"

@interface VGPSDKController()

@end

@implementation VGPSDKController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    //self.view.layer.zPosition = 200;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUIText) name:VGP_UPDATE_LANGUAGE object:nil];
    
    UITapGestureRecognizer *cancelInput = [[UITapGestureRecognizer alloc] init];
    [cancelInput addTarget:self action:@selector(cancelInput:)];
    [self.view addGestureRecognizer:cancelInput];
}

- (void)viewDidAppear:(BOOL)animated {
    self.curentFrame = self.view.frame;
}

- (void)updateUIText {
    
}

- (void)rightCloseButtonClick
{
    [[VGPUI sharedInstance] dismiss];
}

- (void)leftBackButtonClick
{
    MyLog(@"leftBackButtonClick");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
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

- (void)cancelInput:(UITapGestureRecognizer *)gesture {
    
}

@end
