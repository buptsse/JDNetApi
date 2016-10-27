//
//  JDNetAPIManager.m
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "JDNetAPIManager.h"
#import "JDNetAPIConfigure.h"
#import "YYModel.h"
#import "AFHTTPSessionManager.h"

@implementation JDNetAPIManager{
    AFHTTPSessionManager *_manager;
}

static JDNetAPIManager *g_sharedInstance = nil;


+ (instancetype)sharedInstance
{
    static JDNetAPIManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JDNetAPIManager alloc] init];
        // Do any other initialisation stuff here
        [sharedInstance initDefaultManager];
    });
    return sharedInstance;
}

- (void) initDefaultManager
{
    @synchronized(self) {
        if (_manager == nil) {
            NSString *baseUrl = [[JDNetAPIConfigure shareInstance] baseUrl];
            NSURLSessionConfiguration *proxyConfig = [[JDNetAPIConfigure shareInstance] proxyConfiguration];
            
            _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl] sessionConfiguration:proxyConfig];
            _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        }
    }
}


#pragma mark Get & Post & Upload

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(JDNetRequestModel *)requestModel
                responseModel:(JDNetResponseModel *)responseModel
                      success:(void (^)(NSURLSessionDataTask *, JDNetResponseModel *))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSDictionary *parameters =  [requestModel  yy_modelToJSONObject];
    
    return [_manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n\nHTTP Success URL :%@",task.originalRequest.URL);
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"标题" message:[responseObject description]   delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
        [alertview show];
        
        
        [self _handleSuccessResponse:task responseObject:responseObject responseModel:responseModel success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"\n\nHTTP FAIL URL :%@",task.originalRequest.URL);

        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"标题" message:[error description]   delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"好的", nil];
        [alertview show];
        
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
    if (responseModel == nil) {
        responseModel = [JDNetResponseModel new];
    }
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



//+ (void)setManager:(JDNetAPIManager *)manager
//{
//    _manager = manager;
//}

@end
