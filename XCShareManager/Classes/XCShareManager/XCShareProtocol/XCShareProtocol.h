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
 *  分享（标题+缩略图片+描述+链接地址）
 *
 *  @param title 标题
 *  @param thumbImage 缩略图片(类型可以是 NSURL、UIImage、NSData)
 *  @param desc 描述
 *  @param URLString 分享链接地址
 */
- (void)sahreWithTitle:(NSString *)title
            thumbImage:(id)thumbImage
           description:(NSString *)desc
             URLString:(NSString *)URLString;

/**
 *  分享（标题+缩略图片+描述+链接地址+完成的回调）
 *
 *  @param title 标题
 *  @param thumbImage 缩略图片(类型可以是 NSURL、UIImage、NSData)
 *  @param desc 描述
 *  @param URLString 分享链接地址
 *  @param complete 完成的回调
 */
- (void)shareWithTitle:(NSString *)title
            thumbImage:(id)thumbImage
           description:(NSString *)desc
             URLString:(NSString *)URLString
              complete:(void(^)(XCSharePlatformType platformType, BOOL isSuccess))complete;
@end
