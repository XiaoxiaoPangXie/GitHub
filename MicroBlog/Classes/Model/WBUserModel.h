//
//  WBUserModel.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//
/** 用户模型 */
#import "WBModel.h"

@interface WBUserModel : WBModel

/** 用户UID */
@property(nonatomic,assign) NSInteger Id;

/** 字符串型的用户UID */
@property(nonatomic,copy) NSString * idstr;

/** 种类 */
@property(nonatomic,assign) NSInteger Class;

/** 用户昵称 */
@property(nonatomic,copy) NSString * screen_name;

/** 友好显示名称(好友备注名称) */
@property(nonatomic,copy) NSString * name;

/** 用户所在省级ID */
@property(nonatomic,assign) NSInteger province;

/** 用户所在城市ID */
@property(nonatomic,assign) NSInteger city;

/** 用户所在地 */
@property(nonatomic,copy) NSString * location;

/** 用户个人描述 */
@property(nonatomic,copy) NSString * descriptions;

/** 用户博客地址 */
@property(nonatomic,copy) NSString * url;

/** 用户头像地址（中图），50×50像素 */
@property(nonatomic,copy) NSString * profile_image_url;

/** 用户的微博统一URL地址 */
@property(nonatomic,copy) NSString *  profile_url;

/** 用户的个性化域名 */
@property(nonatomic,copy) NSString * domain;

/** 用户的微号 */
@property(nonatomic,copy) NSString * weihao;

/** 性别，m：男、f：女、n：未知 */
@property(nonatomic,copy) NSString * gender;

/** 粉丝数 */
@property(nonatomic,assign) NSInteger followers_count;

/** 关注数 */
@property(nonatomic,assign) NSInteger friends_count;

/** 好友页数 */
@property(nonatomic,assign) NSInteger pagefriends_count;

/** 微博数 */
@property(nonatomic,assign) NSInteger statuses_count;

/** 收藏数 */
@property(nonatomic,assign) NSInteger favourites_count;

/** 用户创建（注册）时间 */
@property(nonatomic,copy) NSString * created_at;

/** 暂未支持 */
@property(nonatomic,assign) BOOL following;

/** 是否允许所有人给我发私信，true：是，false：否 */
@property(nonatomic,assign) BOOL  allow_all_act_msg;

/** 是否允许标识用户的地理位置，true：是，false：否 */
@property(nonatomic,assign) BOOL geo_enabled;

/** 是否是微博认证用户，即加V用户，true：是，false：否 */
@property(nonatomic,assign) BOOL verified;

/** 暂未支持 */
@property(nonatomic,assign) NSInteger verified_type;

/** 用户备注信息，只有在查询用户关系时才返回此字段 */
@property(nonatomic,copy) NSString * remark;

@property(nonatomic,assign) NSInteger ptype;

/** 用户的最近一条微博信息字段 详细(有时没有该属性) */
@property(nonatomic,retain) NSObject * status;

/** 是否允许所有人对我的微博进行评论，true：是，false：否 */
@property(nonatomic,assign) BOOL allow_all_comment;

/** 用户头像地址（大图），180×180像素 */
@property(nonatomic,copy) NSString * avatar_large;

/** 用户头像地址（高清），高清头像原图 */
@property(nonatomic,copy) NSString * avatar_hd;

/** 认证原因 */
@property(nonatomic,copy) NSString * verified_reason;

@property(nonatomic,copy) NSString * verified_trade;

@property(nonatomic,copy) NSString * verified_reason_url;

@property(nonatomic,copy) NSString * verified_source;

@property(nonatomic,copy) NSString * verified_source_url;

/** 该用户是否关注当前登录用户，true：是，false：否 */
@property(nonatomic,assign) BOOL follow_me;

/** 用户的在线状态，0：不在线、1：在线 */
@property(nonatomic,assign) BOOL online_stauts;

/** 用户的互粉数 */
@property(nonatomic,assign) NSInteger bi_followers_count;

/** 用户当前的语言版本，zh-cn：简体中文，zh-tw：繁体中文，en：英语 */
@property(nonatomic,assign) NSString * lang;

/** 等级 */
@property(nonatomic,assign) NSInteger star;

@property(nonatomic,assign) NSInteger mbtype;

@property(nonatomic,assign) NSInteger mbrank;

@property(nonatomic,assign) NSInteger block_word;

@property(nonatomic,assign) NSInteger block_app;

/** 标签 */
@property(nonatomic,assign) NSString * ability_tags;

@property(nonatomic,assign) NSInteger credit_score;

/** 用户能力 */
@property(nonatomic,assign) NSInteger user_ability;

@property(nonatomic,assign) NSInteger urank;

/** vip等级 */
@property(nonatomic,assign) NSString * cardid;

@end

