//
//  WBGetInterface+WBGetCommon.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"

@interface WBGetInterface (WBGetCommon)

typedef struct{
    
    NSInteger cityCode;
    const char * cityName;
}WBCommonCode;

typedef struct{
    
    NSInteger number;
    const char * timeName;
}WBCommonTimeCode;
#pragma -mark- Get
/** 通过地址编码获取地址名称 */
- (NSArray *)getCommonCode_to_Location:(NSString *)codes;

/** 获取城市列表 */
- (NSArray *)getCommonGet_City:(NSString *)province;

/** 获取省份列表 */
- (NSArray *)getCommonGet_Province:(NSString *)country;

/** 获取国家列表  */
- (NSArray *)getCommonGet_Country;

/** 获取时区配置表 */
- (NSArray *)getCommonGet_Timezone;
@end
