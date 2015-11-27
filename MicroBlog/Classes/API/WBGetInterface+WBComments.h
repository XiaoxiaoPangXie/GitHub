//
//  WBGetInterface+WBComments.h
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"
#import "WBTimeLineModel.h"
#import "WBUserModel.h"
#import "WBCommentsModel.h"

@interface WBGetInterface (WBComments)

#pragma -mark- Get
/** 获取某条微博的评论列表 */
- (NSMutableArray *)getComments_show:(NSString *)ID;

/** 我发出的评论列表 */
- (NSMutableArray *)getComments_by_me;

/** 我收到的评论列表 */
- (NSMutableArray *)getComments_to_me;

/** 获取用户发送及收到的评论列表 */
- (NSMutableArray *)getComments_timeline;

/** 获取@到我的评论 */
- (NSMutableArray *)getComments_mentions;

/** 批量获取评论内容 */
- (NSMutableArray *)getComments_show_batch:(NSString *)cids;

#pragma -mark- Post
/** 评论一条微博 */
- (WBCommentsModel *)postComments_create:(NSString*)Id Comment:(NSString*)comment Comment_ori:(BOOL)comment_ori;

/** 删除一条评论 */
- (WBCommentsModel *)postComments_destroy:(NSString *)cid;

/** 批量删除评论 */
- (NSArray *)postComments_destroy_batch:(NSString *)cids;

/** 回复一条评论 */
- (WBCommentsModel *)postComments_reply:(NSString *)Id Cid:(NSString *)cid Comment:(NSString *)comment Without_mention:(BOOL)without_mention Comment_ori:(BOOL)comment_ori;//Id:微博id，Cid：评论id



@end
