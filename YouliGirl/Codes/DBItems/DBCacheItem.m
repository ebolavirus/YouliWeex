//
//  DBCacheItem.m
//  Tomorrow
//
//  Created by sunmingming on 14/12/1.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import "DBCacheItem.h"

@implementation DBCacheItem

@synthesize myLevel,myState;

- (id)init
{
	self = [super init];
	if (self) {
		self.myMusic = YES;
		self.isRotate = YES;
		self.isEdge = YES;
		self.isTip = YES;
		self.countNum = 3;
	}
	return self;
}

@end

