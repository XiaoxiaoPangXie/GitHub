//
//  WBGetInterface+WBFriendships.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"

#import "WBUserModel.h"
@interface WBGetInterface (WBFriendships)

typedef struct{
    
    const char *screen_name;
    BOOL followed_by;
    BOOL following;
    NSInteger ID;
    BOOL notifications_enabled;
    
}WBFriendsShow;

#pragma -mark- GetFriends
/** 获取用户的关注列表 用户ID*/
- (NSArray *)getFriendShipFriends:(NSInteger)uid;

/** 获取用户关注的用户UID列表  */
- (NSArray *)getFriendShipFriends_Ids;

/** 获取两个用户之间的共同关注人列表 用户ID*/
- (NSArray *)getFriendShipFriendsIn_Common:(NSInteger)uid;

/** 获取用户的双向关注列表，即互粉列表  */
- (NSArray *)getFriendShipFriendsBilateral;

/** 获取用户双向关注的用户ID列表，即互粉UID列表 */
- (NSArray *)getFriendShipFriendsBilateral_Ids;

#pragma -mark- GetFollowers
/** 获取用户的粉丝列表 用户ID */
- (NSArray *)getFriendShipFollowers:(NSInteger)uid;

/** 获取用户粉丝的用户UID列表  */
- (NSArray *)getFriendShipFollowers_Ids;

/** 获取用户的活跃粉丝列表 用户ID */
- (NSArray *)getFriendShipFollowersActive:(NSInteger)uid;

#pragma -mark- GetFriends_Chain
/** 获取当前登录用户的关注人中又关注了指定用户的用户列表 用户ID */
- (NSArray *)getFriendShipFriends_ChainFollowers:(NSInteger)uid;

#pragma -mark- GetShow
/** 获取两个用户之间的详细关注关系情况  */
- (NSDictionary *)getFriendShipShowWithID:(NSInteger)target_id;
- (NSDictionary *)getFriendShipShowWithName:(NSString *)target_screen_name;

#pragma -mark- Post
/** 关注一个用户 高级接口 （未授权）*/
- (WBUserModel *)postFriendshipsCreateWithID:(NSInteger)uid;
- (WBUserModel *)postFriendshipsCreateWithName:(NSString *)screen_name;

/** 取消关注一个用户 高级接口 （未授权）*/
- (WBUserModel *)postFriendshipsDestroyWithID:(NSInteger)uid;
- (WBUserModel *)postFriendshipsDestroyWithName:(NSString *)screen_name;

@end
