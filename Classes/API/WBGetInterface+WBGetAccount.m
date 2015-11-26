//
//  WBGetInterface+WBGetAccount.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBGetAccount.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]
@implementation WBGetInterface (WBGetAccount)

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
- (NSArray *)getAccountProfileSchool_listWithKeyword:(NSString *)keyword Type:(WBSchoolType)type{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/account/profile/school_list.json?access_token=%@&keyword=%@&type=%ld",Access_Token,keyword,type];

    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (NSDictionary * dic in rootArr) {
        WBSchoolData data;
        data.ID = [[dic objectForKey:@"id"] integerValue];
        data.name = [[dic objectForKey:@"name"] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&data objCType:@encode(WBSchoolData)]];
    }
    return arr;
}

- (NSArray *)getAccountProfileSchool_listWithCapital:(NSString *)capital Province:(NSInteger)province Type:(WBSchoolType)type{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/account/profile/school_list.json?access_token=%@&capital=%@&province=%ld&type=%ld",Access_Token,capital,province,type];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (NSDictionary * dic in rootArr) {
        WBSchoolData data;
        data.ID = [[dic objectForKey:@"id"] integerValue];
        data.name = [[dic objectForKey:@"name"] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&data objCType:@encode(WBSchoolData)]];
    }
    return arr;
}

// OAuth授权之后，获取授权用户的UID
- (NSString *)getAccountGet_UID{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/account/get_uid.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"uid"];
}

// 获取用户的联系邮箱
- (NSString *)getAccountProfile_Email{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/account/profile/email.json?access_token=%@",Access_Token];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSDictionary * dic = [rootArr firstObject];
    
    return [dic objectForKey:@"email"];
}

@end
