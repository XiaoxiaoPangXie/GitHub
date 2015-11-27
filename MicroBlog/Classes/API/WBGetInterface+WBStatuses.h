//
//  WBGetInterface+WBStatuses.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"
#import  "WBEmotionsModel.h"
#import "WBTimeLineModel.h"

@interface WBGetInterface (WBStatuses)

typedef struct{
    NSInteger  ids;
    NSInteger comments;
    NSInteger reposts;
    NSInteger attitudes;
}WBCounts;

typedef enum: NSUInteger{
    WBIs_CommentNone = 0,
    WBIs_CommentCurrent,
    WBIs_CommentPrimary,
    WBIs_CommentBoth
}WBIs_Comment;

#pragma -mark- GET
/** 获取最新公共微博 */
- (NSArray *)getStatusesPublic_Timeline;

/** 获取当前登录用户及其所关注用户的最新微博 */
- (NSArray *)getStatusesFriends_Timeline;

/** 获取当前登录用户及其所关注用户的最新微博 */
- (NSArray *)getStatusesHome_Timeline;

/** 获取当前登录用户及其所关注用户的最新微博的ID  */
- (NSArray *)getStatusesFriends_Timeline_ids;

/** 获取用户发布的微博 */
- (NSArray *)getStatusesUser_Timeline;

/** 获取用户发布的微博的ID  */
- (NSArray *)getStatusesUser_Timeline_ids;

/** 批量获取指定的一批用户的微博列表(高级请求，权限不够)  */
- (NSArray *)getStatusesTimeline_Batch;

/** 返回一条原创微博的最新转发微博 */
- (NSArray *)getStatusesRepost_Timeline:(NSString *)Id;

/** 获取一条原创微博的最新转发微博的ID   */
- (NSArray *)getStatusesRepost_Timeline_ids:(NSString *)Id;

/** 获取最新的提到登录用户的微博列表，即@我的微博  */
- (NSArray *)getStatusesMentions;

/** 获取@当前用户的最新微博的ID */
- (NSArray *)getStatusesMentions_Ids;

/** 获取双向关注用户的最新微博 */
- (NSArray *)getStatusesBilateral_Timeline;

/** 根据微博ID获取单条微博内容 (未验证)*/
- (WBTimeLineModel *)getStatusesShow:(NSString *)Id;

/** 根据微博ID批量获取微博信息 (高级请求，权限不够)*/
- (NSArray *)getStatusesShow_Batch:(NSString *)ids;

/** 通过id获取mid */
- (NSString *)getStatusesQuerymid:(NSString *)Id type:(NSInteger)type is_batch:(NSInteger)is_batch;

/** 通过微博（评论、私信）MID获取其ID  */
- (NSString *)getStatusesQueryid:(NSString *)mid type:(NSInteger)type is_batch:(NSInteger)is_batch;

/** 批量获取指定微博的转发数评论数 */
- (WBCounts )getStatusesCount:(NSString *)ids;

/** 根据ID跳转到单条微博页(APi暂时不存在)  */
- (BOOL)getStatusesGo:(NSString *)uid Id:(NSString *)Id;

/** 获取微博官方表情的详细信息 */
- (NSArray *)getStatusesEmotions:(WBEmotionsType)type;

#pragma -mark- POST

/** 转发一条微博 (报错)*/
- (WBTimeLineModel *)postStatusesRepost:(NSInteger)Id Status:(NSString *)status Is_comment:(WBIs_Comment)is_comment;

/** 删除微博信息 */
- (WBTimeLineModel *)postStatusesDestroy:(NSInteger)Id;

/** 发布一条新微博 */
- (WBTimeLineModel *)postStatusesUpdate:(NSString *)status Visible:(WBVisible)visible;

/** 上传图片并发布一条新微博  */
- (WBTimeLineModel *)postStatusesUpload:(NSString *)status Visible:(WBVisible)visible Pic:(NSData *)pic;

/** 指定一个图片URL地址抓取后上传并同时发布一条新微博 (高级接口，未授权)*/
- (WBTimeLineModel *)postStatusesUpload_Url_Text:(NSString *)status Visible:(WBVisible)visible Pic_id:(NSString *)pic_id Url:(NSURL *)url ;

/** 屏蔽某条微博 (高级接口，未授权)*/
- (WBTimeLineModel *)postStatusesFilterCreate:(NSString *)status id:(NSInteger)Id;

/** 屏蔽某个@到我的微博以及后续由对其转发引起的@提及 (高级接口，未授权) */
- (BOOL)postStatusesMentionsShield:(NSInteger)Id Follow_up:(BOOL)follow_up;

@end
