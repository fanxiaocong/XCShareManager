//
//  SB_Umeng_PlatformVerify.h
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/20.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SB_Umeng_PlatformType.h"

/**
 授权 (不能获取用户信息, 推荐使用下面第三个回掉)
 
 @param uid         授权成功获得uid   （QQ：openid   微信：unionid   新浪：uid）
 @param openid      授权成功获得openid (QQ和微信有openid，新浪没有)
 @param accessToken 授权成功获得accessToken
 @param error       error
 */
typedef void (^SBUmengPlatformAuthCompletionHandler)(NSString *uid, NSString *openid, NSString *accessToken, NSError *error);

/**
 取消授权
 
 @param result  结果
 @param error   error
 */
typedef void (^SBUmengPlatformCancelAuthCompletionHandler)(id result, NSError *error);

/**
 授权并获得用户信息
 
 @param uid         授权成功获得uid   （QQ：openid   微信：unionid   新浪：uid）
 @param openid      授权成功获得openid (QQ和微信有openid，新浪没有)
 @param accessToken 授权成功获得accessToken
 @param name        用户名称
 @param iconUrl     头像URL
 @param gender      性别 （该字段会直接返回男女）
 @param error       error
 */
typedef void (^SBUmengPlatformGetUserInfoCompletionHandler)(NSString *uid, NSString *openid, NSString *accessToken, NSString *name, NSString *iconUrl, NSString *gender,NSError *error);

@interface SB_Umeng_PlatformAuthHelper : NSObject

@property (copy, nonatomic) SBUmengPlatformAuthCompletionHandler authCompletionBlock;
@property (copy, nonatomic) SBUmengPlatformCancelAuthCompletionHandler cancelAuthCompletionBlock;
@property (copy, nonatomic) SBUmengPlatformGetUserInfoCompletionHandler getUserInfoCompletionBlock;

/**
 授权
 
 @param platformType 平台类型
 */
+ (void)sb_Auth_authWithPlatformType:(SBUmengPlatformType)platformType completion:(SBUmengPlatformAuthCompletionHandler)completionHandler;

/**
 取消授权
 
 @param platformType 平台类型
 */
+ (void)sb_Auth_cancelAuthWithPlatformType:(SBUmengPlatformType)platformType completion:(SBUmengPlatformCancelAuthCompletionHandler)completionHandler;

/**
 授权并获得用户信息
 
 @param platformType 平台类型
 */
+ (void)sb_Auth_getUserInfoWithPlatformType:(SBUmengPlatformType)platformType completion:(SBUmengPlatformGetUserInfoCompletionHandler)completionHandler;

@end
