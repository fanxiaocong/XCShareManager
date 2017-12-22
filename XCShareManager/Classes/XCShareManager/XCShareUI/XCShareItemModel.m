//
//  XCShareItemModel.m
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import "XCShareItemModel.h"

@implementation XCShareItemModel

/**
 *  创建一个 itemM
 *
 *  @param title            标题
 *  @param imgName          图片
 *  @param didClickHandle   点击的回调
 */
+ (instancetype)itemModelWithTitle:(NSString *)title
                           imgName:(NSString *)imgName
                    didClickHandle:(void(^)(void))didClickHandle
{
    XCShareItemModel *model = [[XCShareItemModel alloc] init];
    
    model.title = title;
    model.imgName = imgName;
    model.didClickHandle = didClickHandle;
    
    return model;
}

@end
