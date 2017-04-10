//
//  ViewController.m
//  GXShareDemo
//
//  Created by yingcan on 17/1/4.
//  Copyright © 2017年 Guoxuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    // 保存网络状态
    
    for (id child in subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏码
            int networkType = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            
            NSLog(@"networkType == %zd",networkType);
            switch (networkType) {
                case 0: //无网

                    break;
                case 1: //2G
                    
                    break;
                case 2: //3G
                    
                    break;
                case 3: //4G
                    
                    break;
                case 5: //wifi
                
                    break;
                default:
                    break;
            }
        }
    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
