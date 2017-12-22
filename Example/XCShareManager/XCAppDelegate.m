//
//  XCAppDelegate.m
//  XCShareManager
//
//  Created by fanxiaocong on 11/06/2017.
//  Copyright (c) 2017 fanxiaocong. All rights reserved.
//

#import "XCAppDelegate.h"

#import <XCShareManager/XCShareManager.h>
#import <XCShareManager/XCShareAppDeleagte.h>


@implementation XCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [XCShareManager configureShareType:XCShareTypeUMeng
                                appKey:@""
                               appIcon:NULL
                       activePlatforms:@[@(XCSharePlatformTypeQQ),
                                         @(XCSharePlatformTypeQQZone),
                                         @(XCSharePlatformTypeWechat),
                                         @(XCSharePlatformTypeWechatTimeLine),
                                         @(XCSharePlatformTypeSina)]
                     platformConfigure:^(XCSharePlatformConfigure *configure) {

        switch (configure.platformType)
        {
            case XCSharePlatformTypeQQ:
            {
                configure.appId = @"";
                configure.appSecret = @"";
                configure.appRedirectURL = @"";
                break;
            }
            case XCSharePlatformTypeQQZone:
            {
                break;
            }
            case XCSharePlatformTypeWechat:
            {
                break;
            }
            case XCSharePlatformTypeWechatTimeLine:
            {
                break;
            }
            case XCSharePlatformTypeSina:
            {
                break;
            }
        }
    }];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [XCShareAppDeleagte shareApplication:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [XCShareAppDeleagte shareApplication:application handleOpenURL:url];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    [XCShareAppDeleagte shareApplication:app openURL:url options:options];
    return YES;
}

@end
