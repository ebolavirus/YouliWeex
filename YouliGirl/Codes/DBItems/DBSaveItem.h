//
//  DBSaveItem.h
//  Tomorrow
//
//  Created by sunmingming on 14-10-18.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBSaveItem : NSObject

@property(nonatomic,assign) NSInteger myID;
//当前天数
@property(nonatomic,assign) int day;
//当前金额余额
@property(nonatomic,assign) int gold;
//当前活力
@property(nonatomic,assign) int life;
//当前好感
@property(nonatomic,assign) int love;
//是否已购买
@property(nonatomic,assign) Boolean bought;
//是否是纯文本模式
@property(nonatomic,assign) Boolean story;

-(id)init;
-(void)resetData;

@end
