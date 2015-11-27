//
//  WBFavoritesModel.h
//  MicroBlog
//
//  Created by 高冷小螃蟹 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBModel.h"
#import "WBTimeLineModel.h"

@interface WBFavoritesModel : WBModel

//typedef struct{
//    
//    NSInteger Id;
//    const char *tag;
//    NSInteger count;
//    
//}Tags;

/** 收藏的微博信息 */
@property(nonatomic,strong)NSObject *status;

/** 收藏的微博的收藏时间 */
@property(nonatomic,copy)NSString *favorited_time;

@end
