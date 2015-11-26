//
//  WBCommentsModel.m
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBCommentsModel.h"

@implementation WBCommentsModel

- (id)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
    if ([key isEqualToString:@"id"]) {
        _Id = [value integerValue];
    }
}

- (void)setUser:(WBUserModel *)user{
    if ([user isKindOfClass:[NSDictionary class]]) {
        WBUserModel *model = [[WBUserModel alloc] initWithDictionary:(NSDictionary *)user];
        _user = model;
    }
}

- (void)setstatus:(WBTimeLineModel *)status{
    if ([status isKindOfClass:[NSDictionary class]]) {
        WBTimeLineModel * model = [[WBTimeLineModel alloc] initWithDictionary:(NSDictionary *)status];
        _status = model;
    }
}

@end
