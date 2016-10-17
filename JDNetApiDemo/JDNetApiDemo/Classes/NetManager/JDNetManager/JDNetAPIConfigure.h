//
//  JDNetAPIConfigure.h
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDNetAPIConfigure : NSObject

@property (nonatomic, strong) NSString *baseUrl;

+ (instancetype) shareInstance;


/**
 设置对应的代理

 @param proxyIP  代理地址
 @param userName 代理用户名
 @param password 用户密码
 */
- (void) setProxy:(NSString *)proxyIP userName:(NSString *)userName password:(NSString *)password;


@end
