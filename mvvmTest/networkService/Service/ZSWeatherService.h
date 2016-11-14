//
//  ZSWeatherService.h
//  mvvmTest
//
//  Created by sheng on 2016/10/17.
//  Copyright © 2016年 sheng. All rights reserved.
//

#import "GateWayServiceBase.h"

//Generalize(ZSWeatherDataService);
@interface ZSWeatherDataService : GateWaySerciceDataBase
@property (nonatomic, strong) NSDictionary *prams;
@end


@interface ZSWeatherService : GateWayServiceBase
@property (nonatomic, copy) NSString *city;
@end
