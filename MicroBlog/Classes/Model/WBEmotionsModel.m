//
//  WBEmotionsModel.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBEmotionsModel.h"

@implementation WBEmotionsModel

- (id)initWithDictionary:(NSDictionary *)dic{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
