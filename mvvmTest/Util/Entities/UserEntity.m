//
//  UserEntity.m
//  mvvmTest
//
//  Created by sheng on 2016/10/13.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import "UserEntity.h"
#import <objc/runtime.h>

@implementation UserEntity
+ (instancetype)intance{
    static UserEntity *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[UserEntity alloc] init];
    });
    return instance;
}

+ (void)releaseData{
    // 用运行时方法给属性全部复制为空
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i<count; i++) {
        objc_property_t p = properties[i];
       const char *chName = property_getName(p);
        NSString *name = [NSString stringWithUTF8String:chName];
        [self setValue:@"" forKey:name];
    }
}
@end
