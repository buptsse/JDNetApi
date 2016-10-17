//
//  JDNetAPIManager.m
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "JDNetAPIManager.h"
#import "JDNetAPIConfigure.h"

@implementation JDNetAPIManager

static JDNetAPIManager *_manager = nil;



+ (instancetype)manager
{
    @synchronized(self) {
        if (_manager == nil) {
            NSString *baseUrl = [[JDNetAPIConfigure shareInstance] baseUrl];
            _manager = [[JDNetAPIManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
            _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        }
    }
    return _manager;
}


#pragma mark Get & Post & Upload

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(JDNetRequestModel *)requestModel
                responseModel:(JDNetResponseModel *)responseModel
                      success:(void (^)(NSURLSessionDataTask *, JDNetResponseModel *))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSDictionary *parameters =  [requestModel  yy_modelToJSONObject];
    
    return [self GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self _handleSuccessResponse:task responseObject:responseObject responseModel:responseModel success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self _handleFailureResponse:task error:error failure:failure];
    }];

}




#pragma mark  Success & Fail Net
- (void) _handleSuccessResponse:(NSURLSessionDataTask *)task
                 responseObject:(id)responseObject
                  responseModel:(JDNetResponseModel *)responseModel
                        success:(void (^)(NSURLSessionDataTask *, JDNetResponseModel *))success
                        failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
   BOOL parseState = [responseModel yy_modelSetWithDictionary:responseObject];
    if (parseState) {
        success(task, responseModel);
    }else{
        failure(task, nil);
    }
}

- (void) _handleFailureResponse:(NSURLSessionDataTask *)task
                          error:(NSError *)error
                        failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    
}



+ (void)setManager:(JDNetAPIManager *)manager
{
    _manager = manager;
}

@end
