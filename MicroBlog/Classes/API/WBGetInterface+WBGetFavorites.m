//
//  WBGetInterface+WBGetFavorites.m
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBGetFavorites.h"
#import "WBUser.h"
#define Access_Token [[WBUser shareInstance] access_token]

@implementation WBGetInterface (WBGetFavorites)

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

// 获取JSON数据第一个对象的数据
- (NSArray *)getFavoritesArray:(NSString *)str{
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    NSArray * statuseArr = [rootDic objectForKey:@"favorites"];
    NSMutableArray * arr = [[NSMutableArray alloc] init]    ;
    
    for (NSDictionary * dic in statuseArr) {
        WBFavoritesModel * favorites = [[WBFavoritesModel alloc] initWithDictionary:dic];
        [arr addObject:favorites];
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

//获取微博信息对象
- (WBTimeLineModel *)getTimeLineModel:(NSString *)str
{
    NSDictionary *rootDic = [self getRootObject:str];
    return [[WBTimeLineModel alloc]initWithDictionary:rootDic];
}

//获取当前用户的收藏列表
-(NSArray *)getFavorites
{
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/favorites.json?access_token=%@",Access_Token];
    return [self getFavoritesArray:str];
}

//获取当前用户的收藏的列表的ID
-(NSArray *)getFavorites_ids
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/favorites/ids.json?access_token=%@",Access_Token];
    return [self getFavoritesArray:str];
}

//获取单条收藏信息
- (WBTimeLineModel *)getFavorites_show:(NSString *)Id
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/favorites/show.json?access_token=%@&id=%@",Access_Token,Id];
    return [self getTimeLineModel:str];
}

//添加收藏
- (WBTimeLineModel *)getFavorites_create:(NSString *)Id
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/favorites/create.json"];
    NSString *post = [NSString stringWithFormat:@"access_token=%@&id=%@",Access_Token,Id];
    NSDictionary *rootDic = [self postRootObject:str postStr:post];
    return [[WBTimeLineModel alloc]initWithDictionary:rootDic];
}

//删除收藏
- (WBTimeLineModel *)getFavorites_destroy:(NSString *)Id
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/favorites/destroy.json"];
    NSString *post = [NSString stringWithFormat:@"access_token=%@&id=%@",Access_Token,Id];
    NSDictionary *rootDic = [self postRootObject:str postStr:post];
    return [[WBTimeLineModel alloc]initWithDictionary:rootDic];
}

//批量删除收藏
- (BOOL)getFavorites_destroy_batch:(NSString *)ids
{
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/favorites/destroy_batch.json"];
    NSString *post = [NSString stringWithFormat:@"access_token=%@&ids=%@",Access_Token,ids];
    NSDictionary *rootDic = [self postRootObject:str postStr:post];
    return [[WBTimeLineModel alloc]initWithDictionary:rootDic];
}



@end
