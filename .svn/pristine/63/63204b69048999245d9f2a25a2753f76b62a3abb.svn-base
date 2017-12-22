//
//  SBShareConfigManager.m
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/19.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import "SB_Umeng_PlatformConfigHelper.h"
#import <UMSocialCore/UMSocialCore.h>

@implementation SB_Umeng_PlatformConfigHelper

+ (void)sb_Config_UmengAppKey:(NSString *)umengAppKey
                  umAppSecret:(NSString *)umAppSecret
                   logEnabled:(BOOL)logEnabled {
    
    [[UMSocialManager defaultManager] setUmSocialAppkey:umengAppKey];
    [[UMSocialManager defaultManager] setUmSocialAppSecret:umAppSecret];
    [[UMSocialManager defaultManager] openLog:logEnabled];
}

+ (void)sb_Config_PlaformCongfigType:(SBUmengPlatformConfigType)platformConfigType
                              appKey:(NSString *)appKey
                           appSecret:(NSString *)appSecret
                         redirectURL:(NSString *)redirectURL {
    
    [[UMSocialManager defaultManager] setPlaform:[[self class] getUMSocialPlatformTypeBySBUmengPlatformConfigType:platformConfigType] appKey:appKey appSecret:appKey redirectURL:redirectURL];
}


#pragma mark - private method
- (UMSocialPlatformType)getUMSocialPlatformTypeBySBUmengPlatformConfigType:(SBUmengPlatformConfigType)sbUmengPlatformConfigType {
    UMSocialPlatformType platFormType = UMSocialPlatformType_UnKnown;
    switch (sbUmengPlatformConfigType) {
        case SBUmengPlatformConfigType_Tencent:
            platFormType = UMSocialPlatformType_QQ;
            break;
        case SBUmengPlatformConfigType_Sina:
            platFormType = UMSocialPlatformType_Sina;
            break;
        case SBUmengPlatformConfigType_Wechat:
            platFormType = UMSocialPlatformType_WechatSession;
            break;
        default:
            platFormType = UMSocialPlatformType_UnKnown;
            break;
    }
    return platFormType;
}

@end
