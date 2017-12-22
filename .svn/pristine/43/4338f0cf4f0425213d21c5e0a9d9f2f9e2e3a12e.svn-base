//
//  XCShareManager.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import "XCShareManager.h"


@interface XCShareManager ()

@property (strong, nonatomic) NSArray<XCSharePlatformConfigure *> *configures;

/** 👀 AppKey 👀 */
@property (copy, nonatomic) NSString *appKey;
/** 👀 分享类型 👀 */
@property (assign, nonatomic) XCShareType shareType;
@property (strong, nonatomic) UIImage *appIcon;

@end


@implementation XCShareManager

/**
 *  配置分享平台
 *
 *  @param shareType        分享类型
 *  @param appKey           分享AppKey
 *  @param appIcon          appIcon
 *  @param activePlatforms  分享平台（@（XCSharePlatformTypeQQ）...）
 *  @param configure        配置
 */
+ (void)configureShareType:(XCShareType)shareType
                    appKey:(NSString *)appKey
                   appIcon:(UIImage *)appIcon
           activePlatforms:(NSArray<NSNumber *> *)activePlatforms
         platformConfigure:(void(^)(XCSharePlatformConfigure *configure))configure
{
    XCShareManager *mgr = [XCShareManager shareManager];
    
    mgr.shareType = shareType;
    mgr.appKey    = appKey;
    mgr.appIcon   = appIcon;
    
    NSMutableArray *mArr = [NSMutableArray array];
    [activePlatforms enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        XCSharePlatformType platformType = obj.integerValue;
        
        XCSharePlatformConfigure *config = [[XCSharePlatformConfigure alloc] initWithPlatformType:platformType];
        
        /// 配置参数
        if (configure)
        {
            configure(config);
        }
        
        [mArr addObject:config];
    }];
    
    mgr.configures = mArr;
}

static id _instance = nil;

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}


- (id<XCShareFactoryProtocol>)shareFactory
{
    if (!_shareFactory)
    {
        switch (self.shareType)
        {
            case XCShareTypeUMeng:
            {
                Class shareFactoryClass = NSClassFromString(@"UMengShareFactory");
                _shareFactory = [[shareFactoryClass alloc] initWithAppKey:self.appKey appIcon:self.appIcon platformConfigures:self.configures];
                break;
            }
            case XCShareTypeShareSDK:
            {
                break;
            }
        }
    }
    
    return _shareFactory;
}

@end
