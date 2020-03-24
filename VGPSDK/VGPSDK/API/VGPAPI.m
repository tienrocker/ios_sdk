//
//  VGPAPI.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/17/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPAPI.h"
#import "VGPUserData.h"
#import "VGPInterface.h"

@implementation VGPAPI

#pragma mark Config

+ (void)getServerInfo {
    // get server info
    [VGPConfigAPI getServerInfo:^(id  _Nonnull responseObject) {
        NSDictionary *data = [responseObject objectForKey:@"data"];
        VGP_SERVER = [NSString stringWithFormat:@"%@://%@", [data objectForKey:@"protocol"], [data objectForKey:@"domain"]];
        VGP_ENDPOINT = [NSString stringWithFormat:@"%@/%@/%@", VGP_SERVER, VGP_GAMEID, VGP_SDK_VERSION];
        
        // get sdk config
        [VGPConfigAPI getServerSettings:^(id  _Nonnull responseObject) {
            NSDictionary *config = [responseObject objectForKey:@"config"];
            [UIData setPhoneChangeAlertMessage:[config objectForKey:@"cpp"]];
            [UIData setPhoneChangeSMSMessage:[config objectForKey:@"forget_password_popup"]];
            
            VGP_CONFIG_LOADED = YES;
            [[VGPInterface sharedInstance] showFlyButton];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_INIT_READY object:nil userInfo:@{}];
        } failure:^(NSError * _Nonnull error) {
            [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"server.setting.error"]];
        }];
    } failure:^(NSError * _Nonnull error) {
        MyLog(@"failure");
        [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:[VGPHelper localizationForString:@"server.info.error"]];
    }];
}

#pragma mark Account login

+ (void)normalLogin:(NSString *)username password:(NSString *)password success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure {
    [VGPLoginAPI normalLogin:username password:password success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            BOOL isRegister = [[data objectForKey:@"is_new"] boolValue];
            if(isRegister) {
                [VGPHelper onRegisterSuccess];
            } else {
                [VGPHelper onLoginSuccess];
            }
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"normalLogin" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}
+ (void)facebookLogin:(NSString *)facebook_id success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure {
    [VGPLoginAPI facebookLogin:facebook_id success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            BOOL isRegister = [[data objectForKey:@"is_new"] boolValue];
            if(isRegister) {
                [VGPHelper onRegisterSuccess];
            } else {
                [VGPHelper onLoginSuccess];
            }
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"facebookLogin" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}
+ (void)quickplayLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure {
    [VGPLoginAPI quickplayLogin:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            BOOL isRegister = [[data objectForKey:@"is_new"] boolValue];
            if(isRegister) {
                [VGPHelper onRegisterSuccess];
            } else {
                [VGPHelper onLoginSuccess];
            }
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"quickplayLogin" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}
+ (void)appleLogin:(NSString *)access_token success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure {
    [VGPLoginAPI appleLogin:access_token success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            BOOL isRegister = [[data objectForKey:@"is_new"] boolValue];
            if(isRegister) {
                [VGPHelper onRegisterSuccess];
            } else {
                [VGPHelper onLoginSuccess];
            }
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"appleLogin" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}
+ (void)tokenLogin:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure {
    
    if([[VGPUserData getToken] isEqualToString:@""]) {
        NSError* error = [NSError errorWithDomain:@"tokenLogin" code:0 userInfo:@{}];
        if(failure) failure(error);
        return;
    }
    
    [VGPLoginAPI tokenLogin:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            BOOL isRegister = [[data objectForKey:@"is_new"] boolValue];
            if(isRegister) {
                [VGPHelper onRegisterSuccess];
            } else {
                [VGPHelper onLoginSuccess];
            }
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"tokenLogin" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

#pragma mark Account register

+ (void)registerWithEmail:(NSString *)username password:(NSString *)password email:(NSString *)email success:(VGPLoginAPISuccess)success failure:(VGPLoginAPIFailure)failure {
    [VGPRegisterAPI registerWithEmail:username password:password email:email success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            [VGPHelper onRegisterSuccess];
            
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"registerWithEmail" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

#pragma mark Account profile

+ (void)getProfile:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    [VGPProfileAPI getProfile:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"getProfile" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

+ (void)updateUserInfo:(NSString *)name gender:(NSNumber *)gender birthday:(NSString *)birthday address:(NSString *)address personal_identity:(NSString *)personal_identity place_of_issue:(NSString *)place_of_issue date_of_issue:(NSString *)date_of_issue success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    [VGPProfileAPI updateUserInfo:name gender:gender birthday:birthday address:address personal_identity:personal_identity place_of_issue:place_of_issue date_of_issue:date_of_issue success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            NSDictionary *data = [responseObject objectForKey:@"user"];
            [VGPUserData setUserData:data];
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"updateUserInfo" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

+ (void)updatePhone:(NSString *)phone success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    [VGPProfileAPI updatePhone:phone success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"updatePhone" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

+ (void)resendVerifyPhone:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    [VGPProfileAPI resendVerifyPhone:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"resendVerifyPhone" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

+ (void)verifyPhone:(NSString *)code success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    [VGPProfileAPI verifyPhone:code success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"verifyPhone" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

+ (void)resendVerifyEmail:(NSString *)email success:(VGPProfileAPISuccess)success failure:(VGPProfileAPIFailure)failure {
    [VGPProfileAPI resendVerifyEmail:email success:^(id  _Nonnull responseObject) {
        NSInteger code = [[responseObject objectForKey:@"code"] intValue];
        NSString *message = [responseObject objectForKey:@"message"];
        if(code == 200) {
            if(success) success(responseObject);
        } else {
            if (code == 401) [[VGPInterface sharedInstance] logoutGame];
            NSError* error = [NSError errorWithDomain:@"verifyPhone" code:code userInfo:@{NSLocalizedDescriptionKey:message}];
            if(failure) failure(error);
        }
    } failure:^(NSError * _Nonnull error) {
        if(failure) failure(error);
    }];
}

@end
