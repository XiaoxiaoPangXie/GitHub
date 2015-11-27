//
//  WBUser.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/23.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBUser : NSObject
{
    NSString * _userID;
    NSString * _userPwd;
}

@property(nonatomic,copy) NSString * access_token;


+ (WBUser *)shareInstance;

- (id)initWithUserID:(NSString *)userID UserPwd:(NSString *)userPwd;

@end
