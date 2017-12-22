//
//  XCSharePlatformConfigure.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/7.
//

#import "XCSharePlatformConfigure.h"

@implementation XCSharePlatformConfigure

- (instancetype)initWithPlatformType:(XCSharePlatformType)platformType
{
    if (self = [super init])
    {
        _platformType = platformType;
    }
    
    return self;
}

@end
