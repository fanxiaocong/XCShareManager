//
//  SB_Umeng_PlatformVerifyHelper.m
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/20.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import "SB_Umeng_PlatformVerifyHelper.h"
#import <UMSocialCore/UMSocialManager.h>
@implementation SB_Umeng_PlatformVerifyHelper

+ (BOOL)sb_Verify_isInstallAppWithPlatformType:(SBUmengPlatformType)platformType {
    BOOL result = NO;
    result=[[UMSocialManager defaultManager] isInstall:[[self class] sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType]];
    return result;
}

+ (BOOL)sb_Verify_isSupportShareWithPlatformType:(SBUmengPlatformType)platformType {
    BOOL result = NO;
    result=[[UMSocialManager defaultManager] isSupport:[[self class] sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType]];
    return result;
}

+ (UMSocialPlatformType)sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:(SBUmengPlatformType)sbUmengPlatformType {
    UMSocialPlatformType platFormType = UMSocialPlatformType_UnKnown;
    switch (sbUmengPlatformType) {
        case SBUmengPlatformType_QQ:
            platFormType = UMSocialPlatformType_QQ;
            break;
        case SBUmengPlatformType_Sina:
            platFormType = UMSocialPlatformType_Sina;
            break;
        case SBUmengPlatformType_Qzone:
            platFormType = UMSocialPlatformType_Qzone;
            break;
        case SBUmengPlatformType_TencentWb:
            platFormType = UMSocialPlatformType_TencentWb;
            break;
        case SBUmengPlatformType_WechatSession:
            platFormType = UMSocialPlatformType_WechatSession;
            break;
        case SBUmengPlatformType_WechatTimeLine:
            platFormType = UMSocialPlatformType_WechatTimeLine;
            break;
        default:
            platFormType = UMSocialPlatformType_UnKnown;
            break;
    }
    return platFormType;
}
@end
