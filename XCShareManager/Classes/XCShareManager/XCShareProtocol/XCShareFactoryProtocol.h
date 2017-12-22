//
//  XCShareFactoryProtocol.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//


/*
 *  备注：分享工厂协议 🐾
 */

#import <Foundation/Foundation.h>
#import "XCShareProtocol.h"
#import "XCShareAppDeledateProtocol.h"
#import "XCSharePlatformConfigure.h"

@protocol XCShareFactoryProtocol <XCShareAppDeledateProtocol>

@required
/** 👀 分享实体类 👀 */
@property (weak, nonatomic, readonly) id<XCShareProtocol> share;

/**
 *  根据 AppKey 创建分享工厂实体
 */
- (instancetype)initWithAppKey:(NSString *)appKey
                       appIcon:(UIImage *)appIcon
            platformConfigures:(NSArray<XCSharePlatformConfigure *> *)configures;

@end