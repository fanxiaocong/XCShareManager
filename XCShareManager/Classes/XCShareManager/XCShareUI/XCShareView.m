//
//  XCShareView.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//


/*
 *  备注：分享视图 🐾
 */

#import "XCShareView.h"

#import "XCShareUtil.h"


@interface XCShareView ()

@property (strong, nonatomic) NSArray<XCShareItemModel *> *itemMs;

@end


@implementation XCShareView

#pragma mark - ✏️ 🖼 SetupUI Method 🖼

// 设置 分享按钮
- (void)setItemMs:(NSArray<XCShareItemModel *> *)itemMs
{
    _itemMs = itemMs;
    
    /// 移除相应子视图
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    /// 添加子视图
    __weak typeof(self)weakSelf = self;
    [_itemMs enumerateObjectsUsingBlock:^(XCShareItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        XCShareItem *item = [XCShareItem itemWithItemM:obj];
        
        [item addTarget:weakSelf action:@selector(didClickShareItemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [weakSelf addSubview:item];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.itemMs.count;
    
    CGFloat itemW = self.bounds.size.width / K_SHARE_ITEM_COLUMN - K_SHARE_ITEM_MARGIN_X;
    CGFloat itemH = itemW * 1.5;
    
    for (NSInteger index = 0; index<count; index++)
    {
        XCShareItem *item = self.subviews[index];
        
        CGFloat itemX = (index % K_SHARE_ITEM_COLUMN) * (itemW + K_SHARE_ITEM_MARGIN_X) + K_SHARE_ITEM_MARGIN_X * 0.5;
        CGFloat itemY = (index / K_SHARE_ITEM_COLUMN) * (itemH + K_SHARE_ITEM_MARGIN_Y) + K_SHARE_ITEM_MARGIN_Y * 0.5;
        
        item.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
}

#pragma mark - 🎬 👀 Action Method 👀

- (void)didClickShareItemAction:(XCShareItem *)item
{
    if (item.itemM.didClickHandle)
    {
        item.itemM.didClickHandle();
    }
}

#pragma mark - 🔓 👀 Public Method 👀

/**
 *  获取 分享内容视图的高度
 */
+ (CGFloat)fetchShareContentHeightWithItemsCount:(NSInteger)count
{
    NSInteger rows = (count + K_SHARE_ITEM_COLUMN - 1) / K_SHARE_ITEM_COLUMN;
    
    CGFloat itemW = K_SCREEN_WIDTH / K_SHARE_ITEM_COLUMN - K_SHARE_ITEM_MARGIN_X;
    CGFloat itemH = itemW * 1.5;
    
    return  rows * (itemH + K_SHARE_ITEM_MARGIN_Y);
}


/**
 *  创建分享视图
 */
- (instancetype)initWithFrame:(CGRect)frame itemMs:(NSArray<XCShareItemModel *> *)itemMs
{
    XCShareView *shareView = [[XCShareView alloc] initWithFrame:frame];
    
    shareView.itemMs = itemMs;
    
    return shareView;
}



@end
