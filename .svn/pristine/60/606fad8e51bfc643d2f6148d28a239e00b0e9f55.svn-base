//
//  XCShareAppDeleagte.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/12/22.
//


/*
 *  备注：处理与 AppDeleagte 相关的配置 🐾
 */

#import <UIKit/UIKit.h>

@interface XCShareAppDeleagte : NSObject

+ (void)shareApplication:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

+ (void)shareApplication:(UIApplication *)application handleOpenURL:(NSURL *)url;

/// 仅支持iOS9以上系统，iOS8及以下系统不会回调
+ (void)shareApplication:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

@end
