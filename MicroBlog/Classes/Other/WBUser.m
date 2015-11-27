//
//  WBUser.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/23.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBUser.h"

static WBUser * wbuser = nil;
@implementation WBUser

+ (WBUser *)shareInstance{
    
    static dispatch_once_t onceChick;
    dispatch_once(&onceChick, ^{
        wbuser = [[WBUser alloc] init];
    });
    return wbuser;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceChick;
    dispatch_once(&onceChick, ^{
        wbuser = [super allocWithZone:zone];
    });
    return wbuser;
}

- (id)initWithUserID:(NSString *)userID UserPwd:(NSString *)userPwd{
    if (self = [super init]) {
        _userID = userID;
        _userPwd = userPwd;
    }
    return self;
}

- (NSString *)access_token{
    if (!_access_token) {
        _access_token = @"2.00lvUUQCPNmDmD0d1be015c8En9YJC";
    }
    return _access_token;
}

@end
