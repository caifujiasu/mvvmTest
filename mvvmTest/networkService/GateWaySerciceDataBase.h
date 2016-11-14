//
//  GateWaySerciceDataBase.h
//  mvvmTest
//
//  Created by sheng on 2016/10/13.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonSerializableObject.h"

Generalize(GateWaySerciceDataBase);

@interface GateWaySerciceDataBase : JsonSerializableObject
@property (nonatomic, copy) NSString *rspCode;
@property (nonatomic, copy) NSString *rspMsg;
@end
