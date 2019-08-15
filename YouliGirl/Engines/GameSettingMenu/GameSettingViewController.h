//
//  GameNextLevelView.h
//  Tomorrow
//
//  Created by sunmingming on 14/11/14.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameSettingDelegate<NSObject>

-(void)backPressed:(id)sender;
-(void)nextPressed:(id)sender;

@end

@interface GameSettingViewController : UIViewController

-(instancetype)initWithDelegate:(id<GameSettingDelegate>)delegate;

@end
