//
//  VGPNetworkManager.h
//  VGPSDK
//
//  Created by  Tien Tran on 3/12/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^NetworkManagerSuccess)(id responseObject);
typedef void (^NetworkManagerFailure)(NSError *error);

@interface VGPNetworkManager : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *networkingManager;

+ (id)sharedManager;
- (void)GET:(NSString *)url param:(nullable NSDictionary *)param success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;
- (void)POST:(NSString *)url param:(NSDictionary *)param success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure;

+ (NSString*)urlEscapeString:(NSString *)unencodedString;
+ (NSString*)addQueryStringToUrlString:(NSString *)urlString withDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
