//
//  WBGetInterface+WBGetFavorites.h
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"
#import "WBTimeLineModel.h"
#import "WBFavoritesModel.h"


@interface WBGetInterface (WBGetFavorites)

//typedef struct{
//    
//    NSInteger Id;
//    const char *tag;
//    NSInteger count;
//    
//}tags;

/** 获取当前用户的收藏列表 */
- (NSArray *)getFavorites;

/** 获取当前用户的收藏列表的ID */
- (NSArray *)getFavorites_ids;

/** 获取单条收藏信息 */
- (WBTimeLineModel *)getFavorites_show:(NSString *)Id;//Id:需要查询的收藏ID

/** 获取当前用户某个标签下的收藏列表 */
//- (NSArray *)getFavorites_by_tags:(NSString *)tid;//需要查询的标签ID

/** 当前登录用户的收藏标签列表 */
//- (NSArray *)getFavorites_tags;

/** 获取当前用户某个标签下的收藏列表的ID */
//- (NSArray *)getFavorites_by_tags_ids:(NSString *)tid;//需要查询的标签ID

/** 添加收藏 */
- (WBTimeLineModel *)getFavorites_create:(NSString *)Id;//要收藏的微博的ID

/** 删除收藏 */
- (WBTimeLineModel *)getFavorites_destroy:(NSString *)Id;//要取消收藏的微博ID

/** 批量删除收藏 */
- (BOOL)getFavorites_destroy_batch:(NSString *)ids;//要取消收藏的收藏ID

/** 更新收藏标签 */
//- (NSArray *)getFavorites_Favorites_tags_update:(NSString *)Id Tags:(NSString *)tags;

/** 更新当前用户所有收藏下的指定标签 */
//- (NSArray *)getFavorites_Favorites_update_batch:(NSString *)tid Tag:(NSString *)tag;

/** 删除当前用户所有收藏下的指定标签 */
//- (BOOL)getFavorites_tags_destroy_batch:(NSString *)tid;

@end
