//
//  WBGetInterface+WBGetUser.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBGetUser.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]

@implementation WBGetInterface (WBGetUser)

#pragma -mark- commen
// 获取json数据中主数据对象
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

// 获取用户对象
- (WBUserModel *)getUserModel:(NSString *)str{
    
    NSDictionary * roorDic = [self getRootObject:str];
    
    return [[WBUserModel alloc] initWithDictionary:roorDic];
}

#pragma -mark- GET
// 根据用户ID获取用户信息 
- (WBUserModel *)getUserShowWithId:(NSInteger)uid{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/users/show.json?access_token=%@&uid=%ld",Access_Token,uid];
    
    return [self getUserModel:str];
}

- (WBUserModel *)getUserShowWithName:(NSString *)screen_name{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/users/show.json?access_token=%@&screen_name=%@",Access_Token,screen_name];
    
    return [self getUserModel:str];
}

// 通过个性化域名获取用户资料以及用户最新的一条微博 
- (WBUserModel *)getUserDomain_Show:(NSString *)domain{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/users/domain_show.json?access_token=%@&domain=%@",Access_Token,domain];
    
    return [self getUserModel:str];
}

- (WBCounts)getUserCounts:(NSString *)uids{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/users/counts.json?access_token=%@&uids=%@",Access_Token,uids];
    
    NSDictionary * rootDic = [[self getRootObject:str] firstObject];
    
    WBCounts counts;
    counts.ids = [[rootDic objectForKey:@"id"] integerValue];
    counts.followers_count = [[rootDic objectForKey:@"followers_count"] integerValue];
    counts.friends_count = [[rootDic objectForKey:@"friends_count"] integerValue];
    counts.pagefriends_count = [[rootDic objectForKey:@"pagefriends_count"] integerValue];
    counts.private_friends_count = [[rootDic objectForKey:@"private_friends_count"] integerValue];
    counts.statuses_count = [[rootDic objectForKey:@"statuses_count"] integerValue];
    
    return counts;
}
@end
