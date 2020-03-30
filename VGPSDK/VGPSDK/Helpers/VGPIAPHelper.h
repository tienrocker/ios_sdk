//
//  VGPIAPHelper.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/30/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAPHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface VGPIAPHelper : IAPHelper

+ (VGPIAPHelper *)sharedInstance;
+ (void)setup;

@end

NS_ASSUME_NONNULL_END
