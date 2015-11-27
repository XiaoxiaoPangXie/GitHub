//
//  WBGetInterface+WBStatuses.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface+WBStatuses.h"
#import "WBUser.h"

#define Access_Token [[WBUser shareInstance] access_token]
@implementation WBGetInterface (WBStatuses)



#pragma -mark- common
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
- (NSArray *)getTimeLineArray:(NSString *)str{
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    NSArray * statuseArr = [rootDic objectForKey:@"statuses"];
    NSMutableArray * arr = [[NSMutableArray alloc] init]    ;
    
    for (NSDictionary * dic in statuseArr) {
        WBTimeLineModel * timeline = [[WBTimeLineModel alloc] initWithDictionary:dic];
        [arr addObject:timeline];
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

#pragma -mark- get
// 获取最新公共微博
- (NSArray *)getStatusesPublic_Timeline{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/public_timeline.json?access_token=%@",Access_Token];
    
    return [self getTimeLineArray:str];
    
}

// 获取当前登录用户及其所关注用户的最新微博
- (NSArray *)getStatusesFriends_Timeline{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline.json?access_token=%@",Access_Token];
    
    return [self getTimeLineArray:str];
}

// 获取当前登录用户及其所关注用户的最新微博
- (NSArray *)getStatusesHome_Timeline{
    
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=%@",Access_Token];
    
    return [self getTimeLineArray:str];
}

// 获取当前登录用户及其所关注用户的最新微博的ID
- (NSArray *)getStatusesFriends_Timeline_ids{
    NSString * str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/friends_timeline/ids.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"statuses"];
}

// 获取用户发布的微博
- (NSArray *)getStatusesUser_Timeline{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/user_timeline.json?access_token=%@",Access_Token];
    
    return [self getTimeLineArray:str];
}

// 获取用户发布的微博的ID
- (NSArray *)getStatusesUser_Timeline_ids{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/user_timeline/ids.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"statuses"];
}

// 批量获取指定的一批用户的微博列表(未授权)
- (NSArray *)getStatusesTimeline_Batch{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/timeline_batch.json?access_token=%@",Access_Token];
    
    return [self getTimeLineArray:str];
}

// 返回一条原创微博的最新转发微博
- (NSArray *)getStatusesRepost_Timeline:(NSString *)Id{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/repost_timeline.json?access_token=%@&id=%@",Access_Token,Id];
    
    NSDictionary * rootDic = [self getRootObject:str];
    NSArray * repostsArr = [rootDic objectForKey:@"reposts"];
    NSMutableArray * arr = [[NSMutableArray alloc] init];
    for (NSDictionary * dic in repostsArr) {
        WBTimeLineModel * model = [[WBTimeLineModel alloc] initWithDictionary:dic];
        [arr addObject:model];
    }

    return arr;
}

// 获取一条原创微博的最新转发微博的ID 
- (NSArray *)getStatusesRepost_Timeline_ids:(NSString *)Id{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/repost_timeline/ids.json?access_token=%@&id=%@",Access_Token,Id];
    
    NSDictionary * rootArr = [self getRootObject:str];
    
    return [rootArr objectForKey:@"statuses"];
}

// 获取双向关注用户的最新微博
- (NSArray *)getStatusesBilateral_Timeline{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/bilateral_timeline.json?access_token=%@",Access_Token];
    
    return [self getTimeLineArray:str];
}

// 获取最新的提到登录用户的微博列表，即@我的微博
- (NSArray *)getStatusesMentions{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/mentions.json?access_token=%@",Access_Token];
    
    return [self getTimeLineArray:str];
}

// 获取@当前用户的最新微博的ID
- (NSArray *)getStatusesMentions_Ids{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/mentions/ids.json?access_token=%@",Access_Token];
    
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"statuses"];
}

// 根据微博ID获取单条微博内容
- (WBTimeLineModel *)getStatusesShow:(NSString *)Id{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/show.json?access_token=%@&id=%@",Access_Token,Id];
    NSDictionary * rootDic = [self getRootObject:str];
    WBTimeLineModel * model = [[WBTimeLineModel alloc] initWithDictionary:rootDic];
    return model;
}

// 根据微博ID批量获取微博信息(未授权)
- (NSArray *)getStatusesShow_Batch:(NSString *)ids{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/show_batch.json?access_token=%@&ids=%@",Access_Token,ids];
    
    return [self getTimeLineArray:str];
}

// 通过微博（评论、私信）ID获取其MID
- (NSString *)getStatusesQuerymid:(NSString *)Id type:(NSInteger)type is_batch:(NSInteger)is_batch{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/querymid.json?access_token=%@&id=%@&type=%ld&is_batch=%ld",Access_Token,Id,type,is_batch];
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"mid"];
}

// 通过微博（评论、私信）MID获取其ID
- (NSString *)getStatusesQueryid:(NSString *)mid type:(NSInteger)type is_batch:(NSInteger)is_batch{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/queryid.json?access_token=%@&id=%@&type=%ld&is_batch=%ld",Access_Token,mid,type,is_batch];
    NSDictionary * rootDic = [self getRootObject:str];
    
    return [rootDic objectForKey:@"id"];
}

