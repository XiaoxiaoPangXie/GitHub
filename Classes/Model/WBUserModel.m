//
//  WBUserModel.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBUserModel.h"

@implementation WBUserModel

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
    if ([key isEqualToString:@"description"]) {
        _descriptions = value;
    }
    if ([key isEqualToString:@"class"]) {
        _Class = [value integerValue];
    }
}

- (NSObject *)status{
    if (!_status) {
        return nil;
    }else{
        return _status;
    }
}
@end
