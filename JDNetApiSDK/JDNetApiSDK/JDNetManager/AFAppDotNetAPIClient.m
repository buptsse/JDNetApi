// AFAppDotNetAPIClient.h
//
// Copyright (c) 2011–2016 Alamofire Software Foundation ( http://alamofire.org/ )
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFAppDotNetAPIClient.h"

static NSString * const AFAppDotNetAPIBaseURLString = @"https://api.app.net/";


static AFAppDotNetAPIClient *_manager = nil;



@implementation AFAppDotNetAPIClient


+ (instancetype)manager
{
    @synchronized(self) {
        if (_manager == nil) {
//            NSString *baseUrl = [WBConfigManager baseUrl];
            NSString *baseUrl = AFAppDotNetAPIBaseURLString;

            _manager = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
//            _manager.requestSerializer = [WBAFJSONRequestSerializer serializer];
//            _manager.autoResetCookies = YES;
//            _manager.requestSerializer.timeoutInterval = 60;
            _manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
            _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//            _manager.securityPolicy.validatesCertificateChain = NO;
        }
    }
    
    return _manager;
}



//+ (instancetype)sharedClient {
//    static AFAppDotNetAPIClient *_sharedClient = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
//        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
//    });
//    
//    return _sharedClient;
//}


- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(WBApiModel *)requestModel
                responseModel:(WBApiResponseModel *)responseModel
                      success:(void (^)(NSURLSessionDataTask *task, WBApiResponseModel * responseModel))success
                      failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure
{
//    [self _autoResetCookies];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:[requestModel toParameters]];
    
    //如果请求包体里面有bizSeqNo则用包体里面的，否则用ApiRequestManger的
//    NSString *requestBizSeqNo = [parameters objectForKey:@"bizSeqNo"];
//    if (nil == requestBizSeqNo || [requestBizSeqNo length] == 0) {
//        if (self.bizSeqNo.length > 0 && parameters != nil) {
//            [parameters setValue:self.bizSeqNo forKey:@"bizSeqNo"];
//        }
//    }
    return [self GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self _handleSuccessResponse:task responseObject:responseObject responseModel:responseModel success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self _handleFailureResponse:task error:error failure:failure];
    }];
    
}


- (void)_handleSuccessResponse:(NSURLSessionDataTask *)task
                responseObject:(id)responseObject
                 responseModel:(WBApiResponseModel *)responseModel
                       success:(void (^)(NSURLSessionDataTask *task, WBApiResponseModel *responseModel))success
                       failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure
{
//    if (operation.isCancelled) {
//        NSLog(@"operation[%@] is canceled", operation);
//        return;
//    }
    NSLog(@"responseObj: [%@]", responseObject);
    if (responseModel) {
        [responseModel fillWithPatameters:responseObject];
    }
    
//    if (responseModel.bizSeqNo.length > 0) {
//        self.bizSeqNo = responseModel.bizSeqNo;
//    }
    
    if (responseModel.formatType == WBApiFormat_OpenApi) {
        if ([responseModel.code isEqualToString:@"0"]) {
            //请求真的成功了
            
            NSLog(@"[%@] request successed!", [task.originalRequest.URL absoluteString]);
            if (success) {
                success(task, responseModel);
            }
        }else{
            NSLog(@"[%@] request result failed!", [task.originalRequest.URL absoluteString]);
            if (failure) {
                NSString *errMsg = nil;
                NSString *retCode = nil;
                NSInteger errorCode = WBApiErrorCode_RespFailed;
                
                errMsg = responseModel.msg;
                retCode= responseModel.code;
                
                if (nil == errMsg || nil == retCode) {
                    retCode = @"AppErrorCode";
                    errMsg = @"errMsg或者errorCode传nil";
                }
                WBError *error = [WBError errorWithErrorString:retCode code:errorCode userInfo:@{NSLocalizedDescriptionKey: errMsg}];
                error.errList = responseModel.retList;
                failure(task, error);
            }
        }
    }else{
        //默认是天鹅的数据格式
        
        //请求成功 responseModel 是请求 body 的内容
        if ([responseModel.status isEqualToString:@"SUCCESS"]) {
            //请求真的成功了
            NSLog(@"[%@] request successed!", [task.originalRequest.URL absoluteString]);
            if (success) {
                success(task, responseModel);
            }
        } else {
            NSLog(@"[%@] request result failed!", [task.originalRequest.URL absoluteString]);
            if (failure) {
                NSString *errMsg = nil;
                NSString *retCode = nil;
                NSInteger errorCode = WBApiErrorCode_RespFailed;
                
                if (responseModel.retList != nil && responseModel.retList.count != 0) {
                    errMsg = [NSString stringWithFormat:@"%@", [[responseModel.retList firstObject] objectForKey:@"retMessage"]];
                    retCode = [NSString stringWithFormat:@"%@",[[responseModel.retList firstObject] objectForKey:@"retCode"]];
                }
                
                if (nil == errMsg || nil == retCode) {
                    retCode = @"AppErrorCode";
                    errMsg = @"errMsg或者errorCode传nil";
                }
                WBError *error = [WBError errorWithErrorString:retCode code:errorCode userInfo:@{NSLocalizedDescriptionKey: errMsg}];
                error.errList = responseModel.retList;
                failure(task, error);
            }
        }
        
    }
}

- (void)_handleFailureResponse:(NSURLSessionDataTask *)task
                         error:(NSError *)error
                       failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure
{
//    if (operation.isCancelled) {
//        NSLog(@"operation[%@] is canceled", operation);
//        return;
//    }
    NSLog(@"[%@] request operation failed!", [task.originalRequest.URL absoluteString]);
//    NSLog(@"%@",task.response.responseString);
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)task.response;
    NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);


    NSLog(@"%@",[error description]);
    if (failure) {
        
        WBError *theError = nil;
//        if (httpResponse.statusCode == 401) { // 出错401 情况
        
            NSDictionary *dict = httpResponse.allHeaderFields;
            NSString *authStatus = [[dict objectForKey:@"authStatus"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSString *authMsg = [[dict objectForKey:@"authMsg"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSInteger errCode = WBApiErrorCode_Unknown;//默认值是系统401的值
            
            
            if (nil == authStatus || nil == authMsg) {
                theError = [WBError errorWithError:error];//如果后台返回为空的情况直接返回401 相关的错误码和错误信息
            }else {
                theError = [WBError errorWithErrorString:authStatus code:errCode userInfo:@{NSLocalizedDescriptionKey:authMsg}];
            }
            
//        } else { //出错,非401 情况
//            theError = [WBError errorWithError:error];
//        }
        failure(task, theError);
    }
}



@end
