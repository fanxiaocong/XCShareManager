//
//  XCShareItem.h
//  Pods-XCShareManager_Example
//
//  Created by 樊小聪 on 2017/11/6.
//

#import <UIKit/UIKit.h>

#import "XCShareItemModel.h"

@interface XCShareItem : UIButton

@property (strong, nonatomic, readonly) XCShareItemModel *itemM;


+ (instancetype)itemWithItemM:(XCShareItemModel *)itemM;

@end
