//
//  VGPIAPHelper.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/30/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPIAPHelper.h"
#import "VGPConfig.h"
#import "VGPConfigAPI.h"
#import "VGPHelper.h"

@implementation VGPIAPHelper

static VGPIAPHelper * sharedInstance;

+ (VGPIAPHelper *)sharedInstance {
    if(!sharedInstance) {
        sharedInstance = [VGPIAPHelper alloc];
    }
    return sharedInstance;
}

+ (void)setup {
    NSMutableArray *listProductID = [[NSMutableArray alloc] init];
    for (int i=0; i<[VGP_IAP_ITEMS count]; i++) {
        NSDictionary * iData = [VGP_IAP_ITEMS objectAtIndex:i];
        NSString *iProductID = [iData objectForKey:@"id"];
        [listProductID addObject:iProductID];
    }
    NSSet * productIdentifiers = [[NSSet alloc] initWithArray:listProductID];
    sharedInstance = [sharedInstance initWithProductIdentifiers:productIdentifiers];
}

@end
