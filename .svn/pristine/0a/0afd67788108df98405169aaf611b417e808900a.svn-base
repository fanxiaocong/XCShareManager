//
//  XCShareUI.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/8.
//


/*
 *  备注：分享UI 🐾
 */

#import "XCShareUI.h"


@interface XCShareUI ()

@property (weak, nonatomic) UIView *mask;
@property (weak, nonatomic) UIView *shareView;

@end


@implementation XCShareUI


/**
 *  设置分享 UI
 *
 *  @param configures           分享配置
 *  @param didClickItemHandle   点击分享Item的回调
 */
- (void)setupShareUIWithConfigures:(NSArray<XCSharePlatformConfigure *> *)configures
                 didClickItemHandle:(void(^)(XCSharePlatformType platformType))didClickItemHandle
{
    CGFloat cancelBtnMargin = 15;
    CGFloat cancelBtnH      = 50;
    CGFloat shareLabelH     = 15;
    CGFloat shareViewH      = [XCShareView fetchShareContentHeightWithItemsCount:configures.count];
    
    // 设置 最底部蒙板
    UIView *mask = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.mask = mask;
    
    [[UIApplication sharedApplication].keyWindow addSubview:mask];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:mask];
    
    // 设置 分享视图
    CGFloat shareBottomViewH = cancelBtnH + cancelBtnMargin * 3 + shareViewH + shareLabelH + 10;
    UIView *shareBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, K_SCREEN_HEIGHT, K_SCREEN_WIDTH, shareBottomViewH)];
    self.shareView = shareBottomView;
    [mask addSubview:shareBottomView];
    
    // 设置 顶部遮罩
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_HEIGHT-shareBottomViewH)];
    [topView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)]];
    [mask addSubview:topView];
    
    CGFloat cancelBtnW      = K_SCREEN_WIDTH;
    CGFloat cancelBtnX      = 0;
    CGFloat cancelBtnY      = shareBottomViewH - cancelBtnH;
    
    // 设置底部的 取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame               = CGRectMake(cancelBtnX, cancelBtnY, cancelBtnW, cancelBtnH);
    cancelBtn.backgroundColor     = [UIColor whiteColor];
    cancelBtn.tintColor           = [UIColor grayColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [cancelBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [shareBottomView addSubview:cancelBtn];
    
    CGFloat seperatorW = K_SCREEN_WIDTH;
    CGFloat seperatorH = 10;
    CGFloat seperatorX = 0;
    CGFloat seperatorY = shareBottomViewH - cancelBtnH - seperatorH;

    // 底部分隔视图
    UIView * middleView= [[UIView alloc]initWithFrame:CGRectMake(seperatorX, seperatorY, seperatorW, seperatorH)];
    middleView.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    [shareBottomView addSubview:middleView];
    
    // 设置 中间的分享按钮视图
    CGFloat shareViewW = K_SCREEN_WIDTH;
    CGFloat shareViewX = 0;
    CGFloat shareViewY = shareLabelH + 2 * cancelBtnMargin;
    
    NSMutableArray *items = [NSMutableArray array];
    
    for (XCSharePlatformConfigure *configure in configures)
    {
        NSString *title;
        NSString *imgName;
        
        XCSharePlatformType platformType = configure.platformType;

        switch (platformType)
        {
            case XCSharePlatformTypeQQ:
            {
                title   = @"QQ好友";
                imgName = @"icon_share_qq";
                break;
            }
            case XCSharePlatformTypeQQZone:
            {
                title   = @"QQ空间";
                imgName = @"icon_share_qq_zone";
                break;
            }
            case XCSharePlatformTypeWechat:
            {
                title   = @"微信好友";
                imgName = @"icon_share_weixin";
                break;
            }
            case XCSharePlatformTypeWechatTimeLine:
            {
                title   = @"朋友圈";
                imgName = @"icon_share_weixin_zone";
                break;
            }
            case XCSharePlatformTypeSina:
            {
                title   = @"新浪微博";
                imgName = @"icon_share_weibo";
                break;
            }
        }
        
        XCShareItemModel *model = [XCShareItemModel itemModelWithTitle:title imgName:imgName didClickHandle:^{
            
            // 点击 item 的回调
            if (didClickItemHandle)
            {
                didClickItemHandle(platformType);
            }
        }];
        
        [items addObject:model];
    }
    
    XCShareView *shareView = [[XCShareView alloc] initWithFrame:CGRectMake(shareViewX, shareViewY, shareViewW, shareViewH) itemMs:items];

    shareBottomView.backgroundColor = [UIColor whiteColor];
    [shareBottomView addSubview:shareView];
    
    // 设置 分享的 label
    CGFloat shareLabelW = K_SCREEN_WIDTH;
    CGFloat shareLabelX = 0;
    CGFloat shareLabelY = cancelBtnMargin;
    
    UILabel * shareLeLabel     = [[UILabel alloc] initWithFrame:CGRectMake(shareLabelX, shareLabelY, shareLabelW, shareLabelH)];
    shareLeLabel.text          = NSLocalizedString(@"分享到", nil);
    shareLeLabel.textColor     = [UIColor grayColor];
    shareLeLabel.textAlignment = NSTextAlignmentCenter;
    [shareBottomView addSubview:shareLeLabel];
}

#pragma mark - 🎬 👀 Action Method 👀

/**
 *  显示
 */
- (void)show
{
    self.mask.hidden      = NO;
    self.shareView.hidden = NO;
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9f initialSpringVelocity:0.7f
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         
                         self.mask.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
                         self.shareView.frame = CGRectMake(0, K_SCREEN_HEIGHT - self.shareView.bounds.size.height, K_SCREEN_WIDTH, self.shareView.bounds.size.height);
                         
                     } completion:nil];
}

/**
 *  隐藏
 */
- (void)hide
{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9f initialSpringVelocity:0.7f
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         
                         self.mask.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
                         self.shareView.frame = CGRectMake(0, K_SCREEN_HEIGHT, K_SCREEN_WIDTH, self.shareView.bounds.size.height);
                         
                     } completion:^(BOOL finished) {
                        
                         self.mask.hidden = YES;
                     }];
}

@end
