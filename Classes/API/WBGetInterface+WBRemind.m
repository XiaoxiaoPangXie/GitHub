//
//  WBGetInterface+WBRemind.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBRemind.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]
@implementation WBGetInterface (WBRemind)

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
- (WBRemindModel *)getRemindUnread_Count{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/account/profile/email.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [[WBRemindModel alloc] initWithDictionary:rootDic];
}

#pragma -mark- POST
- (BOOL)postRemindSet_Count:(NSString *)type{
    NSString * str = @"https://rm.api.weibo.com/2/remind/set_count.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&type=%@",Access_Token,type];
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[rootDic objectForKey:@"result"] boolValue];
}
@end
