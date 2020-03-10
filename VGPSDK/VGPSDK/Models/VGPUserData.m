//
//  VGPUserData.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPUserData.h"

@implementation VGPUserData

+ (NSInteger)getUserID { return [[VGPHelper getNSUserDefaults:VGP_USER_USERID] intValue]; }
+ (void)setUserID:(NSInteger)userID { [VGPHelper setNSUserDefaults:VGP_USER_USERID value:[@(userID) stringValue]]; }
+ (NSString *)getUsername { return [VGPHelper getNSUserDefaults:VGP_USER_USERNAME]; }
+ (void)setUsername:(NSString *)username { [VGPHelper setNSUserDefaults:VGP_USER_USERNAME value:username]; }
+ (NSString *)getEmail { return [VGPHelper getNSUserDefaults:VGP_USER_EMAIL]; }
+ (void)setEmail:(NSString *)email { [VGPHelper setNSUserDefaults:VGP_USER_EMAIL value:email]; }
+ (NSString *)getPhone { return [VGPHelper getNSUserDefaults:VGP_USER_PHONE]; }
+ (void)setPhone:(NSString *)phone { [VGPHelper setNSUserDefaults:VGP_USER_PHONE value:phone]; }

+ (NSString *)getAvatar { return [VGPHelper getNSUserDefaults:VGP_USER_AVATAR]; }
+ (void)setAvatar:(NSString *)avatar { [VGPHelper setNSUserDefaults:VGP_USER_AVATAR value:avatar]; }

+ (NSString *)getName { return [VGPHelper getNSUserDefaults:VGP_USER_NAME]; }
+ (void)setName:(NSString *)name { [VGPHelper setNSUserDefaults:VGP_USER_NAME value:name]; }
+ (NSString *)getFirstName { return [VGPHelper getNSUserDefaults:VGP_USER_FIRST_NAME]; }
+ (void)setFirstName:(NSString *)firstName { [VGPHelper setNSUserDefaults:VGP_USER_FIRST_NAME value:firstName]; }
+ (NSString *)getMiddleName { return [VGPHelper getNSUserDefaults:VGP_USER_MIDDLE_NAME]; }
+ (void)setMiddleName:(NSString *)middleName { [VGPHelper setNSUserDefaults:VGP_USER_MIDDLE_NAME value:middleName]; }
+ (NSString *)getLastName { return [VGPHelper getNSUserDefaults:VGP_USER_LAST_NAME]; }
+ (void)setLastName:(NSString *)lastName { [VGPHelper setNSUserDefaults:VGP_USER_LAST_NAME value:lastName]; }

+ (NSInteger)getGender { return [[VGPHelper getNSUserDefaults:VGP_USER_GENDER] intValue]; }
+ (void)setGender:(NSInteger)gender { [VGPHelper setNSUserDefaults:VGP_USER_GENDER value:[@(gender) stringValue]]; }
+ (NSDate *)getBirthDay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [dateFormatter dateFromString:[VGPHelper getNSUserDefaults:VGP_USER_BIRTHDAY]];
}
+ (void)setBirthDay:(NSString *)birthDay { [VGPHelper setNSUserDefaults:VGP_USER_BIRTHDAY value:birthDay]; }

+ (NSString *)getPersonalIdentity { return [VGPHelper getNSUserDefaults:VGP_USER_PERSONALIDENTITY]; }
+ (void)setPersonalIdentity:(NSString *)personalIdentity { [VGPHelper setNSUserDefaults:VGP_USER_PERSONALIDENTITY value:personalIdentity]; }
+ (NSDate *)getDateOfIssue {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    return [dateFormatter dateFromString:[VGPHelper getNSUserDefaults:VGP_USER_DATEOFISSUE]];
}
+ (void)setDateOfIssue:(NSString *)dateOfIssue { [VGPHelper setNSUserDefaults:VGP_USER_DATEOFISSUE value:dateOfIssue]; }
+ (NSString *)getPlaceOfIssue { return [VGPHelper getNSUserDefaults:VGP_USER_PLACEOFISSUE]; }
+ (void)setPlaceOfIssue:(NSString *)placeOfIssue { [VGPHelper setNSUserDefaults:VGP_USER_PLACEOFISSUE value:placeOfIssue]; }

+ (NSString *)getAddress { return [VGPHelper getNSUserDefaults:VGP_USER_ADDRESS]; }
+ (void)setAddress:(NSString *)address { [VGPHelper setNSUserDefaults:VGP_USER_ADDRESS value:address]; }
+ (NSString *)getProvider { return [VGPHelper getNSUserDefaults:VGP_USER_PROVIDER]; }
+ (void)setProvider:(NSString *)provider { [VGPHelper setNSUserDefaults:VGP_USER_PROVIDER value:provider]; }

+ (NSArray *)getThirdPartyConnect {
    NSMutableArray *thirdPartyConnect = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:VGP_USER_THIRDPARTYCONNECT]];
    return thirdPartyConnect;
}
+ (void)setThirdPartyConnect:(NSArray *)thirdPartyConnect { [[NSUserDefaults standardUserDefaults] setObject:thirdPartyConnect forKey:VGP_USER_THIRDPARTYCONNECT]; }

+ (BOOL)getCanUpdateUsername { return [[VGPHelper getNSUserDefaults:VGP_USER_CANUPDATEUSERNAME] boolValue]; }
+ (void)setCanUpdateUsername:(BOOL)canUpdateUsername { [VGPHelper setNSUserDefaults:VGP_USER_CANUPDATEUSERNAME value:[@(canUpdateUsername) stringValue]]; }
+ (BOOL)getRequireInitPassword { return [[VGPHelper getNSUserDefaults:VGP_USER_REQUIREINITPASSWORD] boolValue]; }
+ (void)setRequireInitPassword:(BOOL)requireInitPassword { [VGPHelper setNSUserDefaults:VGP_USER_REQUIREINITPASSWORD value:[@(requireInitPassword) stringValue]]; }

@end
