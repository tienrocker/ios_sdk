//
//  ViewController.m
//  UIClient
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ViewController.h"
#import <VGPSDK/VGPSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SDKReady) name:VGP_EVENT_INIT_READY object:nil];
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)SDKReady {
    [[VGPInterface sharedInstance] loginGame];
}

- (IBAction)loginClick:(UIButton *)sender {
    [[VGPInterface sharedInstance] loginGame];
}

- (IBAction)logoutClick:(UIButton *)sender {
    [[VGPInterface sharedInstance] logoutGame];
}

@end
