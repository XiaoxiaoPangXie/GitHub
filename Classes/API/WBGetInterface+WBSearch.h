//
//  WBGetInterface+WBSearch.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//
/** 
    搜索接口
 */
#import "WBGetInterface.h"
#import "WBTimeLineModel.h"

@interface WBGetInterface (WBSearch)

/** 学校信息 */
typedef struct{
    
    NSInteger ID;
    const char * school_name;
    NSInteger location;
    NSInteger type;
}WBSearchSchool;

typedef enum: NSUInteger{
    WBSchoolTypeCollege = 0,
    WBSchoolTypeHighSchool,
    WBSchoolTypeTechnicalSchool,
    WBSchoolTypeJuniorMiddleSchool,
    WBSchoolTypePrimarySchool
}WBSchoolType;

/** 用户信息 */
typedef struct{
    
    NSInteger uid;
    const char * screen_name;
    NSInteger followers_count;
}WBSearchUser;

/** App信息 */
typedef struct{
    
    NSInteger members_count;
    const char * apps_name;
}WBSearchApp;

/** 微博信息 */
typedef struct{
    
    NSInteger count;
    const char * suggestion;
}WBSearchStatus;

/** @对象信息 */
typedef struct{
    
    NSInteger uid;
    const char * nickname;
    const char * remark;
}WBSearchAt_User;

typedef enum : NSInteger{
    
    WBSearchAt_UserTypeAttention = 0, // 关注对象
    WBSearchAt_UserTypeFollower // 粉丝对象
}WBSearchAt_UserType;
#pragma -mark- get
/** 搜索学校时的联想搜索建议 */
- (NSArray *)getSearchSuggestions_Schools:(NSString *)p Type:(WBSchoolType)type;

/** 搜索用户时的联想搜索建议 */
- (NSArray *)getSearchSuggestions_Users:(NSString *)p;

/** 搜索公司时的联想搜索建议 */
- (NSArray *)getSearchSuggestions_Companies:(NSString *)p;

/** 搜索应用时的联想搜索建议 */
- (NSArray *)getSearchSuggestions_Apps:(NSString *)p;

/** 搜索微博时的联想搜索建议 */
- (NSArray *)getSearchSuggestions_Statuses:(NSString *)p;

/** @用户时的联想建议 */
- (NSArray *)getSearchSuggestions_At_Users:(NSString *)p Type:(WBSearchAt_UserType)type;

/** 搜索某一话题下的微博 高级接口（未授权） */
- (NSArray *)getSearchSuggestions_Topics:(NSString *)p;

@end
