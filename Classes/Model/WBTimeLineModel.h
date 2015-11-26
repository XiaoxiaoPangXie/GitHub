//
//  WBTimeLineModel.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//


#import "WBModel.h"
#import "WBUserModel.h"
/** 微博模型 */
@interface WBTimeLineModel : WBModel
typedef struct{
    NSInteger type;
    NSInteger list_id;
}WBVisible;

/** 微博创建时间 */
@property(nonatomic,copy) NSString * created_at;

/** 微博ID */
@property(nonatomic,assign) NSInteger  Id;

/** 微博MID */
@property(nonatomic,copy) NSString * mid;

/** 字符串型的微博ID */
@property(nonatomic,copy) NSString * idstr;

/** 微博信息内容 */
@property(nonatomic,copy) NSString * text;

@property(nonatomic,assign) NSInteger source_allowclick;

@property(nonatomic,assign) NSInteger source_type; // 微博类型，1为原创，2为转发

@property(nonatomic,assign) NSInteger * page_type;

@property(nonatomic,copy) NSString * source; // 微博来源

@property(nonatomic,assign) BOOL favorited; // 是否已收藏，true：是，false：否

@property(nonatomic,assign) BOOL truncated; // 是否被截断，true：是，false：否

@property(nonatomic,copy) NSString * in_reply_to_status_id; // （暂未支持）回复ID

@property(nonatomic,copy) NSString * in_reply_to_user_id; // (暂未支持）回复人UID

@property(nonatomic,copy) NSString * in_reply_to_screen_name; // 暂未支持）回复人昵称

@property(nonatomic,retain) NSArray * pic_urls; // 所以获取缩略图片地址

@property(nonatomic,copy) NSString * thumbnail_pic; // 缩略图片地址，没有时不返回此字段

@property(nonatomic,copy) NSString * bmiddle_pic; // 中等尺寸图片地址，没有时不返回此字段

@property(nonatomic,copy) NSString * original_pic; // 原始图片地址，没有时不返回此字段

@property(nonatomic,retain) NSObject * geo; // 地理信息字段 详细

@property(nonatomic,retain) WBUserModel * user; // 微博作者的用户信息字段 详细

@property(nonatomic,retain) WBTimeLineModel * retweeted_status; // 被转发的原微博信息字段，当该微博为转发微博时返回 详细

@property(nonatomic,retain) NSArray * annotations;

@property(nonatomic,assign) NSInteger reposts_count; // 转发数
    
@property(nonatomic,assign) NSInteger comments_count; // 评论数

@property(nonatomic,assign) NSInteger attitudes_count; // 表态数

@property(nonatomic,assign) BOOL isLongText; // 是否是长微博

@property(nonatomic,assign) NSInteger mlevel; // 暂未支持

@property(nonatomic,assign) WBVisible visible; // 微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号

@property(nonatomic,assign) NSInteger biz_feature;

@property(nonatomic,retain) NSArray * darwin_tags;

@property(nonatomic,copy) NSString * rid;

@property(nonatomic,assign) NSInteger userType;

@property(nonatomic,copy) NSString * cardid;

//@property(nonatomic,retain) NSObject * pic_ids; // 微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。

@end
