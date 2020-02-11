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

@interface VGPSDKController ()

@end

@implementation VGPSDKController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.layer.zPosition = 200;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUIText) name:VGP_UPDATE_LANGUAGE object:nil];
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

@end
