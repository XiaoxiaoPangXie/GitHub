//
//  WBGetInterface+WBComments.m
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBComments.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]
@implementation WBGetInterface (WBComments)

#pragma -mark- commen
// 获取json数据中主数据对象
- (id)getRootDictionary:(NSString *)str{
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

// 获取JSON数据第一个对象的数据
- (NSMutableArray *)getCommentsArray:(NSString *)str{
    
    NSDictionary * rootDic = [self getRootDictionary:str];
    
    NSArray * statuseArr = [rootDic objectForKey:@"comments"];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    
    for (NSDictionary * dic in statuseArr) {
        WBCommentsModel * comments = [[WBCommentsModel alloc]initWithDictionary:dic];
        [arr addObject:comments];
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

#pragma -mark- Get
//获取某条微博的评论列表
-(NSMutableArray *)getComments_show:(NSString *)ID;
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/comments/show.json?access_token=%@&id=%@",Access_Token,ID];
    
    return [self getCommentsArray:str];
}

//我发出的评论列表
- (NSMutableArray *)getComments_by_me
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/comments/by_me.json?access_token=%@",Access_Token];
    
    return [self getCommentsArray:str];
}

//我收到的评论列表
- (NSMutableArray *)getComments_to_me
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/comments/to_me.json?access_token=%@",Access_Token];
    
    return [self getCommentsArray:str];
}

//获取用户发送及收到的评论列表
- (NSMutableArray *)getComments_timeline
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/comments/timeline.json?access_token=%@",Access_Token];
    
    return [self getCommentsArray:str];
}

//获取@到我的评论
- (NSMutableArray *)getComments_mentions
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/comments/mentions.json?access_token=%@",Access_Token];
    
    return [self getCommentsArray:str];
}

//批量获取评论内容
- (NSMutableArray *)getComments_show_batch:(NSString *)cids
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/comments/mentions.json?access_token=%@&cids=%@",Access_Token,cids];
    
    return [self getCommentsArray:str];
}

#pragma -mark- Post
//评论一条微博
- (WBCommentsModel *)postComments_create:(NSString *)Id Comment:(NSString *)comment Comment_ori:(BOOL)comment_ori
{
    NSString *str = @"https://api.weibo.com/2/comments/create.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&id=%@&comment=%@&comment_ori=%d",Access_Token,Id,comment,comment_ori];
    
    NSDictionary *rootDic = [self postRootObject:str postStr:post];
    
    return [[WBCommentsModel alloc] initWithDictionary:rootDic];
}

//删除一条评论
- (WBCommentsModel *)postComments_destroy:(NSString *)cid
{
    NSString *str = @"https://api.weibo.com/2/comments/destory.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&cid=%@",Access_Token,cid];
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBCommentsModel alloc] initWithDictionary:rootDic];
}

//批量删除评论
- (NSArray *)postComments_destroy_batch:(NSString *)cids
{
    NSString *str = @"https://api.weibo.com/2/comments/destroy_batch.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&cids=%@",Access_Token,cids];
    
    NSArray * rootArr = [self postRootObject:str postStr:post];
    
    NSMutableArray * arr = [NSMutableArray new];
    
    for (NSDictionary * dic in rootArr) {
        [arr addObject:[[WBCommentsModel alloc] initWithDictionary:dic]];
    }
    
    return arr;
}

//回复一条评论
- (WBCommentsModel *)postComments_reply:(NSString *)Id Cid:(NSString *)cid Comment:(NSString *)comment Without_mention:(BOOL)without_mention Comment_ori:(BOOL)comment_ori
{
    NSString *str = @"https://api.weibo.com/2/comments/reply.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&id=%@&cid=%@&comment=%@&without_mention=%d&comment_ori=%d",Access_Token,Id,cid,comment,without_mention,comment_ori];
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBCommentsModel alloc] initWithDictionary:rootDic];
}

@end
