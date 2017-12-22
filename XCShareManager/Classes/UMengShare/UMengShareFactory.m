//
//  UMengShareFactory.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import "UMengShareFactory.h"
#import "UMengShare.h"
#import "XCShareUI.h"

#import <UMSocialCore/UMSocialCore.h>


@interface UMengShareFactory ()

@property (copy, nonatomic) NSString *appKey;
@property (strong, nonatomic) XCShareUI *shareUI;

@end


@implementation UMengShareFactory
{
    UMengShare *_umengShare;
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
        _umengShare  = [[UMengShare alloc] initWithShareUI:self.shareUI appIcon:appIcon];
    }
    
    return self;
}

- (id<XCShareProtocol>)share
{
    return _umengShare;
}

#pragma mark - 👀 XCShareAppDeledateProtocol 👀 💤

- (void)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (void)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [[UMSocialManager defaultManager] handleOpenURL:url];
}

/// 仅支持iOS9以上系统，iOS8及以下系统不会回调
- (void)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
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
    // Override point for customization after application launch.
    //打开日志
    [[UMSocialManager defaultManager] openLog:YES];
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:self.appKey];
    
    // 获取友盟social版本号
    NSLog(@"UMeng social version: %@", [UMSocialGlobal umSocialSDKVersion]);
    
    /// 配置分享 平台参数
    [configures enumerateObjectsUsingBlock:^(XCSharePlatformConfigure * _Nonnull config, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 友盟分享平台
        UMSocialPlatformType platformType;
        
        switch (config.platformType)
        {
            case XCSharePlatformTypeQQ:
            {
                platformType = UMSocialPlatformType_QQ;     // QQ好友
                break;
            }
            case XCSharePlatformTypeQQZone:
            {
                platformType = UMSocialPlatformType_Qzone;  // QQ空间
                break;
            }
            case XCSharePlatformTypeWechat:
            {
                platformType = UMSocialPlatformType_WechatSession;  // 微信好友
                break;
            }
            case XCSharePlatformTypeWechatTimeLine:
            {
                platformType = UMSocialPlatformType_WechatTimeLine; // 微信朋友圈
                break;
            }
            case XCSharePlatformTypeSina:
            {
                platformType = UMSocialPlatformType_Sina;       // 新浪
                break;
            }
        }
        
        // 各平台的详细配置
        [[UMSocialManager defaultManager] setPlaform:platformType
                                              appKey:config.appId
                                           appSecret:config.appSecret
                                         redirectURL:config.appRedirectURL];
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
        UMengShare *share = weakSelf.share;
        
        // 点击分享 item 的回调
        [share clickItemAction:platformType];
    }];
}

@end