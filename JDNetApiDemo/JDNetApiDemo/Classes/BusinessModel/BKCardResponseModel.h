//
//  BKCardResponseModel.h
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "JDNetModel.h"

@interface BKCardResponseModel : JDNetResponseModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *subLemmaId;
@property (nonatomic, strong) NSString *lemmaId;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *logo;

@end
