//
//  GateWayServiceBase.h
//  mvvmTest
//
//  Created by sheng on 2016/10/13.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonSerializableObject.h"
#import "GateWaySerciceDataBase.h"


typedef void(^ResultBlock)(id data,NSError *error);

@interface GateWayServiceBase : JsonSerializableObject <GateWaySerciceDataBase>
- (void)requestPOST:(BOOL)isLoading resultBlcok:(ResultBlock)resultBlcok;

- (void)requestGET:(BOOL)isLoading url:(NSString *)url resultBlcok:(ResultBlock)resultBlcok;

@end
