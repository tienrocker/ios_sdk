//
//  VGPNetworkManager.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/12/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPNetworkManager.h"
#import "UIData.h"
#import "VGPConfig.h"
#import "VGPHelper.h"
#import "VGPUserData.h"

@implementation VGPNetworkManager

static VGPNetworkManager *sharedManager = nil;

+ (VGPNetworkManager*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^ {
        sharedManager = [[VGPNetworkManager alloc] init];
    });
    return sharedManager;
}

- (AFHTTPSessionManager*)getNetworkingManager {
    if (self.networkingManager == nil) {
        self.networkingManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [self.networkingManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        self.networkingManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.networkingManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", @"text/html", nil];
        self.networkingManager.securityPolicy = [self getSecurityPolicy];
    }
    return self.networkingManager;
}

- (id)getSecurityPolicy {
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    [securityPolicy setValidatesDomainName:NO];
    return securityPolicy;
}

- (void)GET:(NSString *)url param:(NSDictionary *)data success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure {
    url = [VGPNetworkManager addQueryStringToUrlString:url withDictionary:data];
    MyLog(@"url %@ data %@", url, data);
    
    [[self getNetworkingManager] GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        MyLog(@"responseObject %@", responseObject);
        if (success != nil) success(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        MyLog(@"error %@", [error localizedDescription]);
        if (failure != nil) {
            failure(error);
        } else {
            if (error.code == kCFURLErrorCannotConnectToHost || error.code == NSURLErrorTimedOut || error.code == kCFURLErrorNotConnectedToInternet) {
                [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_NETWORK_TIMEOUT object:nil userInfo:@ {@"operation":operation, @"error":error}];
                [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"network.error"]];
            }
        }
    }];
}

- (void)POST:(NSString *)url param:(NSDictionary *)data success:(NetworkManagerSuccess)success failure:(NetworkManagerFailure)failure {
    url = [VGPNetworkManager addQueryStringToUrlString:url withDictionary:@ {}];
    MyLog(@"url %@ data %@", url, data);
    
    [[self getNetworkingManager] POST:url parameters:data progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        MyLog(@"responseObject %@", responseObject);
        if (success != nil) success(responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        MyLog(@"error %@", [error localizedDescription]);
        if (error.code == kCFURLErrorCannotConnectToHost || error.code == NSURLErrorTimedOut || error.code == kCFURLErrorNotConnectedToInternet) {
            [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_NETWORK_TIMEOUT object:nil userInfo:@ {@"operation":operation, @"error":error}];
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"network.error"]];
        }
        if (failure != nil) failure(error);
    }];
}

+ (NSString*)addQueryStringToUrlString:(NSString *)urlString withDictionary:(NSDictionary *)dictionary {
    NSMutableString *urlWithQuerystring = [[NSMutableString alloc] initWithString:urlString];
    [urlWithQuerystring appendFormat:@"?app_token=%@&os=ios&lang=%@", [self urlEscapeString:VGP_APPTOKEN], [UIData getLocalization]];
    if([VGPUserData getToken]) [urlWithQuerystring appendFormat:@"&user_token=%@", [VGPUserData getToken]];
    
    for (id key in dictionary) {
        NSString *keyString = [key description];
        NSString *valueString = [[dictionary objectForKey:key] description];

        if ([urlWithQuerystring rangeOfString:@"?"].location == NSNotFound) {
            [urlWithQuerystring appendFormat:@"?%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        } else {
            [urlWithQuerystring appendFormat:@"&%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        }
    }
    return urlWithQuerystring;
}

+ (NSString*)urlEscapeString:(NSString *)unencodedString {
    NSMutableCharacterSet *charset = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [charset removeCharactersInString:@"!*'\"();:@&=+$,/?%#[]% "];
    NSString *encodedValue = [unencodedString stringByAddingPercentEncodingWithAllowedCharacters:charset];
    return encodedValue;
}

@end
