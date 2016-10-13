//
//  ViewModel.m
//  mvvmTest
//
//  Created by sheng on 2016/10/11.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"

@implementation ViewModel
- (instancetype)initWithModel:(Model *)model{
    if (self = [super init]) {
        self.name = model.name;
        if ([model.imageUrl  isEqualToString:@"0"]) {
            self.url = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpeg"];
        }
        self.content = model.cotent;
    }
    return self;
}
+ (NSArray *)viewModels{
    NSArray *models = [Model modelsWithArray];
    NSMutableArray *newModels = [NSMutableArray array];
    for (Model *model in models) {
        ViewModel *v = [[ViewModel alloc] initWithModel:model];
        [newModels addObject:v];
    }
    return newModels;
}
@end
