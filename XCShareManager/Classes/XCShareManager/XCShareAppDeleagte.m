//
//  XCappDeleagte.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/12/22.
//


/*
 *  备注：处理与 AppDeleagte 相关的配置 🐾
 */

#import "XCShareAppDeleagte.h"

#import "XCShareManager.h"


@implementation XCShareAppDeleagte

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    id<XCShareFactoryProtocol> shareFactory = [XCShareManager shareManager].shareFactory;
    
    if ([shareFactory respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)])
    {
        return [shareFactory application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    }
    
    return NO;
}

+ (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    id<XCShareFactoryProtocol> shareFactory = [XCShareManager shareManager].shareFactory;
    
    if ([shareFactory respondsToSelector:@selector(application:handleOpenURL:)])
    {
        return [shareFactory application:application handleOpenURL:url];
    }
    
    return NO;
}

/// 仅支持iOS9以上系统，iOS8及以下系统不会回调
+ (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    id<XCShareFactoryProtocol> shareFactory = [XCShareManager shareManager].shareFactory;
    
    if ([shareFactory respondsToSelector:@selector(application:openURL:options:)])
    {
        return [shareFactory application:app openURL:url options:options];
    }
    
    return NO;
}

@end
