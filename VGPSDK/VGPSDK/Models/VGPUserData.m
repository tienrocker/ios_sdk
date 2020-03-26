//
//  VGPUserData.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "VGPUserData.h"
#import "VGPConfig.h"

@implementation VGPUserData

+ (void)setUserData:data{
    
    [self setToken:[data objectForKey:@"user_token"]];
    [self setUserID:[[data objectForKey:@"id"] intValue]];
    [self setUsername:[data objectForKey:@"username"]];
    [self setEmail:[data objectForKey:@"email"]];
    [self setEmailVerified:[[data objectForKey:@"email_verified"] boolValue]];
    [self setPhone:[data objectForKey:@"phone"]];
    [self setPhoneVerified:[[self getPhone] isEqual: @""] ? NO : YES];
    
    [self setAvatar:[data objectForKey:@"avatar_url"]];
    [self setName:[data objectForKey:@"name"]];
    [self setGender:[[data objectForKey:@"gender"] intValue]];
    [self setBirthDay:[data objectForKey:@"birthday"]];
    [self setPersonalIdentity:[data objectForKey:@"personal_identity"]];
    [self setDateOfIssue:[data objectForKey:@"date_of_issue"]];
    [self setPlaceOfIssue:[data objectForKey:@"place_of_issue"]];
    [self setAddress:[data objectForKey:@"address"]];
    [self setProvider:[data objectForKey:@"provider"]];
    
    [self setCanUpdateUsername:[[data objectForKey:@"can_update_username"] boolValue]];
    [self setRequireInitPassword:[[data objectForKey:@"require_init_password"] boolValue]];
    [self setShowProtectDialog:[[data objectForKey:@"show_protect_dialog"] boolValue]];
    
    [self setIsConnectFacebook:NO];
    [self setIsConnectQuickplay:NO];
    [self setIsConnectApple:NO];
    NSArray *connectArray = [data objectForKey:@"connect"];
    
    [self setIsConnectFacebook:NO];
    [self setIsConnectQuickplay:NO];
    [self setIsConnectApple:NO];
    
    if (connectArray.count > 0) {
        for (int i = 0; i < connectArray.count; i++) {
            NSInteger connectElement = [[connectArray objectAtIndex:i] integerValue];
            if (connectElement == 2) {
                [self setIsConnectFacebook:YES];
            } else if (connectElement == 3) {
                [self setIsConnectQuickplay:YES];
            } else if (connectElement == 6) {
                [self setIsConnectApple:YES];
            }
        }
    }
}

+ (void)clearUserData{
    [self setToken:nil];
    [self setUserID:0];
    [self setUsername:nil];
    [self setEmail:nil];
    [self setEmailVerified:nil];
    [self setPhone:nil];
    [self setPhoneVerified:nil];
    
    [self setAvatar:nil];
    
    [self setName:nil];
    [self setFirstName:nil];
    [self setMiddleName:nil];
    [self setLastName:nil];
    
    [self setGender:0];
    [self setBirthDay:nil];
    [self setPersonalIdentity:nil];
    [self setDateOfIssue:nil];
    [self setPlaceOfIssue:nil];
    
    [self setAddress:nil];
    [self setProvider:nil];
    
    [self setIsConnectFacebook:nil];
    [self setIsConnectQuickplay:nil];
    [self setIsConnectApple:nil];
    
    [self setCanUpdateUsername:nil];
    [self setRequireInitPassword:nil];
    [self setShowProtectDialog:nil];
}

