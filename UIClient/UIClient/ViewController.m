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
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [[VGPInterface sharedInstance] loginGame];
    //[[VGPInterface sharedInstance] showFlyButton];
}

- (IBAction)loginClick:(UIButton *)sender {
    [[VGPInterface sharedInstance] loginGame];
}

@end
