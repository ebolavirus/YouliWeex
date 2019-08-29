//
//  DBSaveItem.m
//  Tomorrow
//
//  Created by sunmingming on 14-10-18.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import "DBSaveItem.h"

@implementation DBSaveItem

- (id)init
{
	self = [super init];
	if (self) {
		self.myID = 1;
		self.bought = NO;
		self.story = YES;
		self.day = 0;
		self.gold = 0;
		self.life = 100;
		self.love = 100;
	}
	return self;
}

-(void)resetData {
	self.day = 0;
	self.gold = 0;
	self.life = 100;
	self.love = 100;
}


+(LKDBHelper *)getUsingLKDBHelper
{
	/// this is a demo
	static LKDBHelper* db;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		db = [[LKDBHelper alloc] init];
	});
	return db;
}

//在类 初始化的时候
+(void)initialize
{
	//enable the column binding property name
	//    [self setTableColumnName:@"id" bindingPropertyName:@"pid"];
}

//主键
+(NSString *)getPrimaryKey
{
	return @"myID";
}

//表名
+(NSString *)getTableName
{
	return @"Save";
}

//表版本
+(int)getTableVersion
{
	return 1;
}


@end
