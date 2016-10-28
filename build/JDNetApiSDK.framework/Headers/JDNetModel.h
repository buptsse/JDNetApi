//
//  JDNetModel.h
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "YYModel.h"

@interface JDNetRequestModel : NSObject

/**
 *	@brief	将dic中的键值对通过setValue:forKey:的方式来初始化数据模型的property
 *
 *	@param 	dic 	初始化键值对. 注意，如果dic是来自NSJSONSerialization反序列化的，那么nil的对象会转成NSNull！
 *
 */
//- (void)fillWithPatameters:(NSDictionary *)dic;


/**
 将数据模式的所有property转为键值对

 @return 返回键值对
 */
//- (NSDictionary *)toParameters;

@end



@interface JDNetResponseModel : NSObject

@end
