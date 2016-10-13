//
//  ViewModel.h
//  mvvmTest
//
//  Created by sheng on 2016/10/11.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;
@interface ViewModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *content;
- (instancetype)initWithModel:(Model *)model;
+ (NSArray *)viewModels;
@end