+ (NSString *)getToken{ return [VGPHelper getNSUserDefaults:VGP_USER_TOKEN]; }
+ (void)setToken:(nullable NSString *)token{ [VGPHelper setNSUserDefaults:VGP_USER_TOKEN value:token]; }
+ (NSInteger)getUserID{ return [[VGPHelper getNSUserDefaults:VGP_USER_USERID] intValue]; }
+ (void)setUserID:(NSInteger)userID{ [VGPHelper setNSUserDefaults:VGP_USER_USERID value:[@(userID) stringValue]]; }
+ (NSString *)getUsername{ return [VGPHelper getNSUserDefaults:VGP_USER_USERNAME]; }
+ (void)setUsername:(nullable NSString *)username{ [VGPHelper setNSUserDefaults:VGP_USER_USERNAME value:username]; }
+ (NSString *)getEmail{ return [VGPHelper getNSUserDefaults:VGP_USER_EMAIL]; }
+ (void)setEmail:(nullable NSString *)email{ [VGPHelper setNSUserDefaults:VGP_USER_EMAIL value:email]; }
+ (BOOL)getEmailVerified{ return [[VGPHelper getNSUserDefaults:VGP_USER_EMAIL_IS_VERIFIED] boolValue]; }
+ (void)setEmailVerified:(BOOL)value{ [VGPHelper setNSUserDefaults:VGP_USER_EMAIL_IS_VERIFIED value:[@(value) stringValue]]; }
+ (NSString *)getPhone{ return [VGPHelper getNSUserDefaults:VGP_USER_PHONE]; }
+ (void)setPhone:(nullable NSString *)phone{ [VGPHelper setNSUserDefaults:VGP_USER_PHONE value:phone]; }
+ (BOOL)getPhoneVerified{ return [[VGPHelper getNSUserDefaults:VGP_USER_PHONE_IS_VERIFIED] boolValue]; }
+ (void)setPhoneVerified:(BOOL)value{ [VGPHelper setNSUserDefaults:VGP_USER_PHONE_IS_VERIFIED value:[@(value) stringValue]]; }

+ (NSString *)getAvatar{ return [VGPHelper getNSUserDefaults:VGP_USER_AVATAR]; }
+ (void)setAvatar:(nullable NSString *)avatar{ [VGPHelper setNSUserDefaults:VGP_USER_AVATAR value:avatar]; }

+ (NSString *)getName{ return [VGPHelper getNSUserDefaults:VGP_USER_NAME]; }
+ (void)setName:(nullable NSString *)name{ [VGPHelper setNSUserDefaults:VGP_USER_NAME value:name]; }
+ (NSString *)getFirstName{ return [VGPHelper getNSUserDefaults:VGP_USER_FIRST_NAME]; }
+ (void)setFirstName:(nullable NSString *)firstName{ [VGPHelper setNSUserDefaults:VGP_USER_FIRST_NAME value:firstName]; }
+ (NSString *)getMiddleName{ return [VGPHelper getNSUserDefaults:VGP_USER_MIDDLE_NAME]; }
+ (void)setMiddleName:(nullable NSString *)middleName{ [VGPHelper setNSUserDefaults:VGP_USER_MIDDLE_NAME value:middleName]; }
+ (NSString *)getLastName{ return [VGPHelper getNSUserDefaults:VGP_USER_LAST_NAME]; }
+ (void)setLastName:(nullable NSString *)lastName{ [VGPHelper setNSUserDefaults:VGP_USER_LAST_NAME value:lastName]; }

+ (NSInteger)getGender{ return [[VGPHelper getNSUserDefaults:VGP_USER_GENDER] intValue]; }
+ (void)setGender:(NSInteger)gender{ [VGPHelper setNSUserDefaults:VGP_USER_GENDER value:[@(gender) stringValue]]; }
+ (NSString *)getGenderText{
    switch ([self getGender]) {
        case 0:
            return [VGPHelper localizationForString:@"profile.gender.select.male"];
        case 1:
            return [VGPHelper localizationForString:@"profile.gender.select.female"];
        case 2:
        default:
            return [VGPHelper localizationForString:@"profile.gender.select.other"];
    }
}
+ (NSDate *)getBirthDay{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:VGP_USER_DATE_FORMAT];
    NSDate *date = [dateFormatter dateFromString:[VGPHelper getNSUserDefaults:VGP_USER_BIRTHDAY]];
    if(date == nil) date = [NSDate date];
    return date;
}
+ (void)setBirthDay:(nullable NSString *)birthDay{ [VGPHelper setNSUserDefaults:VGP_USER_BIRTHDAY value:birthDay]; }

