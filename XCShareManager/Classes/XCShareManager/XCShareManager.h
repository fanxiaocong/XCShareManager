//
//  XCShareManager.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import <Foundation/Foundation.h>

#import "XCShareFactoryProtocol.h"

#import "XCSharePlatformConfigure.h"


typedef NS_ENUM(NSInteger, XCShareType)
{
    XCShareTypeUMeng = 0,   /// 友盟分享
    
    XCShareTypeShareSDK     /// ShareSDK
};


@interface XCShareManager : NSObject

/** 👀 分享工厂 👀 */
@property (strong, nonatomic) id<XCShareFactoryProtocol> shareFactory;


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
         platformConfigure:(void(^)(XCSharePlatformConfigure *configure))configure;

+ (instancetype)shareManager;

@end
