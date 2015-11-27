//
//  WBGetInterface+WBGetCommon.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBGetCommon.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]
@implementation WBGetInterface (WBGetCommon)

#pragma -mark- commen
// 获取json数据中数据，返回字典或者数组
- (id)getRootObject:(NSString *)str{
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    id root = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"error:%@",[error localizedDescription]);
        return nil;
    }
    
    return root;
}

#pragma -mark- Get
// 通过地址编码获取地址名称
- (NSArray *)getCommonCode_to_Location:(NSString *)codes{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/common/code_to_location.json?access_token=%@&codes=%@",Access_Token,codes];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBCommonCode city;
        city.cityCode = [[[dic allKeys] firstObject] integerValue];
        city.cityName = [[[dic allValues] firstObject] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&city objCType:@encode(WBCommonCode)]];
    }
    
    return arr;
}

// 获取城市列表
- (NSArray *)getCommonGet_City:(NSString *)province{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/common/get_city.json?access_token=%@&province=%@",Access_Token,province];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBCommonCode city;
        city.cityCode = [[[dic allKeys] firstObject] integerValue];
        city.cityName = [[[dic allValues] firstObject] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&city objCType:@encode(WBCommonCode)]];
    }
    
    return arr;
}

// 获取省份列表
- (NSArray *)getCommonGet_Province:(NSString *)country{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/common/get_province.json?access_token=%@&country=%@",Access_Token,country];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBCommonCode province;
        province.cityCode = [[[dic allKeys] firstObject] integerValue];
        province.cityName = [[[dic allValues] firstObject] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&province objCType:@encode(WBCommonCode)]];
    }
    
    return arr;
}

// 获取国家列表
- (NSArray *)getCommonGet_Country{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/common/get_country.json?access_token=%@",Access_Token];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBCommonCode country;
        country.cityCode = [[[dic allKeys] firstObject] integerValue];
        country.cityName = [[[dic allValues] firstObject] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&country objCType:@encode(WBCommonCode)]];
    }
    
    return arr;
}

// 获取时区配置表
- (NSArray *)getCommonGet_Timezone{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/common/get_timezone.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSString * string in [rootDic allKeys]) {
        WBCommonTimeCode time;
        time.number = [string integerValue];
        time.timeName = [[rootDic objectForKey:string] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&time objCType:@encode(WBCommonTimeCode)]];
    }
    
    return arr;
}
@end
