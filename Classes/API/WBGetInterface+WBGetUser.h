//
//  WBGetInterface+WBGetUser.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"

#import "WBUserModel.h"
@interface WBGetInterface (WBGetUser)

typedef struct{
    NSInteger  ids;
    NSInteger private_friends_count;
    NSInteger followers_count;
    NSInteger friends_count;
    NSInteger statuses_count;
    NSInteger pagefriends_count;
}WBCounts;

#pragma -mark- Get
/** 根据用户ID获取用户信息  */
- (WBUserModel *)getUserShowWithId:(NSInteger)uid;
- (WBUserModel *)getUserShowWithName:(NSString *)screen_name;

/** 通过个性化域名获取用户资料以及用户最新的一条微博  */
- (WBUserModel *)getUserDomain_Show:(NSString *)domain;

/** 批量获取用户的粉丝数、关注数、微博数  */
- (WBCounts)getUserCounts:(NSString *)uids;
@end
