//
//  tooles.h
//  huoche
//
//  Created by kan xu on 11-1-22.
//  Copyright 2011 paduu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FlatUIKit.h>

@protocol GameDelegate<NSObject>
@optional
- (void)gotoNextScene:(NSString*)aSucc;
@end

@interface gameengine : NSObject

@property(nonatomic,strong) NSArray *kGameArray;
@property(nonatomic,assign) id<GameDelegate> myGameDelegate;

- (id)init;
- (void)setTimeLabel:(UILabel*)timeLabel
				andGoldLabel:(UILabel*)goldLabel
				andLifeLabel:(UILabel*)lifeLabel
			andBgImageView:(UIImageView*)bgImageView
		andBodyImageView:(UIImageView*)bodyImageView
		andFaceImageView:(UIImageView*)faceImageView
				andTalkLabel:(UITextView*)talkLabel
			 andTalkButton:(FUIButton*)talkButton
				 andMainView:(UIViewController*)mainView;
- (void)loadScript:(NSInteger)aScriptFlag;
- (void)fire;
- (void)gotoNext;
- (int)getNextNumberAfter:(int)aDay;

@end
