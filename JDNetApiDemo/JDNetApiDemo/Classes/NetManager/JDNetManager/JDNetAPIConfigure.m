//
//  JDNetAPIConfigure.m
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "JDNetAPIConfigure.h"

@implementation JDNetAPIConfigure

static JDNetAPIConfigure *_shareConfig = nil;



+ (instancetype) shareInstance
{
    @synchronized(self) {
        if (_shareConfig == nil) {
            _shareConfig = [[JDNetAPIConfigure alloc] init];
        }
    }
    return _shareConfig;
}


@end
