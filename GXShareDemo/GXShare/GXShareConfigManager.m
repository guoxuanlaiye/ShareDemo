//
//  GXShareConfigManager.m
//  GXShareDemo
//
//  Created by yingcan on 17/1/4.
//  Copyright © 2017年 Guoxuan. All rights reserved.
//

#import "GXShareConfigManager.h"

@implementation GXShareConfigManager
+ (GXShareConfigManager *)sharedInstance
{
    static GXShareConfigManager * instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[GXShareConfigManager alloc]init];
    });
    return instance;
}
- (void)setupPlatform:(GXSharePlatformConfigType)type appKey:(NSString *)appkey appSecret:(NSString *)appSecret appRedirectUrl:(NSString *)redirectUrl
{
    switch (type) {
        case GXSharePlatformConfigType_Sina:
        {
            self.GXSharePlatformConfig_Sina_Appkey         = appkey;
            self.GXSharePlatformConfig_Sina_AppSecret      = appSecret;
            self.GXSharePlatformConfig_Sina_AppRedirectUrl = redirectUrl;
        }
            break;
        case GXSharePlatformConfigType_Wechat:
        {
            self.GXSharePlatformConfig_Wechat_Appkey         = appkey;
            self.GXSharePlatformConfig_Wechat_AppSecret      = appSecret;
            self.GXSharePlatformConfig_Wechat_AppRedirectUrl = redirectUrl;
        }
            break;
        case GXSharePlatformConfigType_Tencent:
        {
            self.GXSharePlatformConfig_Tencent_Appkey         = appkey;
            self.GXSharePlatformConfig_Tencent_AppSecret      = appSecret;
            self.GXSharePlatformConfig_Tencent_AppRedirectUrl = redirectUrl;
        }
            break;
        default:
            break;
    }
}
@end
