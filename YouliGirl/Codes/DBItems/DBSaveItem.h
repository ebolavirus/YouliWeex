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
//是否已购买
@property(nonatomic,assign) Boolean myBought;

-(id)init;

@end
