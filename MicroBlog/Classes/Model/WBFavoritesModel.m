//
//  WBFavoritesModel.m
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBFavoritesModel.h"

@implementation WBFavoritesModel

- (id)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        self.status = dic[@"status"];
        self.favorited_time = dic[@"favorited_time"];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

- (void)setStatus:(NSObject *)status
{
    if ([status isKindOfClass:[NSDictionary class]]) {
        WBTimeLineModel *model = [[WBTimeLineModel alloc]initWithDictionary:(NSDictionary *)status];
        _status = model;
    }
    else {
        _status = (NSString *)status;
    }
}


@end
