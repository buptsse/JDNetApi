//
//  JDNetAPIConfigure.m
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "JDNetAPIConfigure.h"
#import "JDNetAPIManager.h"

@implementation JDNetAPIConfigure{
    NSString *_proxyIP;
    NSString *_proxyUser;
    NSString *_proxyPassword;
}

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


- (instancetype) init
{
    self = [super init];
    if (self) {
        _baseUrl = @"http://baike.baidu.com"; //默认的baseUrl
    }
    return self;
}

- (void) setBaseUrl:(NSString *)baseUrl
{
    _baseUrl = baseUrl;
    [self _resetJDNetAPIManager];
}

- (void) setProxy:(NSString *)proxyIP userName:(NSString *)userName password:(NSString *)password
{
    _proxyIP        = proxyIP;
    _proxyUser      = userName;
    _proxyPassword  = password;
    [self _resetJDNetAPIManager];
}



/**
 设置新的Manager单例
 */
- (void) _resetJDNetAPIManager
{
    NSURL *url = [NSURL URLWithString:self.baseUrl];
  
    JDNetAPIManager *manager = [[JDNetAPIManager alloc] initWithBaseURL:url sessionConfiguration:nil];
    [JDNetAPIManager setManager:manager];
}



@end
