//
//  SBShareConfigManager.h
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/19.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import <Foundation/Foundation.h>

// 配置类型 目前只支持新浪、微信、腾讯
typedef NS_ENUM(NSInteger,SBUmengPlatformConfigType) {
    SBUmengPlatformConfigType_Sina,        //新浪
    SBUmengPlatformConfigType_Wechat,      //微信
    SBUmengPlatformConfigType_Tencent,     //腾讯
};

@interface SB_Umeng_PlatformConfigHelper : NSObject

/**
 配置Umeng平台
 
 @param umengAppKey   Umeng平台appKey
 @param umAppSecret   Umeng平台appSecret
 @param logEnabled    Umeng平台是否开启DeLog
 */
+ (void)sb_Config_UmengAppKey:(NSString *)umengAppKey
                  umAppSecret:(NSString *)umAppSecret
                   logEnabled:(BOOL)logEnabled;

/**
 设置对应平台配置内容
 
 @param platformConfigType  平台类型
 @param appKey              平台appKey     （QQ平台为appID）
 @param appSecret           平台appSecret  （QQ平台为appKey）
 @param redirectURL         平台redirectURL (新浪的回掉地址一定要和网站上的写的一样，QQ和微信可以置空）
 */
+ (void)sb_Config_PlaformCongfigType:(SBUmengPlatformConfigType)platformConfigType
                              appKey:(NSString *)appKey
                           appSecret:(NSString *)appSecret
                         redirectURL:(NSString *)redirectURL;

@end
