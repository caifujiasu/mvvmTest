//
//  PublicPram.m
//  AnBangSDKLib
//
//  Created by sheng on 16/6/16.
//  Copyright © 2016年 com.hisuntech. All rights reserved.
//

#import "PublicPram.h"

@implementation PublicPram
+ (NSString *)pubkserver{
    return @"MIIoApiu961YBgiPMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCv92J4LlobXJdh/rTGdqdlHvQj8Q6jozHgzwo8+JxUSGAoh+VbcILZijwMootSz+TGUgIaM6zzIES9tur5vJyZaG6zcpG25Ym4Pu+Le2cymO/cjfkAiUh59TdgxsfBpY/0N6yNsMByc+Z0ImIfPxHU+slkDMis/UmMv/4V1e8mQQIDAQABpiOsderiLiAWhrxB";
}
+ (NSString *)prikclient{
    return @"MI0TBmLierxUYSVRMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAJdC7e/LrOo8Z2Lhn4ZFdMsrEsgHMMGxlcusMYA6H9Wvv6a+qz/DZRaN9rUe6mCwuZwXubDwaK+kMkq3KRVK48ckzl9e452apP43322SQAR9c9ePQYqpPEMhm6qb6NQObj2ssJkeRE9RTqNj5lAHN9ibz7h6YDErZsAIgNrzENO/AgMBAAECgYBjhIdjE0/qtF8Y8XSxNJVI7kfnDsQHS71QSTQwNw2m24BuRlgJFZc2paRBOdveTadwiTOEtEdL9+2Wtrby6Vi+LMmI0HdI27rV2ejze/MbQMABVBxoDnRcEFEpXQSVctkbqjW/E7LZbizY15asythWuIg/LSxUKSxhOPH0If0OIQJBAPk2NWnhvnQZDDw3dfwRWZQ6A2HS0m1yQCKAiUzxe2lFAZ6rLbcAixwVSndUwAGtlMK0LeJ5CLDGGH2LN+J/a+cCQQCbYbLMK7KCOwwpYS//HN9ljh/pYcaMiFHKe7fi9QEWNr6eJOcdNF7amNXN8onZjPaNcC8LlhJlRjFok4Ang55pAkEApkXi0WhKuA9WOH8Qe0PgLqOeShBtUZSe8eYstWeQ3aWq9QBlGeqE5hHWg1PKX9Q+osGws5/pinhBMtJGURqPFQJAX6ifJdlFFa36h8MghGOnGOONu+WJEd2e1RSjmeMSHzXm1n+LlUw3lUaAYkEOItQIufy1yeFDQ/wZ0PL1892w+QJBANHKs3Bu+pn/wrWhyYX1VkJravz4iadacE1x48Jnr0e0AQEo0ydoJ/EE5QDTSe4l8bTDUTr1unAgMaxtaGoRYw4=UaIOWQFHVNSOrtH=";
}
+ (NSString *)pubkclient{
    return @"MTWBgh52txqwRvTPMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCXQu3vy6zqPGdi4Z+GRXTLKxLIBzDBsZXLrDGAOh/Vr7+mvqs/w2UWjfa1HupgsLmcF7mw8GivpDJKtykVSuPHJM5fXuOdmqT+N99tkkAEfXPXj0GKqTxDIZuqm+jUDm49rLCZHkRPUU6jY+ZQBzfYm8+4emAxK2bACIDa8xDTvwIDAQABNCDROUY8cEWigcsB";
}

+ (NSString *)WEB_DOME_GATEWAY{
    return @"http://10.211.1.170:9000/new_mca_test"; //sit环境
//    return @"https://www.8f8.com/new_mca"; // 生产环境
//    return @"http://10.211.1.170:8102";    // 开发环境

}

+ (NSString *)WEB_SDK_DOME_GATEWAY{
//    return @"https://pay.8f8.com/cashier"; // 生产环境
    return @"http://10.211.1.176:7001/cashier"; // sit环境
//    return @"http://10.10.238.29:8090";  // 开发环境
}
+(NSString *)WEB_URL_BANK_CARD_LIMIT{
    return @"https://www.8f8.com/help/stock_bank_limit.html";
}
@end
