//
//  XAspect_ShareApplicationDelegate.m
//  GXShareDemo
//
//  Created by yingcan on 17/1/4.
//  Copyright © 2017年 Guoxuan. All rights reserved.
//

#import "XAspect_ShareApplicationDelegate.h"
#import "XAspect.h"
//#import "GXAppDelegate.h"
#import "AppDelegate.h"
#import "GXShareConfigManager.h"
#import <UMSocialCore/UMSocialCore.h>

#define AtAspect ShareAppDelegate

//#define AtAspectOfClass GXAppDelegate
#define AtAspectOfClass AppDelegate


@classPatchField(AppDelegate)
//@classPatchField()
//@implementation XAspect_ShareApplicationDelegate
AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions) {

    NSLog(@"加载友盟分享");
    
    if (GXShareConfigManagerInstance.shareLogOpen == YES) {
        [[UMSocialManager defaultManager] openLog:YES];
    }
    if (GXShareConfigManagerInstance.UMShareAppKey) {
        [[UMSocialManager defaultManager] setUmSocialAppkey:GXShareConfigManagerInstance.UMShareAppKey];
    }
    
    if (GXShareConfigManagerInstance.GXSharePlatformConfig_Sina_Appkey &&
        GXShareConfigManagerInstance.GXSharePlatformConfig_Sina_AppSecret) {
    
        NSLog(@"新浪平台分享已配置");
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                              appKey:GXShareConfigManagerInstance.GXSharePlatformConfig_Sina_Appkey
                                           appSecret:GXShareConfigManagerInstance.GXSharePlatformConfig_Sina_AppSecret
                                         redirectURL:GXShareConfigManagerInstance.GXSharePlatformConfig_Sina_AppRedirectUrl];
    }

    if (GXShareConfigManagerInstance.GXSharePlatformConfig_Wechat_Appkey &&
        GXShareConfigManagerInstance.GXSharePlatformConfig_Wechat_AppSecret) {
    
        NSLog(@"微信平台分享已配置");
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
                                              appKey:GXShareConfigManagerInstance.GXSharePlatformConfig_Wechat_Appkey
                                           appSecret:GXShareConfigManagerInstance.GXSharePlatformConfig_Wechat_AppSecret
                                         redirectURL:GXShareConfigManagerInstance.GXSharePlatformConfig_Wechat_AppRedirectUrl];
    }
    
    if (GXShareConfigManagerInstance.GXSharePlatformConfig_Tencent_Appkey &&
        GXShareConfigManagerInstance.GXSharePlatformConfig_Tencent_AppSecret) {
    
        NSLog(@"QQ平台分享已配置");
        
        [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
                                              appKey:GXShareConfigManagerInstance.GXSharePlatformConfig_Tencent_Appkey
                                           appSecret:GXShareConfigManagerInstance.GXSharePlatformConfig_Tencent_AppSecret
                                         redirectURL:GXShareConfigManagerInstance.GXSharePlatformConfig_Tencent_AppRedirectUrl];
        
    }
    
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}
//回调
AspectPatch(-, BOOL,application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation)
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        
    }
    return result;
}

AspectPatch(-, BOOL,application:(UIApplication *)application handleOpenURL:(NSURL *)url)
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        
    }
    return result;
}

@end

#undef AtAspectOfClass
#undef AtAspect
