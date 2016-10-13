//
//  Model.m
//  mvcTest
//
//  Created by sheng on 2016/10/11.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}


// 获取数据。。。model用来获取数据。。。
+ (NSArray *)modelsWithArray{
    NSDictionary *dict = @{@"name":@"baby",@"imageUrl":@"0",@"cotent":@"上面是一个model文件，用于接收二层数据11111111111111111111"};
    NSDictionary *dic1 = @{@"name":@"baby",@"imageUrl":@"0",@"cotent":@"上面是一个model文件，用于接收二层数据111111111111111111"};
    NSDictionary *dic2 = @{@"name":@"baby",@"imageUrl":@"0",@"cotent":@"上面是一个model文件，用于接收二层数据111111111111111"};
    NSDictionary *dic3 = @{@"name":@"baby",@"imageUrl":@"0",@"cotent":@"上面是一个model文件，用于接收二层数据111111111"};
    NSDictionary *dic4 = @{@"name":@"baby",@"imageUrl":@"0",@"cotent":@"上面是一个model文件，用于接收二层数据"};
    NSDictionary *dic5 = @{@"name":@"baby",@"imageUrl":@"0",@"cotent":@"上面是一个model文件，用于接收二层数据"};
    NSDictionary *dic6 = @{@"name":@"baby",@"imageUrl":@"0",@"cotent":@"上面是一个model文件，用于接收二层数据111111111111"};
    
    NSArray *aaa = @[dict,dic1,dic2,dic3,dic4,dic5,dic6];
    NSMutableArray *mm = [NSMutableArray array];
    for (NSDictionary *dc in aaa) {
        Model *m = [Model modelWithDict:dc];
        [mm addObject:m];
    }
    return mm;
}
@end
