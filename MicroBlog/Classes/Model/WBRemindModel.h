//
//  WBRemindModel.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBModel.h"

@interface WBRemindModel : WBModel

/** 新增微博数 */
@property(nonatomic,assign) NSInteger status;

/** 新粉丝数 */
@property(nonatomic,assign) NSInteger follower;

/** 新评论数 */
@property(nonatomic,assign) NSInteger cmt;

/** 新私信数 */
@property(nonatomic,assign) NSInteger dm;


@property(nonatomic,assign) NSInteger chat_group_pc;


@property(nonatomic,assign) NSInteger chat_group_client;

/** 新提及我的微博数 */
@property(nonatomic,assign) NSInteger mention_status;

/** 新提及我的评论数 */
@property(nonatomic,assign) NSInteger mention_cmt;

/** 微群消息未读数 */
@property(nonatomic,assign) NSInteger group;

/** 新新通知未读数 */
@property(nonatomic,assign) NSInteger notice;

/** 新邀请未读数 */
@property(nonatomic,assign) NSInteger invite;

/** 新勋章数 */
@property(nonatomic,assign) NSInteger badge;

/** 相册消息未读数 */
@property(nonatomic,assign) NSInteger photo;

/** 私有微群消息未读数 */
@property(nonatomic,assign) NSInteger private_group;

/** 所有提及我的微博数 */
@property(nonatomic,assign) NSInteger all_mention_status;

/** 关注的提及我的微博数 */
@property(nonatomic,assign) NSInteger attention_mention_status;

/** 所有 提及我的评论数 */
@property(nonatomic,assign) NSInteger all_mention_cmt;

/** 关注的提及我的评论数 */
@property(nonatomic,assign) NSInteger attention_mention_cmt;

/** 所有评论数 */
@property(nonatomic,assign) NSInteger all_cmt;

/** 关注的评论数 */
@property(nonatomic,assign) NSInteger attention_cmt;

/** 所有粉丝数 */
@property(nonatomic,assign) NSInteger all_follower;

/** 关注的粉丝数 */
@property(nonatomic,assign) NSInteger attention_follower;

@property(nonatomic,assign) NSInteger page_friends_to_me;

/** 聊天组的通知 */
@property(nonatomic,assign) NSInteger chat_group_notice;


@end
