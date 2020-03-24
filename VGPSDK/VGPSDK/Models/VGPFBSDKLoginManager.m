//
//  VGPFBSDKLoginManager.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/18/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPFBSDKLoginManager.h"

@implementation VGPFBSDKLoginManager

static VGPFBSDKLoginManager *sharedController;
+ (VGPFBSDKLoginManager *)sharedInstance{
    if (!sharedController) {
        sharedController = [[VGPFBSDKLoginManager alloc] init];
    }
    return sharedController;
}

@end
