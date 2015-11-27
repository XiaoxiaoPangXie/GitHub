//
//  WBGetInterface+WBFriendships.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBFriendships.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]

@implementation WBGetInterface (WBFriendships)

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

// 获取用户数组
- (NSArray *)getUserList:(NSString *)str{
    
    NSDictionary * rootDic = [self getRootObject:str];
    NSArray * usersArr = [rootDic objectForKey:@"users"];
    NSMutableArray * arr = [NSMutableArray new];
    for (NSDictionary * dic in usersArr) {
        [arr addObject:[[WBUserModel alloc] initWithDictionary:dic]];
    }
    return arr;
}

// 访问服务器，返回数据
- (id)postRootObject:(NSString *)str postStr:(NSString *)post{
    
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData * body = [[post stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:body];
    
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    id root = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSLog(@"error:%@",[error localizedDescription]);
        return nil;
    }
    return root;
}

#pragma -mark- getFriend
// 获取用户的关注列表 用户ID
- (NSArray *)getFriendShipFriends:(NSInteger)uid{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/friends.json?access_token=%@&uid=%ld",Access_Token,uid];
    
    return [self getUserList:str];
}

// 获取用户关注的用户UID列表
- (NSArray *)getFriendShipFriends_Ids{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/friends/ids.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"ids"];
}

// 获取两个用户之间的共同关注人列表 用户ID
- (NSArray *)getFriendShipFriendsIn_Common:(NSInteger)uid{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/friends/in_common.json?access_token=%@&uid=%ld",Access_Token,uid];
    
    return [self getUserList:str];
}

// 获取用户的双向关注列表，即互粉列表
- (NSArray *)getFriendShipFriendsBilateral{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/friends/bilateral.json?access_token=%@",Access_Token];
    
    return [self getUserList:str];
}

// 获取用户双向关注的用户ID列表，即互粉UID列表
- (NSArray *)getFriendShipFriendsBilateral_Ids{

    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/friends/bilateral/ids.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"ids"];
}

#pragma -mark- getFollowers
// 获取用户的粉丝列表 用户ID
- (NSArray *)getFriendShipFollowers:(NSInteger)uid{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/followers.json?access_token=%@&uid=%ld",Access_Token,uid];
    
    return [self getUserList:str];
}

// 获取用户粉丝的用户UID列表
- (NSArray *)getFriendShipFollowers_Ids{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/followers/ids.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"ids"];
}

// 获取用户的活跃粉丝列表
- (NSArray *)getFriendShipFollowersActive:(NSInteger)uid{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/followers/active.json?access_token=%@&uid=%ld",Access_Token,uid];
    
    return [self getUserList:str];
}

#pragma -mark- GetFriends_Chain
// 获取当前登录用户的关注人中又关注了指定用户的用户列表 用户ID
- (NSArray *)getFriendShipFriends_ChainFollowers:(NSInteger)uid{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/friends_chain/followers.json?access_token=%@&uid=%ld",Access_Token,uid];
    
    return [self getUserList:str];
}

#pragma -mark- GetShow
// 获取两个用户之间的详细关注关系情况
- (NSDictionary *)getFriendShipShowWithID:(NSInteger)target_id{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/show.json?access_token=%@&target_id=%ld",Access_Token,target_id];
    
    NSDictionary * rootDic = [self getRootObject:str];
    NSMutableDictionary * dic = [NSMutableDictionary new];
    for (NSString * tempStr in [rootDic allKeys]) {
        NSDictionary * temp = [rootDic objectForKey:tempStr];
        WBFriendsShow show ;
        show.ID = [[temp objectForKey:@"id"] integerValue];
        show.followed_by = [temp objectForKey:@"followed_by"];
        show.following = [temp objectForKey:@"followed"];
        show.notifications_enabled = [temp objectForKey:@"notifications_enabled"];
        show.screen_name = [[temp objectForKey:@"screen_name"] UTF8String];
        [dic setObject:[[NSValue alloc] initWithBytes:&show objCType:@encode(WBFriendsShow)]  forKey:tempStr];
    }
    return dic;
}

- (NSDictionary *)getFriendShipShowWithName:(NSString *)target_screen_name{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/friendships/show.json?access_token=%@&target_screen_name=%@",Access_Token,target_screen_name];
    
    NSDictionary * rootDic = [self getRootObject:str];
    NSMutableDictionary * dic = [NSMutableDictionary new];
    for (NSString * tempStr in [rootDic allKeys]) {
        NSDictionary * temp = [rootDic objectForKey:tempStr];
        WBFriendsShow show ;
        show.ID = [[temp objectForKey:@"id"] integerValue];
        show.followed_by = [temp objectForKey:@"followed_by"];
        show.following = [temp objectForKey:@"followed"];
        show.notifications_enabled = [temp objectForKey:@"notifications_enabled"];
        show.screen_name = [[temp objectForKey:@"screen_name"] UTF8String];
        [dic setObject:[[NSValue alloc] initWithBytes:&show objCType:@encode(WBFriendsShow)]  forKey:tempStr];
    }
    return dic;
}

#pragma -mark- Post

// 关注一个用户
- (WBUserModel *)postFriendshipsCreateWithID:(NSInteger)uid{
    
    NSString * str = @"https://api.weibo.com/2/friendships/create.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&uid=%ld",Access_Token,uid];
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBUserModel alloc] initWithDictionary:rootDic];
}

- (WBUserModel *)postFriendshipsCreateWithName:(NSString *)screen_name{
    
    NSString * str = @"https://api.weibo.com/2/friendships/create.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&screen_name=%@",Access_Token,screen_name];
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBUserModel alloc] initWithDictionary:rootDic];
}

//  取消关注一个用户
- (WBUserModel *)postFriendshipsDestroyWithID:(NSInteger)uid{
    
    NSString * str = @"https://api.weibo.com/2/friendships/destroy.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&uid=%ld",Access_Token,uid];
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBUserModel alloc] initWithDictionary:rootDic];
}

- (WBUserModel *)postFriendshipsDestroyWithName:(NSString *)screen_name{
    
    NSString * str = @"https://api.weibo.com/2/friendships/destroy.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&screen_name=%@",Access_Token,screen_name];
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBUserModel alloc] initWithDictionary:rootDic];
}
@end
