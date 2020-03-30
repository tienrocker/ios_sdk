//
//  VGPPaymentAPI.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/30/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^VGPPaymentAPISuccess)(id responseObject);
typedef void (^VGPPaymentAPIFailure)(NSError *error);

@interface VGPPaymentAPI : NSObject

+ (void)check:(NSString *_Nonnull)characterID andServerID:(NSString *_Nonnull)serverID andItemID:(NSString *_Nonnull)itemID andPartnerToken:(NSString *)partnerToken success:(VGPPaymentAPISuccess)success failure:(VGPPaymentAPIFailure)failure;
+ (void)iap:(NSString *_Nonnull)characterID andServerID:(NSString *_Nonnull)serverID andItemID:(NSString *_Nonnull)itemID andPartnerToken:(NSString *_Nullable)partnerToken andReceiptData:(NSString *_Nonnull)receiptData success:(VGPPaymentAPISuccess)success failure:(VGPPaymentAPIFailure)failure;

@end

NS_ASSUME_NONNULL_END
