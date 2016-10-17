//
//  ViewController.m
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "ViewController.h"

#import "JDNetAPIManager.h"
#import "BKCardModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GetReqClick:(id)sender {
    
    BKCardModel *model = [[BKCardModel alloc] init];
    model.scope = @"103";
    model.format = @"json";
    model.appid = @"379020";
    model.bk_key  =@"银魂";
    model.bk_length = @"600";
    
    
    [[JDNetAPIManager manager] GET:@"/api/openapi/BaikeLemmaCardApi" requestModel:model responseModel:nil success:^(NSURLSessionDataTask *task, JDNetResponseModel *responseModel) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail");
    }];
    
}


@end
