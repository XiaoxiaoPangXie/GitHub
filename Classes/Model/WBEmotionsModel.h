//
//  WBEmotionsModel.h
//  MicroBlog
//
//  Created by Ibokan on 15/11/24.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

/** 表情模型 */
#import "WBModel.h"

typedef enum : NSUInteger {
    WBEmotionsTypeFace = 0,
    WBEmotionsTypeAni,
    WBEmotionsTypeCartoon,
} WBEmotionsType;

@interface WBEmotionsModel : WBModel

/** 表情名称 */
@property(nonatomic,copy) NSString * phrase;

/** 表情类型 */
@property(nonatomic,assign) WBEmotionsType face;

/** 大表情图片地址 */
@property(nonatomic,copy) NSString * url;

/** 是否很火 */
@property(nonatomic,assign) BOOL hot;

/** 是否是共有的 */
@property(nonatomic,assign) BOOL common;

/** 小图标地址 */
@property(nonatomic,copy) NSString * icon;

/** 种类 */
@property(nonatomic,copy) NSString * category;

/** 值 */
@property(nonatomic,copy) NSString * value;

/** 表情ID */
@property(nonatomic,copy) NSString * picid; 


@end


