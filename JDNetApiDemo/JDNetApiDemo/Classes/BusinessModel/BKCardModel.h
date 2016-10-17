//
//  BKCardModel.h
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDNetModel.h"


//scope=103&format=json&appid=379020&bk_key=银魂&bk_length=600
@interface BKCardModel : JDNetRequestModel
@property (nonatomic, strong) NSString *scope;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSString *appid;
@property (nonatomic, strong) NSString *bk_key;
@property (nonatomic, strong) NSString *bk_length;

@property (nonatomic, strong) NSString *bk_length111;

@end
