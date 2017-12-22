//
//  SBShareHelper.m
//  SBShareHelper_Master
//
//  Created by cxx on 2017/7/19.
//  Copyright © 2017年 CAPF. All rights reserved.
//

#import "SB_Umeng_PlatformShareHelper.h"
#import <UMSocialCore/UMSocialManager.h>
#import <UMSocialCore/UMSocialMessageObject.h>
#import "SB_Umeng_PlatformVerifyHelper.h"

@implementation SB_Umeng_PlatformShareHelper
+ (void)sb_Share_TextWithPlatformType:(SBUmengPlatformType)platformType
                            shareText:(NSString *)shareText
                           completion:(SBUmengPlatformShareCompletionBlock)completionHandler {
    
    // 获取对应的UMSocialPlatformType
    UMSocialPlatformType umPlatFormType = [SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType];
    // 创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    // 分享的文本
    messageObject.text = shareText;
    // 友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}

+ (void)sb_Share_ImageWithPlatformType:(SBUmengPlatformType)platformType
                            shareImage:(id)shareImage
                            shareTitle:(NSString *)shareTitle
                            shareDescr:(NSString *)shareDescr
                        shareThumImage:(id)shareThumImage
                            completion:(SBUmengPlatformShareCompletionBlock)completionHandler {
    
    // 获取对应的UMSocialPlatformType
    UMSocialPlatformType umPlatFormType = [SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType];
    // 创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    // 创建分享图片内容对象
    UMShareImageObject *shareObject = [UMShareImageObject shareObjectWithTitle:shareTitle descr:shareDescr thumImage:shareThumImage];
    // 分享的图片
    shareObject.shareImage = shareImage;
    // 分享消息对象赋值
    messageObject.shareObject = shareObject;
    // 友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}

+ (void)sb_Share_ImageAndTextWithPlatformType:(SBUmengPlatformType)platformType
                                   shareImage:(id)shareImage
                                    shareText:(NSString *)shareText
                                   shareTitle:(NSString *)shareTitle
                                   shareDescr:(NSString *)shareDescr
                               shareThumImage:(id)shareThumImage
                                   completion:(SBUmengPlatformShareCompletionBlock)completionHandler{
    
    // 获取对应的UMSocialPlatformType
    UMSocialPlatformType umPlatFormType = [SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType];
    // 创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    // 分享的文本
    messageObject.text = shareText;
    // 创建分享图片对象
    UMShareImageObject *shareObject = [UMShareImageObject shareObjectWithTitle:shareTitle descr:shareDescr thumImage:shareThumImage];
    // 分享的图片
    shareObject.shareImage = shareImage;
    // 分享消息对象赋值
    messageObject.shareObject = shareObject;
    // 友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}

+ (void)sb_Share_URLWithPlatformType:(SBUmengPlatformType)platformType
                            shareUrl:(NSString *)shareUrl
                          shareTitle:(NSString *)shareTitle
                          shareDescr:(NSString *)shareDescr
                      shareThumImage:(id)shareThumImage
                          completion:(SBUmengPlatformShareCompletionBlock)completionHandler{
    
    // 获取对应的UMSocialPlatformType
    UMSocialPlatformType umPlatFormType = [SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType];
    // 创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    // 创建分享网页对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:shareTitle descr:shareDescr thumImage:shareThumImage];
    // 分享的网页地址
    shareObject.webpageUrl = shareUrl;
    // 分享消息对象赋值
    messageObject.shareObject = shareObject;
    // 友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}

+ (void)sb_Share_VideoWebWithPlatformType:(SBUmengPlatformType)platformType
                         shareVideoWebUrl:(NSString *)shareVideoWebUrl
                               shareTitle:(NSString *)shareTitle
                               shareDescr:(NSString *)shareDescr
                           shareThumImage:(id)shareThumImage
                               completion:(SBUmengPlatformShareCompletionBlock)completionHandler {
    
    // 获取对应的UMSocialPlatformType
    UMSocialPlatformType umPlatFormType = [SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType];
    // 创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    // 创建分享视频网页对象
    UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:shareTitle descr:shareDescr thumImage:shareThumImage];
    // 分享的视频网页地址
    shareObject.videoUrl = shareVideoWebUrl;
    // 分享消息对象赋值
    messageObject.shareObject = shareObject;
    // 友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}

+ (void)sb_Share_MusicWebWithPlatformType:(SBUmengPlatformType)platformType
                         shareMusicWebUrl:(NSString *)shareMusicWebUrl
                               shareTitle:(NSString *)shareTitle
                               shareDescr:(NSString *)shareDescr
                           shareThumImage:(id)shareThumImage
                               completion:(SBUmengPlatformShareCompletionBlock)completionHandler {
    
    // 获取对应的UMSocialPlatformType
    UMSocialPlatformType umPlatFormType = [SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType];
    // 创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    // 创建分享音乐对象
    UMShareMusicObject *shareObject = [UMShareMusicObject shareObjectWithTitle:shareTitle descr:shareDescr thumImage:shareThumImage];
    // 分享的音乐网页地址
    shareObject.musicUrl = shareMusicWebUrl;
    // 分享消息对象赋值
    messageObject.shareObject = shareObject;
    // 友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}

+ (void)sb_Share_MiniProgramWithPlatformType:(SBUmengPlatformType)platformType
                             shareWebpageUrl:(NSString *)shareWebpageUrl
                               shareUserName:(NSString *)shareUserName
                                   sharePath:(NSString *)sharePath
                                  shareTitle:(NSString *)shareTitle
                                  shareDescr:(NSString *)shareDescr
                              shareThumImage:(id)shareThumImage
                                  completion:(SBUmengPlatformShareCompletionBlock)completionHandler {
    
    // 获取对应的UMSocialPlatformType
    UMSocialPlatformType umPlatFormType = [SB_Umeng_PlatformVerifyHelper sb_Verify_ObtainUmengSocialPlatformTypeBySBUmengPlatformType:platformType];
    // 创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    // 创建分享小程序对象
    UMShareMiniProgramObject *shareObject = [UMShareMiniProgramObject shareObjectWithTitle:shareTitle descr:shareDescr thumImage:shareThumImage];
    // 兼容微信低版本网页地址
    shareObject.webpageUrl = shareWebpageUrl;
    // 小程序用户名
    shareObject.userName = shareUserName;
    // 小程序页面路径
    shareObject.path = sharePath;
    // 分享消息对象赋值
    messageObject.shareObject = shareObject;
    // 友盟分享
    [[UMSocialManager defaultManager] shareToPlatform:umPlatFormType messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
        completionHandler(result, error);
    }];
}
@end
