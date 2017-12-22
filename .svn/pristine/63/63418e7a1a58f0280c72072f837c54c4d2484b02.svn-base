//
//  XCShareItemModel.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import <Foundation/Foundation.h>

@interface XCShareItemModel : NSObject

/** 👀 标题 👀 */
@property (copy, nonatomic) NSString *title;
/** 👀 图片名称 👀 */
@property (copy, nonatomic) NSString *imgName;
/** 👀 点击的回调 👀 */
@property (copy, nonatomic) void(^didClickHandle)(void);


/**
 *  创建一个 itemM
 *
 *  @param title            标题
 *  @param imgName          图片
 *  @param didClickHandle   点击的回调
 */
+ (instancetype)itemModelWithTitle:(NSString *)title
                           imgName:(NSString *)imgName
                    didClickHandle:(void(^)(void))didClickHandle;

@end
