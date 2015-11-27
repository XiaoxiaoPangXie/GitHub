//
//  WBGetInterface+WBSearch.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBSearch.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]
#define Count 20
@implementation WBGetInterface (WBSearch)

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
// 搜索学校时的联想搜索建议
- (NSArray *)getSearchSuggestions_Schools:(NSString *)p Type:(WBSchoolType)type{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/schools.json?access_token=%@&p=%@&count=%d&type=%ld",Access_Token,p,Count,type];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBSearchSchool school;
        school.school_name = [[dic objectForKey:@"school_name"] UTF8String];
        school.ID = [[dic objectForKey:@"id"] integerValue];
        school.location = [[dic objectForKey:@"location"] integerValue];
        school.type = [[dic objectForKey:@"type"] integerValue];
        [arr addObject:[NSValue valueWithBytes:&school objCType:@encode(WBSearchSchool)]];
    }
    return arr;
}

// 搜索用户时的联想搜索建议
- (NSArray *)getSearchSuggestions_Users:(NSString *)p{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/users.json?access_token=%@&p=%@&count=%d",Access_Token,p,Count];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBSearchUser user;
        user.uid = [[dic objectForKey:@"uid"] integerValue];
        user.screen_name = [[dic objectForKey:@"screen_name"] UTF8String];
        user.followers_count = [[dic objectForKey:@"followers_count"] integerValue];
        [arr addObject:[NSValue valueWithBytes:&user objCType:@encode(WBSearchUser)]];
    }
    return arr;
}

// 搜索公司时的联想搜索建议
- (NSArray *)getSearchSuggestions_Companies:(NSString *)p{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/companies.json?access_token=%@&p=%@&count=%d",Access_Token,p,Count];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        [arr addObject:[dic objectForKey:@"suggestion"]];
    }
    return arr;
}

// 搜索应用时的联想搜索建议
- (NSArray *)getSearchSuggestions_Apps:(NSString *)p{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/apps.json?access_token=%@&p=%@&count=%d",Access_Token,p,Count];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBSearchApp app;
        app.apps_name = [[dic objectForKey:@"apps_name"] UTF8String];
        app.members_count = [[dic objectForKey:@"members_count"] integerValue];
        [arr addObject:[NSValue valueWithBytes:&app objCType:@encode(WBSearchApp)]];
    }
    return arr;
}

// 搜索微博时的联想搜索建议
- (NSArray *)getSearchSuggestions_Statuses:(NSString *)p{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/statuses.json?access_token=%@&p=%@&count=%d",Access_Token,p,Count];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBSearchStatus status;
        status.suggestion = [[dic objectForKey:@"suggestion"] UTF8String];
        status.count = [[dic objectForKey:@"count"] integerValue];
        [arr addObject:[NSValue valueWithBytes:&status objCType:@encode(WBSearchStatus)]];
    }
    return arr;
}

// @用户时的联想建议
- (NSArray *)getSearchSuggestions_At_Users:(NSString *)p Type:(WBSearchAt_UserType)type{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/at_users.json?access_token=%@&p=%@&count=%d&type=%ld",Access_Token,p,Count,type];
    
    NSArray * rootArr = [self getRootObject:str];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        WBSearchAt_User at_user;
        at_user.nickname = [[dic objectForKey:@"nickname"] UTF8String];
        at_user.uid = [[dic objectForKey:@"uid"] integerValue];
        at_user.remark = [[dic objectForKey:@"remark"] UTF8String];
        [arr addObject:[NSValue valueWithBytes:&at_user objCType:@encode(WBSearchAt_User)]];
    }
    return arr;
}

// 搜索某一话题下的微博
- (NSArray *)getSearchSuggestions_Topics:(NSString *)p{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/search/suggestions/topics.json?access_token=%@&p=%@&count=%d",Access_Token,p,Count];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    NSArray * statusArr = [rootDic objectForKey:@"statuses"];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in statusArr) {
        [arr addObject:[[WBTimeLineModel alloc] initWithDictionary:dic]];
    }
    return arr;
}
@end
