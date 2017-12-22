//
//  SBShareHelper.h
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/19.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SB_Umeng_PlatformType.h"

/**
 *  分享操作的回调
 *
 *  @param result 代表回调的结果
 *  @param error  代表回调的错误码
 */
typedef void (^SBUmengPlatformShareCompletionBlock)(id result, NSError *error);

@interface SB_Umeng_PlatformShareHelper : NSObject

@property (copy, nonatomic) SBUmengPlatformShareCompletionBlock umengShareCompletionBlock;

/**
 纯文本分享
 
 @param platformType  平台类型
 @param shareText     分享内容
 */
+ (void)sb_Share_TextWithPlatformType:(SBUmengPlatformType)platformType
                            shareText:(NSString *)shareText
                           completion:(SBUmengPlatformShareCompletionBlock)completionHandler;

/**
 图片分享
 
 @param platformType      平台类型
 @param shareImage        分享的图片（UIImage或者NSData类型，或者image_url-NSString 图片大小根据各个平台限制而定)
 @param shareTitle        标题
 @param shareDescr        简介
 @param shareThumImage    缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 */
+ (void)sb_Share_ImageWithPlatformType:(SBUmengPlatformType)platformType
                            shareImage:(id)shareImage
                            shareTitle:(NSString *)shareTitle
                            shareDescr:(NSString *)shareDescr
                        shareThumImage:(id)shareThumImage
                            completion:(SBUmengPlatformShareCompletionBlock)completionHandler;

/**
 图文分享（........仅支持新浪..........）
 
 @param platformType      平台类型
 @param shareImage        分享的图片（UIImage或者NSData类型，或者image_url-NSString 图片大小根据各个平台限制而定)
 @param shareText         分享内容
 @param shareTitle        标题
 @param shareDescr        简介
 @param shareThumImage    缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 */
+ (void)sb_Share_ImageAndTextWithPlatformType:(SBUmengPlatformType)platformType
                                   shareImage:(id)shareImage
                                    shareText:(NSString *)shareText
                                   shareTitle:(NSString *)shareTitle
                                   shareDescr:(NSString *)shareDescr
                               shareThumImage:(id)shareThumImage
                                   completion:(SBUmengPlatformShareCompletionBlock)completionHandler;

/**
 URL分享
 
 @param platformType      平台类型
 @param shareUrl          分享的URL（不能为空且长度不能超过10K）
 @param shareTitle        标题
 @param shareDescr        简介
 @param shareThumImage    缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 @note  如果分享的url中含有中文字符，需要将中文部分进行url转码后可正常分享
 */
+ (void)sb_Share_URLWithPlatformType:(SBUmengPlatformType)platformType
                            shareUrl:(NSString *)shareUrl
                          shareTitle:(NSString *)shareTitle
                          shareDescr:(NSString *)shareDescr
                      shareThumImage:(id)shareThumImage
                          completion:(SBUmengPlatformShareCompletionBlock)completionHandler;

/**
 视频网页分享
 
 @param platformType      平台类型
 @param shareVideoWebUrl  视频网页的url地址（不能为空且长度不能超过255）
 @param shareTitle        标题
 @param shareDescr        简介
 @param shareThumImage    缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 @note  如果分享的url中含有中文字符，需要将中文部分进行url转码后可正常分享
 */
+ (void)sb_Share_VideoWebWithPlatformType:(SBUmengPlatformType)platformType
                         shareVideoWebUrl:(NSString *)shareVideoWebUrl
                               shareTitle:(NSString *)shareTitle
                               shareDescr:(NSString *)shareDescr
                           shareThumImage:(id)shareThumImage
                               completion:(SBUmengPlatformShareCompletionBlock)completionHandler;

/**
 音乐网页分享
 
 @param platformType      平台类型
 @param shareMusicWebUrl  音乐网页的url地址（长度不能超过10K）
 @param shareTitle        标题
 @param shareDescr        简介
 @param shareThumImage    缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 @note  如果分享的url中含有中文字符，需要将中文部分进行url转码后可正常分享
 */
+ (void)sb_Share_MusicWebWithPlatformType:(SBUmengPlatformType)platformType
                         shareMusicWebUrl:(NSString *)shareMusicWebUrl
                               shareTitle:(NSString *)shareTitle
                               shareDescr:(NSString *)shareDescr
                           shareThumImage:(id)shareThumImage
                               completion:(SBUmengPlatformShareCompletionBlock)completionHandler;

/**
 微信小程序分享 （........仅支持微信..........）
 
 @param platformType      平台类型
 @param shareWebpageUrl   兼容微信低版本网页地址
 @param shareUserName     小程序username，如 gh_3ac2059ac66f
 @param sharePath         小程序页面路径，如 pages/page10007/page10007
 @param shareTitle        小程序标题
 @param shareDescr        小程序内容描述
 @param shareThumImage    缩略图（UIImage或者NSData类型，或者image_url）
 @param completionHandler 结果
 @note  如果分享的url中含有中文字符，需要将中文部分进行url转码后可正常分享
 */
+ (void)sb_Share_MiniProgramWithPlatformType:(SBUmengPlatformType)platformType
                             shareWebpageUrl:(NSString *)shareWebpageUrl
                               shareUserName:(NSString *)shareUserName
                                   sharePath:(NSString *)sharePath
                                  shareTitle:(NSString *)shareTitle
                                  shareDescr:(NSString *)shareDescr
                              shareThumImage:(id)shareThumImage
                                  completion:(SBUmengPlatformShareCompletionBlock)completionHandler;

@end
