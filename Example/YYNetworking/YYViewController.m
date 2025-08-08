//
//  YYViewController.m
//  YYNetworking
//
//  Created by htyo on 08/08/2025.
//  Copyright (c) 2025 htyo. All rights reserved.
//

#import "YYViewController.h"
#import <YYNetworking/YYNetworking.h>

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [YYNetworking requestWithHTTPMethod:HTTPMethodGet
                              URLString:@"https:www.baidu.com"
                             parameters:nil
                                success:^(NSURLSessionDataTask * _Nonnull, id _Nullable) {
        
    } failure:^(NSURLSessionDataTask * _Nullable, NSError * _Nonnull) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
