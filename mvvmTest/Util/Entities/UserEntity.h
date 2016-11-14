//
//  UserEntity.h
//  mvvmTest
//
//  Created by sheng on 2016/10/13.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserEntity : NSObject
@property (nonatomic, copy) NSString *accessToken;


+ (instancetype)intance;

+ (void)releaseData;
@end
