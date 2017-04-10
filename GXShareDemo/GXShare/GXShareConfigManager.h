//
//  GXShareConfigManager.h
//  GXShareDemo
//
//  Created by yingcan on 17/1/4.
//  Copyright © 2017年 Guoxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GXShareConfigManagerInstance [GXShareConfigManager sharedInstance]


//配置平台类型
typedef NS_ENUM(NSInteger,GXSharePlatformConfigType) {
    
    GXSharePlatformConfigType_Sina,   //新浪
    GXSharePlatformConfigType_Wechat, //微信
    GXSharePlatformConfigType_Tencent //腾讯
};
//分享到的平台类型
typedef NS_ENUM(NSInteger,GXSharePlatformType) {
    
    GXSharePlatformType_Sina,           //新浪微博
    GXSharePlatformType_WechatSession,  //微信好友
    GXSharePlatformType_WechatTimeLine, //微信朋友圈
    GXSharePlatformType_QQ,             //qq聊天
    GXSharePlatformType_QQZone,         //qq空间
    GXSharePlatformType_TencentWeibo    //腾讯微博
};

@interface GXShareConfigManager : NSObject

+ (GXShareConfigManager *)sharedInstance;

//友盟appkey
@property (nonatomic, copy) NSString * UMShareAppKey;
@property (nonatomic, assign) BOOL shareLogOpen;

//成功和失败提示语
@property (nonatomic, copy) NSString * shareSuccessMsg;
@property (nonatomic, copy) NSString * shareFailureMsg;

//设置新浪相关
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Sina_Appkey;
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Sina_AppSecret;
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Sina_AppRedirectUrl;
//设置微信相关
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Wechat_Appkey;
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Wechat_AppSecret;
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Wechat_AppRedirectUrl;
//设置qq相关
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Tencent_Appkey;
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Tencent_AppSecret;
@property (nonatomic, copy) NSString * GXSharePlatformConfig_Tencent_AppRedirectUrl;

- (void)setupPlatform:(GXSharePlatformConfigType)type appKey:(NSString *)appkey appSecret:(NSString *)appSecret appRedirectUrl:(NSString *)redirectUrl;


@end
