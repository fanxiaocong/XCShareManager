//
//  XCShareAppDeledateProtocol.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/12/22.
//

#import <Foundation/Foundation.h>

@protocol XCShareAppDeledateProtocol <NSObject>

@required
- (void)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;

- (void)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

/// 仅支持iOS9以上系统，iOS8及以下系统不会回调
- (void)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;


@end
