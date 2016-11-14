//
// Created by lijing on 15/5/26.
// Copyright (c) 2015 com.8f8. All rights reserved.
//

#import "GatewaySign.h"
#import "NSData+Base64.h"
#import "DataSigner.h"
#import "PublicPram.h"
#import "DataVerifier.h"


@implementation GatewaySign {

}
- (NSString *)signTheDataSHA1WithRSA:(NSString *)plainText {
    id<DataSigner> signer = CreateRSADataSigner([GatewaySign getPrikClient]/*kBFBPrivateKeyClient*/);
    NSString * signedString = [signer signString:plainText];

    return signedString;
}

- (BOOL)vertifySignDataSHA1WithRSA:(NSString *)signText withSign:(NSString *)sign{
    id<DataVerifier> vertifier = CreateRSADataVerifier([GatewaySign getPubkServer]);
   return [vertifier verifyString:signText withSign:signText];
}

+(NSString *)getPubkServer{
//    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"gateway" ofType:@"plist"];
//    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filepath];
    NSString *k = [PublicPram pubkserver];
    return [k substringWithRange:NSMakeRange(16, k.length-16-16)];

}
+(NSString *)getPrikClient{
//    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"gateway" ofType:@"plist"];
//    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filepath];
    NSString *k = [PublicPram prikclient];

    return [k substringWithRange:NSMakeRange(16, k.length-16-16)];
}


@end
