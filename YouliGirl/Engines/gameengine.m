//
//  tooles.m
//  huoche
//
//  Created by kan xu on 11-1-22.
//  Copyright 2011 paduu. All rights reserved.
//

#import "gameengine.h"
#import "stories.h"

@interface gameengine ()
//1级
@property (nonatomic, assign) NSInteger avg0Index;
//2级
@property (nonatomic, assign) NSInteger avg1Index;
@property (nonatomic, strong) NSArray *scriptArray;

@property(nonatomic,weak) UILabel *timeLabel;
@property(nonatomic,weak) UILabel *goldLabel;
@property(nonatomic,weak) UILabel *lifeLabel;
@property(nonatomic,weak) UIImageView *bgImageView;
@property(nonatomic,weak) UIImageView *bodyImageView;
@property(nonatomic,weak) UIImageView *faceImageView;
@property(nonatomic,weak) UITextView *talkLabel;
@property(nonatomic,weak) UIViewController *mainViewController;

@end

@implementation gameengine

- (id)init
{
	self = [super init];
	if (self) {
		self.avg0Index = 0;
		self.avg1Index = 0;
	}
	return self;
}

- (void)setTimeLabel:(UILabel*)timeLabel
				andGoldLabel:(UILabel*)goldLabel
				andLifeLabel:(UILabel*)lifeLabel
			andBgImageView:(UIImageView*)bgImageView
		andBodyImageView:(UIImageView*)bodyImageView
		andFaceImageView:(UIImageView*)faceImageView
				andTalkLabel:(UITextView*)talkLabel
				 andMainView:(UIViewController*)mainView{
	self.timeLabel = timeLabel;
	self.goldLabel = goldLabel;
	self.lifeLabel = lifeLabel;
	self.bgImageView = bgImageView;
	self.bodyImageView = bodyImageView;
	self.faceImageView = faceImageView;
	self.talkLabel = talkLabel;
	self.mainViewController = mainView;
}

- (void)loadScript:(NSInteger)aScriptFlag {
	self.scriptArray = [stories loadStoryByDayFlag:aScriptFlag];
	self.avg0Index = 0;
	self.avg1Index = 0;
}

- (void)fire {
	if ([self.scriptArray count] <= 0) {
		[SVProgressHUD showErrorWithStatus:@"读取脚本错误"];
		return;
	}
	[self runGameFrame];
}

- (void)runGameFrame {
	NSArray *flagArray = (NSArray*)[self.scriptArray objectAtIndex:self.avg0Index];
	if ([(NSString*)[flagArray objectAtIndex:0] hasPrefix:@"dialog"]) {
		[self makeDialog:flagArray];
	}
}

- (void)gotoNext {
	self.avg1Index++;
	[self runGameFrame];
}

- (void)makeDialog:(NSArray*)dialogArray {
	NSString *title = [[dialogArray objectAtIndex:0] substringFromIndex:7];
//	[string componentsSeparatedByString:@"-"]
	NSArray *choice1 = [[dialogArray objectAtIndex:1] componentsSeparatedByString:@"-"];
	NSArray *choice2 = [[dialogArray objectAtIndex:2] componentsSeparatedByString:@"-"];
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:title preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *action1 = [UIAlertAction actionWithTitle:[choice1 objectAtIndex:0] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		//DO NOTHING
	}];
	UIAlertAction *action2 = [UIAlertAction actionWithTitle:[choice2 objectAtIndex:0] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		//DO NOTHING
	}];
	[vc addAction:action1];
	[vc addAction:action2];
	[self.mainViewController presentViewController:vc animated:NO completion:nil];
}

@end