+ (NSString *)getPersonalIdentity{ return [VGPHelper getNSUserDefaults:VGP_USER_PERSONALIDENTITY]; }
+ (void)setPersonalIdentity:(nullable NSString *)personalIdentity{ [VGPHelper setNSUserDefaults:VGP_USER_PERSONALIDENTITY value:personalIdentity]; }
+ (NSDate *)getDateOfIssue{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:VGP_USER_DATE_FORMAT];
    NSDate *date = [dateFormatter dateFromString:[VGPHelper getNSUserDefaults:VGP_USER_DATEOFISSUE]];
    if(date == nil) date = [NSDate date];
    return date;
}
+ (void)setDateOfIssue:(nullable NSString *)dateOfIssue{ [VGPHelper setNSUserDefaults:VGP_USER_DATEOFISSUE value:dateOfIssue]; }
+ (NSString *)getPlaceOfIssue{ return [VGPHelper getNSUserDefaults:VGP_USER_PLACEOFISSUE]; }
+ (void)setPlaceOfIssue:(nullable NSString *)placeOfIssue{ [VGPHelper setNSUserDefaults:VGP_USER_PLACEOFISSUE value:placeOfIssue]; }

+ (NSString *)getAddress{ return [VGPHelper getNSUserDefaults:VGP_USER_ADDRESS]; }
+ (void)setAddress:(nullable NSString *)address{ [VGPHelper setNSUserDefaults:VGP_USER_ADDRESS value:address]; }
+ (NSString *)getProvider{ return [VGPHelper getNSUserDefaults:VGP_USER_PROVIDER]; }
+ (void)setProvider:(nullable NSString *)provider{ [VGPHelper setNSUserDefaults:VGP_USER_PROVIDER value:provider]; }

+ (BOOL)getIsConnectFacebook{ return [[VGPHelper getNSUserDefaults:VGP_USER_IS_CONNECT_FACEBOOK] boolValue]; }
+ (void)setIsConnectFacebook:(BOOL)value{ [VGPHelper setNSUserDefaults:VGP_USER_IS_CONNECT_FACEBOOK value:[@(value) stringValue]]; }
+ (BOOL)getIsConnectQuickplay{ return [[VGPHelper getNSUserDefaults:VGP_USER_IS_CONNECT_QUICKPLAY] boolValue]; }
+ (void)setIsConnectQuickplay:(BOOL)value{ [VGPHelper setNSUserDefaults:VGP_USER_IS_CONNECT_QUICKPLAY value:[@(value) stringValue]]; }
+ (BOOL)getIsConnectApple{ return [[VGPHelper getNSUserDefaults:VGP_USER_IS_CONNECT_APPLE] boolValue]; }
+ (void)setIsConnectApple:(BOOL)value{ [VGPHelper setNSUserDefaults:VGP_USER_IS_CONNECT_APPLE value:[@(value) stringValue]]; }

+ (BOOL)getCanUpdateUsername{ return [[VGPHelper getNSUserDefaults:VGP_USER_CANUPDATEUSERNAME] boolValue]; }
+ (void)setCanUpdateUsername:(BOOL)canUpdateUsername{ [VGPHelper setNSUserDefaults:VGP_USER_CANUPDATEUSERNAME value:[@(canUpdateUsername) stringValue]]; }
+ (BOOL)getRequireInitPassword{ return [[VGPHelper getNSUserDefaults:VGP_USER_REQUIREINITPASSWORD] boolValue]; }
+ (void)setRequireInitPassword:(BOOL)requireInitPassword{ [VGPHelper setNSUserDefaults:VGP_USER_REQUIREINITPASSWORD value:[@(requireInitPassword) stringValue]]; }
+ (BOOL)getShowProtectDialog{ return [[VGPHelper getNSUserDefaults:VGP_USER_SHOW_PROTECT_DIALOG] boolValue]; }
+ (void)setShowProtectDialog:(BOOL)showProtectDialog{ [VGPHelper setNSUserDefaults:VGP_USER_SHOW_PROTECT_DIALOG value:[@(showProtectDialog) stringValue]]; }

@end
