//
// Created by lijing on 15/5/26.
// Copyright (c) 2015 com.8f8. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


@interface GatewaySign : NSObject

+ (NSString *)getPrikClient;

+ (NSString *)getPubkServer;

- (NSString *)signTheDataSHA1WithRSA:(NSString *)plainText;

- (BOOL)vertifySignDataSHA1WithRSA:(NSString *)signText withSign:(NSString *)sign;

@end
