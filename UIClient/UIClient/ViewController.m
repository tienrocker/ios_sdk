//
//  ViewController.m
//  UIClient
//
//  Created by  Tien Tran on 2/3/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "ViewController.h"

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
    [[VGPInterface sharedInstance] purchase:@"USERID1" serverID:@"SERVERID1" itemID:@"gold.tieudaogiangho.17000" andPartnerData:@"ANOTHER|DAA|TÂ"];
}

- (IBAction)log:(UIButton *)sender {
    // character
    [[VGPInterface sharedInstance] logCreatedCharacter]; // Call log event after create character
    [[VGPInterface sharedInstance] completeMobileTutorial]; // Call log event after user completed tutorial
    [[VGPInterface sharedInstance] logLevelUp:500]; // Call log event after user got level up, include level number
    
    // purchase
    [[VGPInterface sharedInstance] purchaseViewDisplay]; // open purchase view
    [[VGPInterface sharedInstance] logPurchase:15000]; // Call log event after user purchase, include money value of package normaly = xu * 100
    [[VGPInterface sharedInstance] logUnlockAchievement:12]; // Call log event after user increment VIP level, include VIP level number
    
    // resource
    [[VGPInterface sharedInstance] resourceStartDownload]; // Call log event when start download resource
    [[VGPInterface sharedInstance] resourceProcessDownload:10]; // Call log event when downloaded 10% resource and so on.... change 10 to current percentage
    [[VGPInterface sharedInstance] resourceDownloadSuccess]; // Call log event when download resource success
    [[VGPInterface sharedInstance] resourceDownloadError]; // Call log event when download resource error
    [[VGPInterface sharedInstance] resourceStartUnpack]; // Call log event when start unpack resource
    [[VGPInterface sharedInstance] resourceUnpackSuccess]; // Call log event when unpack resource success
    [[VGPInterface sharedInstance] resourceUnpackError]; // Call log event when unpack resource error
}

- (IBAction)shareRemoteImage:(UIButton *)sender {
    id path = @"http://imgsv.imaging.nikon.com/lineup/lens/zoom/normalzoom/af-s_dx_18-140mmf_35-56g_ed_vr/img/sample/sample1_l.jpg";
    [[VGPInterface sharedInstance] shareFacebookImage:path];
}

- (IBAction)logoutClick:(UIButton *)sender {
    [[VGPInterface sharedInstance] logoutGame];
}


@end
