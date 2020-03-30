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

- (IBAction)purchase:(UIButton *)sender {
    /**
     @TODO: you can add anything to andPartnerToken value, up to you
     */
    [[VGPInterface sharedInstance] purchase:@"USERID1" serverID:@"SERVERID1" itemID:@"gold.tieudaogiangho.17000" andPartnerData:nil];
}

- (IBAction)logoutClick:(UIButton *)sender {
    [[VGPInterface sharedInstance] logoutGame];
}

@end
