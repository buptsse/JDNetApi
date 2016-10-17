//
//  JDNetAPIManager.h
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "JDNetModel.h"


@interface JDNetAPIManager : AFHTTPSessionManager



/**
 Get请求获取数据

 @param URLString     请求地址
 @param requestModel  请求的数据模型
 @param responseModel 返回的数据模型
 @param success       成功回调
 @param failure       失败回调

 @return 返回对应的Task
 */
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                 requestModel:(JDNetRequestModel *)requestModel
                responseModel:(JDNetResponseModel *)responseModel
                      success:(void (^)(NSURLSessionDataTask *task, JDNetResponseModel * responseModel))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;



@end
