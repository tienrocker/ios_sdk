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
#define VGP_USER_USERID @"VGP_USER_USERID"
#define VGP_USER_USERNAME @"VGP_USER_USERNAME"
#define VGP_USER_EMAIL @"VGP_USER_EMAIL"
#define VGP_USER_PHONE @"VGP_USER_PHONE"

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

#define VGP_USER_THIRDPARTYCONNECT @"VGP_USER_THIRDPARTYCONNECT"

#define VGP_USER_CANUPDATEUSERNAME @"VGP_USER_CANUPDATEUSERNAME"
#define VGP_USER_REQUIREINITPASSWORD @"VGP_USER_REQUIREINITPASSWORD"


@interface VGPUserData : NSObject

+ (NSInteger)getUserID;
+ (void)setUserID:(NSInteger)userID;
+ (NSString *)getUsername;
+ (void)setUsername:(NSString *)username;
+ (NSString *)getEmail;
+ (void)setEmail:(NSString *)email;
+ (NSString *)getPhone;
+ (void)setPhone:(NSString *)phone;

+ (NSString *)getAvatar;
+ (void)setAvatar:(NSString *)avatar;

+ (NSString *)getName;
+ (void)setName:(NSString *)name;
+ (NSString *)getFirstName;
+ (void)setFirstName:(NSString *)firstName;
+ (NSString *)getMiddleName;
+ (void)setMiddleName:(NSString *)middleName;
+ (NSString *)getLastName;
+ (void)setLastName:(NSString *)lastName;

+ (NSInteger)getGender;
+ (void)setGender:(NSInteger)gender;
+ (NSDate *)getBirthDay; // format yyyy/MM/dd
+ (void)setBirthDay:(NSString *)birthDay;

+ (NSString *)getPersonalIdentity;
+ (void)setPersonalIdentity:(NSString *)personalIdentity;
+ (NSDate *)getDateOfIssue;
+ (void)setDateOfIssue:(NSString *)dateOfIssue; // format yyyy/MM/dd
+ (NSString *)getPlaceOfIssue;
+ (void)setPlaceOfIssue:(NSString *)placeOfIssue;

+ (NSString *)getAddress;
+ (void)setAddress:(NSString *)address;
+ (NSString *)getProvider;
+ (void)setProvider:(NSString *)provider;

+ (NSArray *)getThirdPartyConnect;
+ (void)setThirdPartyConnect:(NSArray *)thirdPartyConnect;

+ (BOOL)getCanUpdateUsername;
+ (void)setCanUpdateUsername:(BOOL)canUpdateUsername;
+ (BOOL)getRequireInitPassword;
+ (void)setRequireInitPassword:(BOOL)requireInitPassword;

@end

NS_ASSUME_NONNULL_END
