//
//  SB_Umeng_PlatformVerifyHelper.h
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/20.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialPlatformConfig.h>
#import "SB_Umeng_PlatformType.h"

@interface SB_Umeng_PlatformVerifyHelper : NSObject
/**
 判断当前手机是否有安装相应的APP
 
 @param platformType 平台类型
 @return YES 有安装 NO 未安装
 @note 调用前请检查是否配置好平台相关白名单: http://dev.umeng.com/social/ios/quick-integration#1_3
 在判断QQ空间的App的时候，QQApi判断会出问题
 */
+ (BOOL)sb_Verify_isInstallAppWithPlatformType:(SBUmengPlatformType)platformType;

/**
 判断当前平台是否支持分享
 
 @param platformType 平台类型
 @return YES 支持 NO 不支持
 */
+ (BOOL)sb_Verify_isSupportShareWithPlatformType:(SBUmengPlatformType)platformType;

/**
 根据自定义平台类型获取umeng平台类型
 
 @param sbUmengPlatformType   自定义平台类型
 @return UMSocialPlatformType Umeng的平台类型
 */
+ (UMSocialPlatformType)sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:(SBUmengPlatformType)sbUmengPlatformType;
@end
