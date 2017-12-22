//
//  XCShareUI.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/8.
//


/*
 *  备注：分享UI 🐾
 */

#import <Foundation/Foundation.h>

#import "XCShareUtil.h"
#import "XCShareView.h"
#import "XCSharePlatformConfigure.h"


@interface XCShareUI : NSObject

/**
 *  设置分享 UI
 *
 *  @param configures           分享配置
 *  @param didClickItemHandle   点击分享Item的回调
 */
- (void)setupShareUIWithConfigures:(NSArray<XCSharePlatformConfigure *> *)configures
                didClickItemHandle:(void(^)(XCSharePlatformType platformType))didClickItemHandle;


/**
 *  显示
 */
- (void)show;

/**
 *  隐藏
 */
- (void)hide;

@end
