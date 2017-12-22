//
//  SB_Umeng_PlatformVerify.m
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/20.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import "SB_Umeng_PlatformAuthHelper.h"
#import <UMSocialCore/UMSocialManager.h>
#import <UMSocialCore/UMSocialResponse.h>
#import "SB_Umeng_PlatformVerifyHelper.h"

@implementation SB_Umeng_PlatformAuthHelper

+ (void)sb_Auth_authWithPlatformType:(SBUmengPlatformType)platformType completion:(SBUmengPlatformAuthCompletionHandler)completionHandler {
    [[UMSocialManager defaultManager] authWithPlatform:[SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType] currentViewController:nil completion:^(id result, NSError *error) {
        UMSocialAuthResponse *authresponse = result;
        completionHandler(authresponse.uid, authresponse.openid, authresponse.accessToken, error);
    }];
}

+ (void)sb_Auth_cancelAuthWithPlatformType:(SBUmengPlatformType)platformType completion:(SBUmengPlatformCancelAuthCompletionHandler)completionHandler {
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:[SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType] completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}

+ (void)sb_Auth_getUserInfoWithPlatformType:(SBUmengPlatformType)platformType completion:(SBUmengPlatformGetUserInfoCompletionHandler)completionHandler {
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:[SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType] currentViewController:nil completion:^(id result, NSError *error) {
        UMSocialUserInfoResponse *userinfo = result;
        completionHandler(userinfo.uid, userinfo.openid, userinfo.accessToken, userinfo.name, userinfo.iconurl, userinfo.gender, error);
    }];
}
@end