// 批量获取指定微博的转发数评论数
- (WBCounts )getStatusesCount:(NSString *)ids{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/count.json?access_token=%@&ids=%@",Access_Token,ids];
    NSArray * rootArr = [self getRootObject:str];
    NSDictionary * rootDic = [rootArr firstObject];
    WBCounts count ;
    count.ids = [[rootDic objectForKey:@"id"] integerValue];
    count.comments = [[rootDic objectForKey:@"comments"] integerValue];
    count.reposts = [[rootDic objectForKey:@"reposts"] integerValue];
    count.attitudes = [[rootDic objectForKey:@"attitudes"] integerValue];
    return count;
}

// 根据ID跳转到单条微博页
- (BOOL)getStatusesGo:(NSString *)uid Id:(NSString *)Id{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/go?access_token=%@&uid=%@&id=%@",Access_Token,uid,Id];
    return NO;
}

// 获取微博官方表情的详细信息
- (NSMutableArray *)getStatusesEmotions:(WBEmotionsType)type{
    
    NSString *str = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/emotions.json?access_token=%@&type=%ld",Access_Token,type];
    
    NSArray * rootArr = [self getRootObject:str];
    NSMutableArray *arr = [NSMutableArray new];
    for (NSDictionary * dic in rootArr) {
        WBEmotionsModel * model = [[WBEmotionsModel alloc] initWithDictionary:dic];
        [arr addObject:model];
    }
    return arr;
}

#pragma -mark- Post


// 转发一条微博
- (WBTimeLineModel *)postStatusesRepost:(NSInteger)Id Status:(NSString *)status Is_comment:(WBIs_Comment)is_comment{
    
    NSString *str = @"https://api.weibo.com/2/statuses/repost.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&id=%ld&status=%@&is_comment=%ld",Access_Token,Id,status,is_comment];
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBTimeLineModel alloc] initWithDictionary:rootDic];
}

// 删除微博信息
- (WBTimeLineModel *)postStatusesDestroy:(NSInteger)Id{
    
    NSString * str = @"https://api.weibo.com/2/statuses/destroy.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&id=%ld",Access_Token,Id];
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBTimeLineModel alloc] initWithDictionary:rootDic];
}
// 发布一条微博
- (WBTimeLineModel *)postStatusesUpdate:(NSString *)status Visible:(WBVisible)visible{
    
    NSString * str = @"https://api.weibo.com/2/statuses/update.json";
    
    NSString * post;
    if (visible.type == 3) {
        post = [NSString stringWithFormat:@"access_token=%@&status=%@&visible=%ld&list_id=%ld",Access_Token,status,visible.type,visible.list_id];
    }else{
        post = [NSString stringWithFormat:@"access_token=%@&status=%@&visible=%ld",Access_Token,status,visible.type];
    }
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBTimeLineModel alloc] initWithDictionary:rootDic];
}

- (WBTimeLineModel *)postStatusesUpload:(NSString *)status Visible:(WBVisible)visible Pic:(NSData *)pic{
    
    NSString * str = @"https://upload.api.weibo.com/2/statuses/upload.json";
    
    NSString * post;
    if (visible.type == 3) {
        post = [NSString stringWithFormat:@"access_token=%@&status=%@&visible=%ld&list_id=%ld&pic=%@",Access_Token,status,visible.type,visible.list_id,pic];
    }else{
        post = [NSString stringWithFormat:@"access_token=%@&status=%@&visible=%ld&pic=%@",Access_Token,status,visible.type,pic];
    }
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBTimeLineModel alloc] initWithDictionary:rootDic];
}

// 指定一个图片URL地址抓取后上传并同时发布一条新微博
- (WBTimeLineModel *)postStatusesUpload_Url_Text:(NSString *)status Visible:(WBVisible)visible Pic_id:(NSString *)pic_id Url:(NSURL *)url{
    
    NSString * str = @"https://api.weibo.com/2/statuses/upload_url_text.json";
    
    NSString * post;
    if (visible.type == 3) {
        post = [NSString stringWithFormat:@"access_token=%@&status=%@&visible=%ld&list_id=%ld&pic_id=%@&url=%@",Access_Token,status,visible.type,visible.list_id,pic_id,url];
    }else{
        post = [NSString stringWithFormat:@"access_token=%@&status=%@&visible=%ld&pic_id=%@&url=%@",Access_Token,status,visible.type,pic_id,url];
    }
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBTimeLineModel alloc] initWithDictionary:rootDic];
}

// 屏蔽某条微博
- (WBTimeLineModel *)postStatusesFilterCreate:(NSString *)status id:(NSInteger)Id{
    
    NSString * str = @"https://api.weibo.com/2/statuses/filter/create.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&id=%ld",Access_Token,Id];
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[WBTimeLineModel alloc] initWithDictionary:rootDic];
}

// 屏蔽某个@到我的微博以及后续由对其转发引起的@提及
- (BOOL)postStatusesMentionsShield:(NSInteger)Id Follow_up:(BOOL)follow_up{
    
    NSString * str = @"https://api.weibo.com/2/statuses/mentions/shield.json";
    
    NSString * post = [NSString stringWithFormat:@"access_token=%@&id=%ld&follow_up=%d",Access_Token,Id,follow_up];
    
    NSDictionary * rootDic = [self postRootObject:str postStr:post];
    
    return [[rootDic objectForKey:@"result"] boolValue];
}

@end
