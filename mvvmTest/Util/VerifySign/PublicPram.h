//
//  PublicPram.h
//  AnBangSDKLib
//
//  Created by sheng on 16/6/16.
//  Copyright © 2016年 com.hisuntech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicPram : NSObject
+ (NSString *)pubkserver;
+ (NSString *)prikclient;
+ (NSString *)pubkclient;
+ (NSString *)WEB_DOME_GATEWAY;// 移动网关地址
+ (NSString *)WEB_SDK_DOME_GATEWAY;// 商户签名地址
+(NSString *)WEB_URL_BANK_CARD_LIMIT;//限额说明

@end
