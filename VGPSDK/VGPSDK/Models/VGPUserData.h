//
//  VGPUserData.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VGPHelper.h"

NS_ASSUME_NONNULL_BEGIN

#define VGP_USER_DATE_FORMAT @"yyyy/MM/dd"
#define VGP_USER_TOKEN @"VGP_USER_TOKEN"
#define VGP_USER_USERID @"VGP_USER_USERID"
#define VGP_USER_USERNAME @"VGP_USER_USERNAME"
#define VGP_USER_EMAIL @"VGP_USER_EMAIL"
#define VGP_USER_EMAIL_IS_VERIFIED @"VGP_USER_EMAIL_IS_VERIFIED"
#define VGP_USER_PHONE @"VGP_USER_PHONE"
#define VGP_USER_PHONE_IS_VERIFIED @"VGP_USER_PHONE_IS_VERIFIED"

#define VGP_USER_AVATAR @"VGP_USER_AVATAR"

#define VGP_USER_NAME @"VGP_USER_NAME"
#define VGP_USER_FIRST_NAME @"VGP_USER_FIRST_NAME"
#define VGP_USER_MIDDLE_NAME @"VGP_USER_MIDDLE_NAME"
#define VGP_USER_LAST_NAME @"VGP_USER_LAST_NAME"

#define VGP_USER_GENDER @"VGP_USER_GENDER"
#define VGP_USER_BIRTHDAY @"VGP_USER_BIRTHDAY"

#define VGP_USER_PERSONALIDENTITY @"VGP_USER_PERSONALIDENTITY"
#define VGP_USER_DATEOFISSUE @"VGP_USER_DATEOFISSUE"
#define VGP_USER_PLACEOFISSUE @"VGP_USER_PLACEOFISSUE"

#define VGP_USER_ADDRESS @"VGP_USER_ADDRESS"
#define VGP_USER_PROVIDER @"VGP_USER_PROVIDER"

#define VGP_USER_IS_CONNECT_FACEBOOK @"VGP_USER_IS_CONNECT_FACEBOOK"
#define VGP_USER_IS_CONNECT_QUICKPLAY @"VGP_USER_IS_CONNECT_QUICKPLAY"
#define VGP_USER_IS_CONNECT_APPLE @"VGP_USER_IS_CONNECT_APPLE"

#define VGP_USER_CANUPDATEUSERNAME @"VGP_USER_CANUPDATEUSERNAME"
#define VGP_USER_REQUIREINITPASSWORD @"VGP_USER_REQUIREINITPASSWORD"

@interface VGPUserData : NSObject

+ (void)setUserData:data;
+ (void)clearUserData;

+ (NSString *)getToken;
+ (void)setToken:(nullable NSString *)token;
+ (NSInteger)getUserID;
+ (void)setUserID:(NSInteger)userID;
+ (NSString *)getUsername;
+ (void)setUsername:(nullable NSString *)username;
+ (NSString *)getEmail;
+ (void)setEmail:(nullable NSString *)email;
+ (BOOL)getEmailVerified;
+ (void)setEmailVerified:(BOOL)value;
+ (NSString *)getPhone;
+ (void)setPhone:(nullable NSString *)phone;
+ (BOOL)getPhoneVerified;
+ (void)setPhoneVerified:(BOOL)value;

+ (NSString *)getAvatar;
+ (void)setAvatar:(nullable NSString *)avatar;

+ (NSString *)getName;
+ (void)setName:(nullable NSString *)name;
+ (NSString *)getFirstName;
+ (void)setFirstName:(nullable NSString *)firstName;
+ (NSString *)getMiddleName;
+ (void)setMiddleName:(nullable NSString *)middleName;
+ (NSString *)getLastName;
+ (void)setLastName:(nullable NSString *)lastName;

+ (NSInteger)getGender;
+ (void)setGender:(NSInteger)gender;
+ (NSString *)getGenderText;
+ (NSDate *)getBirthDay; // format yyyy/MM/dd
+ (void)setBirthDay:(nullable NSString *)birthDay;

+ (NSString *)getPersonalIdentity;
+ (void)setPersonalIdentity:(nullable NSString *)personalIdentity;
+ (NSDate *)getDateOfIssue;
+ (void)setDateOfIssue:(nullable NSString *)dateOfIssue; // format yyyy/MM/dd
+ (NSString *)getPlaceOfIssue;
+ (void)setPlaceOfIssue:(nullable NSString *)placeOfIssue;

+ (NSString *)getAddress;
+ (void)setAddress:(nullable NSString *)address;
+ (NSString *)getProvider;
+ (void)setProvider:(nullable NSString *)provider;

+ (BOOL)getIsConnectFacebook;
+ (void)setIsConnectFacebook:(BOOL)value;
+ (BOOL)getIsConnectQuickplay;
+ (void)setIsConnectQuickplay:(BOOL)value;
+ (BOOL)getIsConnectApple;
+ (void)setIsConnectApple:(BOOL)value;

+ (BOOL)getCanUpdateUsername;
+ (void)setCanUpdateUsername:(BOOL)canUpdateUsername;
+ (BOOL)getRequireInitPassword;
+ (void)setRequireInitPassword:(BOOL)requireInitPassword;

@end

NS_ASSUME_NONNULL_END
