//
//  WBTimeLineModel.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBTimeLineModel.h"

@implementation WBTimeLineModel

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

- (void)setRetweeted_status:(WBTimeLineModel *)retweeted_status{
    if ([retweeted_status isKindOfClass:[NSDictionary class]]) {
        WBTimeLineModel * model = [[WBTimeLineModel alloc] initWithDictionary:(NSDictionary *)retweeted_status];
        _retweeted_status = model;
    }
}
@end
