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

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "WBApiModel.h"
#import "WBApiResponseModel.h"
#import "WBError.h"

//网络内部使用
typedef NS_ENUM(NSInteger, WBLoginBackGroundErrorCode){
    WBApiErrorCode_RespFailed = -200, // Http请求返回20x，但是status是FAIL，错误在errList列表中
};



//天鹅使用
typedef NS_ENUM(NSInteger, WBLocalErrorCode){
    WBLocalErrorCode_Unknown = -100,
    WBLocalErrorCode_IllegalResource = -102, // 需要的资源不正确
    WBLocalErrorCode_Unauthorized = -103, //授权失败了
};

//HJ使用 网络请求返回 401
typedef NS_ENUM(NSInteger, WBApiErrorCode)
{
    WBApiErrorCode_Unknown = -400, // 网络返回401的默认错误码
    //    WBApiErrorCode_SysError = -401,  //登录异常,请稍候重试 SysError 401
    //    WBApiErrorCode_Unlogin = -402,   //用户未登录  Unlogin  401
    //    WBApiErrorCode_KickedToken = -403,    //您的账户已在其他设备登录,请重新登录 KickedToken 401
    //    WBApiErrorCode_SessionNotFound = -404, //您未登录或长期事件未操作导致登录超时，请重新登录 SessionNotFound 401
    //    WBApiErrorCode_IpInvalid = -405, //系统检测到您的网络状态发生变化,请重新登录 IpInvalid 401
    //    WBApiErrorCode_SessionExpired = -406, //由于您长时间未操作，登录已超时,请重新登录 SessionExpired 401
    //    WBApiErrorCode_TokenInvalid = -407, //您的登录态已失效，请重新登录 TokenInvalid 401
    //    WBApiErrorCode_Unsafe = -408,// 网络不安全 UnSafe 401
};


@interface AFAppDotNetAPIClient : AFHTTPSessionManager



/**
 *	@brief  The level of logging detail. See "Logging Levels" for possible values. `AFLoggerLevelDebug` by default.
 */
//@property (nonatomic, assign) WBAFHTTPRequestLoggerLevel logLevel;
/**
 *	@brief	在每个请求中自动填入[NSHTTPCookieStorage sharedHTTPCookieStorage]中包含的cookie。
 *          如果需要自定义的cookie，那么将此变量设为NO，然后使用manager.requestSerializer中得方法添加cookie。
 */
//@property (nonatomic, assign) BOOL autoResetCookies;


/*
 *  @brief  请求需要带的bizSeqNo,用于防csrf攻击
 */
//@property (nonatomic, strong) NSString *bizSeqNo;


/**
 *	@brief	发送GET请求
 *
 *	@param 	URLString 	请求路径（相对于BaseUrl）
 *	@param 	requestModel 	请求数据
 *	@param 	responseModel 	响应数据。参数中得responseModel只是为了得到响应数据的类型，方便回调block的处理。
 *                          例如，你创建了基于WBApiResponseModel的子类WBLoginResponseModel，那么这里你只需传入
 *                          [WBLoginResponseModel new] 即可。
 *	@param 	success 	请求成功的回调block。
 *	@param 	failure 	请求失败的回调block。注意，失败的情况包括各种网络、HTTP错误，以及svr回包中status位FAIL的情况。
 *
 */
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(WBApiModel *)requestModel
                responseModel:(WBApiResponseModel *)responseModel
                      success:(void (^)(NSURLSessionDataTask *task, WBApiResponseModel * responseModel))success
                      failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
              timeoutInterval:(NSTimeInterval)timeoutInterval
                 requestModel:(WBApiModel *)requestModel
                responseModel:(WBApiResponseModel *)responseModel
                      success:(void (^)(NSURLSessionDataTask *task, WBApiResponseModel * responseModel))success
                      failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure;


/**
 *	@brief	发送POST请求
 *
 *	@param 	URLString 	请求路径（相对于BaseUrl）
 *	@param 	requestModel 	请求数据
 *	@param 	responseModel 	响应数据。参数中得responseModel只是为了得到响应数据的类型，方便回调block的处理。
 *                          例如，你创建了基于WBApiResponseModel的子类WBLoginResponseModel，那么这里你只需传入
 *                          [WBLoginResponseModel new] 即可。
 *	@param 	success 	请求成功的回调block。
 *	@param 	failure 	请求失败的回调block。注意，失败的情况包括各种网络、HTTP错误，以及svr回包中status位FAIL的情况。
 *
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                      requestModel:(WBApiModel *)requestModel
                     responseModel:(WBApiResponseModel *)responseModel
                           success:(void (^)(NSURLSessionDataTask *task, WBApiResponseModel *responseModel))success
                           failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                   timeoutInterval:(NSTimeInterval)timeoutInterval
                      requestModel:(WBApiModel *)requestModel
                     responseModel:(WBApiResponseModel *)responseModel
                           success:(void (^)(NSURLSessionDataTask *task, WBApiResponseModel *responseModel))success
                           failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure;

/**
 *	@brief	发送Multi-Form的POST请求
 *
 *	@param 	URLString 	请求路径（相对于BaseUrl）
 *	@param 	requestModel 	请求数据
 *	@param 	responseModel 	响应数据。参数中得responseModel只是为了得到响应数据的类型，方便回调block的处理。
 *                          例如，你创建了基于WBApiResponseModel的子类WBLoginResponseModel，那么这里你只需传入
 *                          [WBLoginResponseModel new] 即可。
 *	@param 	constructingBodyWithBlock 	构建Multi-Form的body的block。
 *	@param 	success 	请求成功的回调block。
 *	@param 	failure 	请求失败的回调block。注意，失败的情况包括各种网络、HTTP错误，以及svr回包中status位FAIL的情况。
 *
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                  requestModel:(WBApiModel *)requestModel
                 responseModel:(WBApiResponseModel *)responseModel
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                       success:(void (^)(NSURLSessionDataTask *task, WBApiResponseModel *responseModel))success
                       failure:(void (^)(NSURLSessionDataTask *task, WBError *error))failure;

/**
 *	@brief	取消所有的网络请求，放弃回包的响应处理。通常用于账户注销的情况。
 *
 */
- (void)cancelAllRequest;

/**
 *  设置WBApiManager的单例
 *
 *  @param manager
 */
- (void) setManager:(AFAppDotNetAPIClient *)manager;

@end
