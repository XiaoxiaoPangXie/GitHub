//
//  WBCommentsModel.h
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBUserModel.h"
#import "WBTimeLineModel.h"

@interface WBCommentsModel : WBModel

/** 评论创建时间 */
@property(nonatomic,copy)NSString *created_at;

/** 评论id */
@property(nonatomic,assign)NSInteger Id;

/** 评论内容 */
@property(nonatomic,copy)NSString *text;

/** 是否可以评论 */
@property(nonatomic,assign)BOOL source_allowclick;

/** 评论来源类型 */
@property(nonatomic,assign)NSInteger source_type;

/** 评论来源 */
@property(nonatomic,copy)NSString *source;

/** 评论作者的用户信息字段 */
@property(nonatomic,strong)WBUserModel *user;

/** 评论的mid */
@property(nonatomic,copy)NSString *mid;

/** 字符串型的评论ID */
@property(nonatomic,copy)NSString *idstr;

/** 评论的微博信息字段 */
@property(nonatomic,strong)WBTimeLineModel *status;

/** floor_num */
@property(nonatomic,assign)NSInteger floor_num;

/** 评论来源评论，当本评论属于对另一评论的回复时返回此字段 */
@property(nonatomic,strong)NSObject *reply_comment;


@end
