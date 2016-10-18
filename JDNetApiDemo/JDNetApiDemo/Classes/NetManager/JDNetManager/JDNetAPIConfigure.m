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
    NSInteger _proxyPort;
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

- (void)setProxy:(NSString *)proxyIP port:(NSInteger )port
        userName:(NSString *)userName password:(NSString *)password
{
    _proxyIP        = proxyIP;
    _proxyPort      = port;
    _proxyUser      = userName;
    _proxyPassword  = password;
    [self _resetJDNetAPIManager];
}

- (NSURLSessionConfiguration *) proxyConfiguration
{
    
    NSString* proxyHost = _proxyIP;
    NSNumber* proxyPort = @(_proxyPort);
    
    if (proxyHost || proxyPort) {
        return nil;
    }
    // Create an NSURLSessionConfiguration that uses the proxy
    NSDictionary *proxyDict = @{
                                @"HTTPEnable"  : [NSNumber numberWithInt:1],
                                (NSString *)kCFStreamPropertyHTTPProxyHost  : proxyHost,
                                (NSString *)kCFStreamPropertyHTTPProxyPort  : proxyPort,
                                
                                @"HTTPSEnable" : [NSNumber numberWithInt:1],
                                (NSString *)kCFStreamPropertyHTTPSProxyHost : proxyHost,
                                (NSString *)kCFStreamPropertyHTTPSProxyPort : proxyPort,
                                };
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    configuration.connectionProxyDictionary = proxyDict;
    return configuration;
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
