//
//  JDNetAPIManager.m
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "JDNetAPIManager.h"

@implementation JDNetAPIManager

static JDNetAPIManager *_manager = nil;

+ (instancetype)manager
{
    @synchronized(self) {
        if (_manager == nil) {
            
            NSString *baseUrl = nil;
            _manager = [[JDNetAPIManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
            _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
            _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        }
    }
    return _manager;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(JDNetRequestModel *)requestModel
                responseModel:(JDNetResponseModel *)responseModel
                      success:(void (^)(NSURLSessionDataTask *, JDNetResponseModel *))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSDictionary *requestDic =  [requestModel  yy_modelToJSONObject];
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:[requestModel toParameters]];
    
    return [self GET:URLString parameters:requestDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [self _handleSuccessResponse:task responseObject:responseObject responseModel:responseModel success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [self _handleFailureResponse:task error:error failure:failure];
    }];

}


@end
