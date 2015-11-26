//
//  WBGetInterface.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBGetInterface.h"

@implementation WBGetInterface

static WBGetInterface * api = nil;

+ (WBGetInterface *)shareInstance{
    
    static dispatch_once_t onceCheck;
    dispatch_once(&onceCheck, ^{
        api = [[WBGetInterface alloc] init];
    });
    return api;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceCheck;
    dispatch_once(&onceCheck, ^{
        api = [super allocWithZone:zone];
    });
    return api;
}


@end
