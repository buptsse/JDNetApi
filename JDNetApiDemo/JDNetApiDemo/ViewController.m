//
//  ViewController.m
//  JDNetApiDemo
//
//  Created by ChenJiedan on 10/17/16.
//  Copyright © 2016 Bupt. All rights reserved.
//

#import "ViewController.h"

#import <JDNetApiSDK/JDNetApiSDK.h>


//#import "JDNetAPIManager.h"
//#import "JDNetAPIConfigure.h"
#import "BKCardModel.h"
#import "BKCardResponseModel.h"


//#import "AFHTTPSessionManager.h"



//#import "GYHttpMock.h"

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
    
//    mockRequest(@"Get", @"http://baike.baidu.com/api/openapi/BaikeLemmaCardApi?appid=379020&bk_key=银魂&bk_length=600&format=json&scope=103");
//    mockRequest(@"GET", @"(.*?)baike.baidu.com(.*?)".regex).andReturn(200).
//    withBody(@"{\"key\":\"value\"}");
    
    
    [[JDNetAPIManager sharedInstance] GET:@"/api/openapi/BaikeLemmaCardApi" requestModel:model responseModel:[BKCardResponseModel new] success:^(NSURLSessionDataTask *task, JDNetResponseModel *responseModel) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail");
    }];
    
}
- (IBAction)addProxyClick:(id)sender {
    NSLog(@"-----addProxyClick----");
    
    [[JDNetAPIConfigure shareInstance] setProxy:@"" port:8080 userName:@"" password:@""];

    
}

- (IBAction)GetWBReqClick:(id)sender {
    
    
    NSLog(@"-----GetWBReqClick----");
//    AFHTTPSessionManager *F = [AFHTTPSessionManager manager];
//    
//    [F initWithBaseURL:nil];
    NSLog(@"");
    
    [[JDNetAPIManager sharedInstance] GET:@"https://sit-open.webank.com/f/api/acq/wepay/ssoLogin?app_id=W0000008&bizSeqNo=1610170K101054R01000000000000511&nonce=09650212221358023205967266386333&sign=463973B6A73BD0F6B825D3036E94B2AC3E216DC8&userId=1000015&version=1.0.0" requestModel:nil responseModel:nil success:^(NSURLSessionDataTask *task, JDNetResponseModel *responseModel) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"fail");
    }];
}

@end
