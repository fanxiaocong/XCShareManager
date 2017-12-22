//
//  XCShareItem.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import "XCShareItem.h"

#import "XCShareUtil.h"


@implementation XCShareItem

+ (instancetype)itemWithItemM:(XCShareItemModel *)itemM
{
    XCShareItem *item = [XCShareItem buttonWithType:UIButtonTypeCustom];
    
    item.itemM = itemM;
    
    return item;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.imageView.contentMode    = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font          = [UIFont systemFontOfSize:SHARE_ITEM_FONT_SIZE];
        
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = titleW + SHARE_ITEM_IMAGE_TITLE_MARGIN;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = CGRectGetWidth(contentRect);
    CGFloat imageH = imageW;
    
    return CGRectMake(0, 0, imageW, imageH);
}

- (void)setItemM:(XCShareItemModel *)itemM
{
    _itemM = itemM;
    
    [self setTitle:itemM.title forState:UIControlStateNormal];
    [self setImage:[self imageNamed:itemM.imgName] forState:UIControlStateNormal];
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  通过 Bundle 所在的目录加载图片
 */
- (UIImage *)imageNamed:(NSString *)imageName
{
    NSInteger scale = [UIScreen mainScreen].scale;
    
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSString *bundleName = @"XCShareManager.bundle";
    NSString *imagePath  = [currentBundle pathForResource: [NSString stringWithFormat:@"%@@%zdx", imageName, scale] ofType:@"png" inDirectory:bundleName];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}


@end
