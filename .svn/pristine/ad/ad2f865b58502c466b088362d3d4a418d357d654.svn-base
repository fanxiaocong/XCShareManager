//
//  UMengShare.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//


/*
 *  备注：友盟分享实体类 🐾
 */

#import <Foundation/Foundation.h>
#import "XCShareProtocol.h"
#import "XCShareUI.h"

@interface UMengShare : NSObject<XCShareProtocol>

/**
 *  初始化分享UI
 */
- (instancetype)initWithShareUI:(XCShareUI *)shareUI
                        appIcon:(UIImage *)appIcon;

/**
 *  点击分享平台 Item 的回调
 *
 *  @param platformType 分享平台
 */
- (void)clickItemAction:(XCSharePlatformType)platformType;

@end
