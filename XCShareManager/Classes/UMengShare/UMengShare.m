//
//  UMengShare.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import "UMengShare.h"

#import <UMSocialCore/UMSocialCore.h>


@interface UMengShare ()
/// 分享UI
@property (strong, nonatomic) XCShareUI *shareUI;
// title
@property (copy, nonatomic) NSString *title;
// content
@property (copy, nonatomic) NSString *desc;
// URL
@property (copy, nonatomic) NSString *URLString;
// 缩略图片
@property (copy, nonatomic) NSString *thumbImage;
// 分享完成的回调
@property (copy, nonatomic) void(^complete)(XCSharePlatformType platformType, BOOL isSuccess);
@end


@implementation UMengShare

/**
 *  初始化分享UI
 */
- (instancetype)initWithShareUI:(XCShareUI *)shareUI
{
    if (self = [super init])
    {
        self.shareUI = shareUI;
    }
    
    return self;
}

#pragma mark - 🎬 👀 Action Method 👀

/**
 *  点击分享平台 Item 的回调
 *
 *  @param platformType 分享平台
 */
- (void)clickItemAction:(XCSharePlatformType)platformType
{
    [self.shareUI hide];
    
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    [UMSocialGlobal shareInstance].isTruncateShareText = NO;
    
    NSString *content = self.desc;
    
    //   -----  如果是新浪  ------
    if (platformType == XCSharePlatformTypeSina)
    {
        content = [NSString stringWithFormat:@"%@%@", self.desc, self.URLString];
    }
    else
    {
        if (self.desc.length > 26)
        {
            content = [self.desc substringToIndex:NSMaxRange([self.desc rangeOfComposedCharacterSequenceAtIndex:25])];
        }
    }
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.title descr:content thumImage:self.thumbImage];
    //设置网页地址
    shareObject.webpageUrl = self.URLString;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    messageObject.text = content;
    
    UMSocialPlatformType umengSharePlatformType;
    
    switch (platformType)
    {
        case XCSharePlatformTypeQQ:
        {
            umengSharePlatformType = UMSocialPlatformType_QQ;
            break;
        }
        case XCSharePlatformTypeQQZone:
        {
            umengSharePlatformType = UMSocialPlatformType_Qzone;
            break;
        }
        case XCSharePlatformTypeWechat:
        {
            umengSharePlatformType = UMSocialPlatformType_WechatSession;
            break;
        }
        case XCSharePlatformTypeWechatTimeLine:
        {
            umengSharePlatformType = UMSocialPlatformType_WechatTimeLine;
            break;
        }
        case XCSharePlatformTypeSina:
        {
            umengSharePlatformType = UMSocialPlatformType_Sina;
            break;
        }
    }
    
    __weak typeof (self)weakSelf = self;
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:umengSharePlatformType messageObject:messageObject currentViewController:[UIApplication sharedApplication].keyWindow.rootViewController completion:^(id data, NSError *error) {
        
        if (error)
        {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }
        else
        {
            if ([data isKindOfClass:[UMSocialShareResponse class]])
            {
                UMSocialShareResponse *resp = data;
                
                NSLog(@"分享完成返回的参数：%@", resp.uid);
                
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }
            else
            {
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        
        /// 分享完成的回调
        if (weakSelf.complete)
        {
            weakSelf.complete(platformType, !error);
        }
    }];
}

#pragma mark - 👀 XCShareProtocol 👀 💤

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
             URLString:(NSString *)URLString
{
    [self shareWithTitle:title thumbImage:thumbImage description:desc URLString:URLString complete:nil];
}

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
              complete:(void(^)(XCSharePlatformType platformType, BOOL isSuccess))complete
{
    self.title = title ?: [NSBundle mainBundle].infoDictionary[@"CFBundleDisplayName"];
    self.desc  = desc;
    self.thumbImage = thumbImage;
    self.URLString  = URLString;
    self.complete   = complete;
    
    [self.shareUI show];
}


@end
