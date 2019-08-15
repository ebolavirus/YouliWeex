//
//  DBCacheItem.h
//  Tomorrow
//
//  Created by sunmingming on 14/12/1.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import <Foundation/Foundation.h>
//该变量不用于存储数据库，只用于存储appdelegate中的临时全局变量
@interface DBCacheItem : NSObject
//最大关卡数
@property(nonatomic,assign) NSInteger myLevel;
//最大小关卡数
@property(nonatomic,assign) NSInteger myState;
//是否打开音乐
@property(nonatomic,assign) Boolean myMusic;
//是否旋转
@property(nonatomic,assign) BOOL isRotate;
//是否锯齿
@property(nonatomic,assign) BOOL isEdge;
//是否显示背景
@property(nonatomic,assign) BOOL isTip;
//拼图数量
@property(nonatomic,assign) NSInteger countNum;

-(id)init;

@end
