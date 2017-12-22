//
//  XCShareProtocol.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//


/*
 *  备注：具体分享协议 🐾
 */

#import <UIKit/UIKit.h>
#import "XCSharePlatformConfigure.h"


@protocol XCShareProtocol <NSObject>

@required
/**
 *  分享：标题 + URL
 */
- (void)shareWithTitle:(NSString *)title URL:(NSString *)URL;

/**
 *  分享：标题 + 文本 + URL
 */
- (void)shareWithTitle:(NSString *)title
                  desc:(NSString *)desc
                   URL:(NSString *)URL;



/**
 *  分享：文本 + URL + 回调
 *
 *  @param URL          链接地址
 *  @param desc         文本
 *  @param URL          URL地址
 *  @param complete     完成的回调
 */
- (void)shareWithTitle:(NSString *)title
                  desc:(NSString *)desc
                   URL:(NSString *)URL
              complete:(void(^)(XCSharePlatformType platformType, BOOL isSuccess))complete;

@end
