//
//  WBGetInterface+WBGetAccount.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"

@interface WBGetInterface (WBGetAccount)

typedef enum: NSUInteger{
    WBSchoolTypeCollege = 0,
    WBSchoolTypeHighSchool,
    WBSchoolTypeTechnicalSchool,
    WBSchoolTypeJuniorMiddleSchool,
    WBSchoolTypePrimarySchool
}WBSchoolType;

typedef struct{
    NSInteger ID;
    const char * name;
    
}WBSchoolData;

/** 获取所有的学校列表 */
- (NSArray *)getAccountProfileSchool_listWithKeyword:(NSString *)keyword Type:(WBSchoolType)type;
- (NSArray *)getAccountProfileSchool_listWithCapital:(NSString *)capital Province:(NSInteger)province Type:(WBSchoolType)type;

/** OAuth授权之后，获取授权用户的UID */

- (NSString *)getAccountGet_UID;

/** 获取用户的联系邮箱 高级接口（未授权） */
- (NSString *)getAccountProfile_Email;

@end
