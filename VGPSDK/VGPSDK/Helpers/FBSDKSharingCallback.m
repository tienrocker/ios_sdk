//
//  FBSDKSharingCallback.m
//  VGPSDK
//
//  Created by  Tien Tran on 3/16/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "FBSDKSharingCallback.h"
#import "VGPConfig.h"
#import "VGPHelper.h"

@implementation FBSDKSharingCallback

- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results
{
    [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"ok"] message:@"share_facebook_success"];
    [[NSNotificationCenter defaultCenter] postNotificationName:VGP_EVENT_FACEBOOK_SHARE_SUCCESS object:nil];
}

- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error
{
    [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:@"share_facebook_error"];
}

- (void)sharerDidCancel:(id<FBSDKSharing>)sharer
{
    [VGPHelper alertControllerWithTitle:[VGPHelper localizationForString:@"error"] message:@"share_facebook_cancel"];
}

@end
