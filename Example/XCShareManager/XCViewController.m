//
//  XCViewController.m
//  XCShareManager
//
//  Created by fanxiaocong on 11/06/2017.
//  Copyright (c) 2017 fanxiaocong. All rights reserved.
//

#import "XCViewController.h"

#import <XCShareManager/XCShareManager.h>


@interface XCViewController ()

@end


@implementation XCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    id<XCShareFactoryProtocol> shareFactory = [XCShareManager shareManager].shareFactory;
    id<XCShareProtocol> share = shareFactory.share;

    [share sahreWithTitle:@"" thumbImage:nil description:@"" URLString:@""];
}


@end
