//
//  WBGetInterface+WBRemind.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"
#import "WBRemindModel.h"

@interface WBGetInterface (WBRemind)



#pragma -mark- GET
/** 获取某个用户的各种消息未读数 */
- (WBRemindModel *)getRemindUnread_Count;

#pragma -mark - POST
/** 对当前登录用户某一种消息未读数进行清零 高级接口（未授权） */
- (BOOL)postRemindSet_Count:(NSString *)type;
@end
