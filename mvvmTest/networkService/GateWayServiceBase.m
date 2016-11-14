//
//  GateWayServiceBase.m
//  mvvmTest
//
//  Created by sheng on 2016/10/13.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import "GateWayServiceBase.h"
#import "AFNetworking.h"
#import "UIDevice+Hardware.h"
#import "GatewaySign.h"
#import <objc/runtime.h>
#import "LoadingView.h"

@interface GateWayServiceBase ()
{
    NSURLSessionDataTask *task;
}
@end

@implementation GateWayServiceBase

- (NSDictionary *)buildParams{
    NSDictionary *body = [self serializeToDictionary];
    
    NSString *appVersoin = [NSString stringWithFormat:@"V%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    
    NSDictionary *header = @{
                             @"VERSION": appVersoin,
                             @"DEVICE_OS":@"iOS",
                             @"DEVICE_ID":[UIDevice currentDevice].uniqueID,
                             @"MCID":@"",
                             @"LOGIN_NAME": @"15662174860",
                             @"USER_NO": @"429795864",
                             @"DEVICE_NAME":[UIDevice currentDevice].name,
                             @"PLATFORM":@"",
                             @"OS_VERSION":[[UIDevice currentDevice] systemVersion],
                             @"DEVICE_BRD": @"Apple",//设备品牌
                             @"DEVICE_TYP": [[UIDevice currentDevice] machineName]//设备型号
                             };
    
    NSDictionary *params  = @{@"body":body,@"header":header};
    return params;
}

- (void)requestPOST:(BOOL)isLoading resultBlcok:(ResultBlock)resultBlcok{
    if (isLoading) {
        // 开始转圈加载
        [[LoadingView shareLoadingView] show];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",nil];
    
    NSDictionary *params = [self buildParams];
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    NSString * paramStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    // 对参数用私钥加密 写入http 请求头中 ==》验证合法性
    GatewaySign *sign = [[GatewaySign alloc] init];
    NSString *rsaPram = [sign signTheDataSHA1WithRSA:paramStr];
    [manager.requestSerializer setValue:rsaPram forHTTPHeaderField:@"sign"];
    
    // 将token 写入http请求头中 ==》验证时间有效性
    if ([UserEntity intance].accessToken) {
        [manager.requestSerializer setValue:[UserEntity intance].accessToken forHTTPHeaderField:@"accessToken"];
    }
    NSString *webDome = [PublicPram WEB_DOME_GATEWAY];
    
   task = [manager POST:webDome parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       [[LoadingView shareLoadingView] close];
        // 对网络请求成功返回的数据进行处理
        if(resultBlcok){
           __block NSError *error = nil;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                id object = [self analyzeResponse:responseObject error:&error];
                if ([object isKindOfClass:[JsonSerializableObject class]]) {
                    GateWaySerciceDataBase *dataBase = object;
                    // 在这里对 database 进行处理。。。。
                    if ([dataBase.rspCode isEqualToString:@"11111"]) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            // 例如 去登录。。。。
                            return ;
                        });
                    }
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    resultBlcok(object,error);
                });
                
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败的处理
        [[LoadingView shareLoadingView] close];

    }];
    
}
- (void)requestGET:(BOOL)isLoading url:(NSString *)url resultBlcok:(ResultBlock)resultBlcok{
    if (isLoading) {
        // 开始转圈加载
        [[LoadingView shareLoadingView] show];
    }
    
    NSDictionary *body = [self serializeToDictionary];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",nil];
    
    [manager.requestSerializer setValue:@"9b721a2cf40343cb2c264aa86c583358" forHTTPHeaderField:@"apikey"];
    task = [manager GET:url parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[LoadingView shareLoadingView] close];
        // 对网络请求成功返回的数据进行处理
        if(resultBlcok){
            __block NSError *error = nil;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                
                id object = [self analyzeResponse:responseObject error:&error];
                if ([object isKindOfClass:[JsonSerializableObject class]]) {
                    GateWaySerciceDataBase *dataBase = object;
                    // 在这里对 database 进行处理。。。。
//                    if ([dataBase.rspCode isEqualToString:@"11111"]) {
//                        dispatch_async(dispatch_get_main_queue(), ^{
//                            // 例如 去登录。。。。
//                            return ;
//                        });
//                    }
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    resultBlcok(object,error);
                });
                
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败的处理
        [[LoadingView shareLoadingView] close];
        
    }];
}

// 对返回的数据进行处理 延签，保存token 转换为 响应对象
- (id)analyzeResponse:(NSData *)response error:(NSError **)pError{
    // 验签处理
    id result;
    NSString *responseStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSDictionary *headers;
    if([task.response isKindOfClass:[NSHTTPURLResponse class]]){
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
        headers = httpResponse.allHeaderFields;
    }
    NSString *sign,*accessToken;
    if (headers) {
        sign = [headers objectForKey:kSign];
        accessToken = [headers objectForKey:kAccessToken];
    }
    BOOL isOk;
    if (sign && accessToken) {
        GatewaySign *vertify = [GatewaySign new];
      isOk =  [vertify vertifySignDataSHA1WithRSA:responseStr withSign:sign];
    }
    
#ifdef vertifySign
    
    if (!isOk) {
        result = nil;
    }
    return result;
#endif
    [UserEntity intance].accessToken = accessToken;
    // 处理返回的有效数据
    result = [self transeferStringToObject:responseStr error:pError];
    
    return result;
}

- (id)transeferStringToObject:(NSString *)str error:(NSError **)pError{
    Class repnseType = [self getResponseType];
    id result;
     NSDictionary *dictionry = [str objectFromJSONString];
    NSDictionary *header = [dictionry objectForKey:@"header"];
    if (![[header objectForKey:@"errorCode"] isEqualToString:@"000000"]) {
        *pError = [NSError errorWithDomain:@"request error" code:999999 userInfo:nil];
    }
    if ([repnseType isSubclassOfClass:[JsonSerializableObject class]]) {
        result = [[repnseType alloc] initWithDictionary:dictionry];
    }else{
        result = dictionry;
    }
    return result;
}

- (Class)getResponseType{
    unsigned int protoCount;
    Class responseType;
    Protocol* __unsafe_unretained *protocols = class_copyProtocolList([self class], &protoCount);
    for(int i = 0;i < protoCount;i++){
        Protocol *p = protocols[i];
        NSString *respnseName = NSStringFromProtocol(p);
        Class responseClass = NSClassFromString(respnseName);
        if ([responseClass isSubclassOfClass:[JsonSerializableObject class]]) {
            responseType = responseClass;
            break;
        }
    }
    free(protocols);
    return responseType;
}

@end
