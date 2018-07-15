//
//  MobShare.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import "MobShare.h"

#import <ShareSDK/ShareSDK.h>


#define kShareSuccessTag    888



@interface MobShare ()<UIAlertViewDelegate>
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


@implementation MobShare
{
    XCSharePlatformType _platformType;  /// 分享成功的平台
}

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
    
    _platformType = platformType;

    SSDKPlatformType type;
    
    switch (platformType)
    {
        case XCSharePlatformTypeQQ:
        {
            type = SSDKPlatformSubTypeQQFriend;
            break;
        }
        case XCSharePlatformTypeQQZone:
        {
            type = SSDKPlatformSubTypeQZone;
            break;
        }
        case XCSharePlatformTypeWechat:
        {
            type = SSDKPlatformSubTypeWechatSession;
            break;
        }
        case XCSharePlatformTypeWechatTimeLine:
        {
            type = SSDKPlatformSubTypeWechatTimeline;
            break;
        }
        case XCSharePlatformTypeSina:
        {
            type = SSDKPlatformTypeSinaWeibo;
            break;
        }
    }
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:self.desc
                                     images:@[]
                                        url:[NSURL URLWithString:self.URLString]
                                      title:self.title
                                       type:SSDKContentTypeAuto];
    
    __weak typeof(self) weakSelf = self;
    
    [ShareSDK share:type //传入分享的平台类型
         parameters:shareParams
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) { // 回调处理....
         
         switch (state) {
             case SSDKResponseStateBegin:
             {
                 break;
             }
             case SSDKResponseStateSuccess:
             {
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                     message:nil
                                                                    delegate:weakSelf
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil];
                 alertView.tag = kShareSuccessTag;
                 [alertView show];
                 break;
             }
             case SSDKResponseStateFail:
             {
                 if (type == SSDKPlatformTypeSMS && [error code] == 201)
                 {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                     message:@"失败原因可能是：1、短信应用没有设置帐号；2、设备不支持短信应用；3、短信应用在iOS 7以上才能发送带附件的短信。"
                                                                    delegate:weakSelf
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil, nil];
                     [alert show];
                     break;
                 }
                 else if(type == SSDKPlatformTypeMail && [error code] == 201)
                 {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                     message:@"失败原因可能是：1、邮件应用没有设置帐号；2、设备不支持邮件应用；"
                                                                    delegate:weakSelf
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil, nil];
                     [alert show];
                     break;
                 }
                 else
                 {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                    delegate:weakSelf
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil, nil];
                     [alert show];
                     break;
                 }
                 break;
             }
             case SSDKResponseStateCancel:
             {
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享已取消"
                                                                     message:nil
                                                                    delegate:weakSelf
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil];
                 [alertView show];
                 break;
             }
                 
             default:
                 break;
         }
     }];
}

#pragma mark - 💉 👀 UIAlertViewDelegate 👀

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    BOOL isSuccess = NO;
    
    /// 分享失败
    if (alertView.tag != kShareSuccessTag) {
        isSuccess = NO;
    } else {
        isSuccess = YES;
    }
    
    if (self.complete) {
        self.complete(_platformType, isSuccess);
    }
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
