//
//  XCSharePlatformConfigure.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/7.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, XCSharePlatformType)
{
    XCSharePlatformTypeQQ = 0,          /// QQ 好友
    
    XCSharePlatformTypeQQZone,          /// QQ 空间
    
    XCSharePlatformTypeWechat,          /// 微信 好友
    
    XCSharePlatformTypeWechatTimeLine,   /// 微信 朋友圈
    
    XCSharePlatformTypeSina             /// 新浪
};



@interface XCSharePlatformConfigure : NSObject

/** 👀 分享平台 👀 */
@property (assign, nonatomic, readonly) XCSharePlatformType platformType;

/** 👀 AppID 👀 */
@property (copy, nonatomic) NSString *appId;
/** 👀 AppSecret 👀 */
@property (copy, nonatomic) NSString *appSecret;
/** 👀 回调地址 👀 */
@property (copy, nonatomic) NSString *appRedirectURL;


- (instancetype)initWithPlatformType:(XCSharePlatformType)platformType;

@end
