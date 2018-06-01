//
//  MobShareFactory.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import "MobShareFactory.h"
#import "MobShare.h"
#import "XCShareUI.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>


@interface MobShareFactory ()

@property (copy, nonatomic) NSString *appKey;
@property (strong, nonatomic) XCShareUI *shareUI;

@end


@implementation MobShareFactory
{
    MobShare *_mobShare;
}


#pragma mark - 👀 XCShareFactoryProtocol 👀 💤

/**
 *  根据 AppKey 创建分享工厂实体
 */
- (instancetype)initWithAppKey:(NSString *)appKey
                       appIcon:(UIImage *)appIcon
            platformConfigures:(NSArray<XCSharePlatformConfigure *> *)configures
{
    if (self = [super init])
    {
        _appKey  = appKey;
        // 配置分享平台
        [self configurePlatformConfigures:configures];
        _mobShare  = [[MobShare alloc] initWithShareUI:self.shareUI appIcon:appIcon];
    }
    
    return self;
}

- (id<XCShareProtocol>)share
{
    return _mobShare;
}

#pragma mark - 🔒 👀 Privite Method 👀

- (void)configurePlatformConfigures:(NSArray<XCSharePlatformConfigure *> *)configures
{
    /// 配置分享 AppKey
    [self configureAppKey:configures];
    
    /// 配置 分享 UI
    [self configureUI:configures];
}

/**
 *  配置分享 AppKey
 */
- (void)configureAppKey:(NSArray<XCSharePlatformConfigure *> *)configures
{
    NSMutableArray *activePlatforms = [NSMutableArray array];
    
    /// 配置分享 平台参数
    [configures enumerateObjectsUsingBlock:^(XCSharePlatformConfigure * _Nonnull config, NSUInteger idx, BOOL * _Nonnull stop) {
        
        SSDKPlatformType platformType = SSDKPlatformSubTypeWechatSession;
        
        switch (config.platformType)
        {
            case XCSharePlatformTypeQQ:
            case XCSharePlatformTypeQQZone:
            {
                platformType = SSDKPlatformTypeQQ;  // QQ空间 QQ好友
                break;
            }
            case XCSharePlatformTypeWechat:
            case XCSharePlatformTypeWechatTimeLine:
            {
                platformType = SSDKPlatformTypeWechat; // 微信朋友圈 微信好友
                break;
            }
            case XCSharePlatformTypeSina:
            {
                platformType = SSDKPlatformTypeSinaWeibo;       // 新浪
                break;
            }
        }
        
        /// 添加 需要分离的平台
        [activePlatforms addObject:@(platformType)];
    }];
    
    
    [ShareSDK registerActivePlatforms:activePlatforms
                             onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:NSClassFromString(@"WXApi")];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:NSClassFromString(@"QQApiInterface") tencentOAuthClass:NSClassFromString(@"TencentOAuth")];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:NSClassFromString(@"WeiboSDK")];
                 break;
             default:
                 break;
         }
     } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:FetchAppID(XCSharePlatformTypeSina, configures)
                                           appSecret:FetchAppSecret(XCSharePlatformTypeSina, configures)
                                         redirectUri:FetchAppRedirectURL(XCSharePlatformTypeSina, configures)
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:FetchAppID(XCSharePlatformTypeWechat, configures)
                                       appSecret:FetchAppSecret(XCSharePlatformTypeWechat, configures)];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:FetchAppID(XCSharePlatformTypeQQ, configures)
                                      appKey:FetchAppSecret(XCSharePlatformTypeQQ, configures)
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                   break;
         }
     }];
}

/**
 *  配置 分享 UI
 */
- (void)configureUI:(NSArray<XCSharePlatformConfigure *> *)configures
{
    /// 配置 分享 UI
    self.shareUI = [[XCShareUI alloc] init];
    
    __weak typeof(self)weakSelf = self;
    
    [self.shareUI setupShareUIWithConfigures:configures didClickItemHandle:^(XCSharePlatformType platformType) {
        
        // 友盟分享
        MobShare *share = weakSelf.share;
        
        // 点击分享 item 的回调
        [share clickItemAction:platformType];
    }];
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  获取 AppID
 */
static inline NSString * FetchAppID(XCSharePlatformType platformType, NSArray *configures)
{
    for (XCSharePlatformConfigure *configure in configures)
    {
        if (configure.platformType == platformType) {
            return configure.appId;
        }
    }
    
    return @"";
}

/**
 *  获取 AppSecret
 */
static inline NSString * FetchAppSecret(XCSharePlatformType platformType, NSArray *configures)
{
    for (XCSharePlatformConfigure *configure in configures)
    {
        if (configure.platformType == platformType) {
            return configure.appSecret;
        }
    }
    
    return @"";
}

/**
 *  获取 AppRedirectURL
 */
static inline NSString * FetchAppRedirectURL(XCSharePlatformType platformType, NSArray *configures)
{
    for (XCSharePlatformConfigure *configure in configures)
    {
        if (configure.platformType == platformType) {
            return configure.appRedirectURL;
        }
    }
    
    return @"";
}

@end
