//
//  DBSaveItem.h
//  Tomorrow
//
//  Created by sunmingming on 14-10-18.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBImageItem : NSObject

@property(nonatomic,assign) int myID;
//是否已购买
@property(nonatomic,strong) NSDate *imageDate;
//是否打开音乐
@property(nonatomic,strong) NSData *imageData;

-(id)init;

@end
