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
@property (nonatomic, weak)   NSArray *storyArray;

@property(nonatomic,weak) UILabel *timeLabel;
@property(nonatomic,weak) UILabel *goldLabel;
@property(nonatomic,weak) UILabel *lifeLabel;
@property(nonatomic,weak) UIImageView *bgImageView;
@property(nonatomic,weak) UIImageView *bodyImageView;
@property(nonatomic,weak) UIImageView *faceImageView;
@property(nonatomic,weak) UITextView *talkLabel;
@property(nonatomic,weak) FUIButton *talkButton;
@property(nonatomic,weak) UIViewController *mainViewController;

@end

@implementation gameengine

- (id)init
{
	self = [super init];
	if (self) {
		self.kGameArray = @[@0,@10,@19,@39,@69,@70,@119,@159,@209,@239,@240,@259,@270,@279,@299];
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
			 andTalkButton:(FUIButton*)talkButton
				 andMainView:(UIViewController*)mainView{
	self.timeLabel = timeLabel;
	self.goldLabel = goldLabel;
	self.lifeLabel = lifeLabel;
	self.bgImageView = bgImageView;
	self.bodyImageView = bodyImageView;
	self.faceImageView = faceImageView;
	self.talkLabel = talkLabel;
	self.talkButton = talkButton;
	self.mainViewController = mainView;
}

- (void)loadScript:(NSInteger)aScriptFlag {
	self.scriptArray = [stories loadStoryByDayFlag:aScriptFlag];
	self.avg0Index = 0;
	self.avg1Index = 0;
	self.storyArray = (NSArray*)[self.scriptArray objectAtIndex:self.avg0Index];
}

- (void)fire {
	if ([self.scriptArray count] <= 0) {
		[SVProgressHUD showErrorWithStatus:@"读取脚本错误"];
		return;
	}
	[self runGameFrame];
}

- (void)runGameFrame {
	if ([(NSString*)[self.storyArray objectAtIndex:0] hasPrefix:@"dialog"]) {
		[self dealWithBlackOrWhite:[self.storyArray objectAtIndex:0]];
		[self makeDialog];
	} else if ([(NSString*)[self.storyArray objectAtIndex:0] hasPrefix:@"story"]) {
		[self dealWithBlackOrWhite:[self.storyArray objectAtIndex:0]];
		[self makeStory];
	}
}

- (void)gotoNext {
	self.avg1Index++;
	[self runGameFrame];
}

- (void)dealWithBlackOrWhite: (NSString*)aFlag {
	NSArray *realFlagArray = [[self.storyArray objectAtIndex:0] componentsSeparatedByString:@"-"];
	if ([[realFlagArray objectAtIndex:0] hasSuffix:@"b"]) {
		self.mainViewController.view.backgroundColor = [UIColor blackColor];
		self.timeLabel.textColor = [UIColor whiteColor];
		self.goldLabel.textColor = [UIColor whiteColor];
		self.lifeLabel.textColor = [UIColor whiteColor];
	} else {
		self.mainViewController.view.backgroundColor = [UIColor whiteColor];
		self.timeLabel.textColor = [UIColor blackColor];
		self.goldLabel.textColor = [UIColor blackColor];
		self.lifeLabel.textColor = [UIColor blackColor];
	}
}

- (void)makeDialog {
	self.timeLabel.hidden = true;
	self.goldLabel.hidden = true;
	self.lifeLabel.hidden = true;
	self.bgImageView.hidden = true;
	self.bodyImageView.hidden = true;
	self.faceImageView.hidden = true;
	self.talkLabel.hidden = true;
	self.talkButton.hidden = true;
	
	NSString *title = [[self.storyArray objectAtIndex:0] substringFromIndex:8];
//	[string componentsSeparatedByString:@"-"]
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:title preferredStyle:UIAlertControllerStyleAlert];
	for (int i = 1; i < self.storyArray.count; i++) {
		NSArray *choice = [[self.storyArray objectAtIndex:i] componentsSeparatedByString:@"-"];
		UIAlertAction *action = [UIAlertAction actionWithTitle:[choice objectAtIndex:0] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
			[self dealWithDialogChoice:[choice objectAtIndex:1]];
		}];
		[vc addAction:action];
	}
	[self.mainViewController presentViewController:vc animated:NO completion:nil];
}

-(void)dealWithDialogChoice:(NSString*)aChoice {
	if ([aChoice hasSuffix:@"end"]) {
		[self nextChapter];
		return;
	}
	NSInteger flag = [aChoice integerValue];
	self.avg0Index = flag;
	self.avg1Index = 0;
	self.storyArray = (NSArray*)[self.scriptArray objectAtIndex:self.avg0Index];
	[self fire];
}

- (void)makeStory {
	if (self.avg1Index == 0) {
		NSArray *choice1 = [[self.storyArray objectAtIndex:0] componentsSeparatedByString:@"-"];
		[self.bodyImageView setImage:[UIImage imageNamed:[choice1 objectAtIndex:1]]];
		[self.bgImageView setImage:[UIImage imageNamed:[choice1 objectAtIndex:2]]];
		if ([[choice1 objectAtIndex:3] hasPrefix:@"0"]) {
			[APPALL.mySoundManager stopMusic:YES];
		} else {
			[APPALL.mySoundManager playMusic:[NSString stringWithFormat:@"%@.mp3",[choice1 objectAtIndex:3]] looping:YES];
		}
		if ([[choice1 objectAtIndex:4] hasPrefix:@"0"]) {
			//do nothing
		} else {
			int loveadd = [[choice1 objectAtIndex:4] intValue];
			loveadd = loveadd >= 50? (loveadd - 100):loveadd;
			APPALL.mySaveItem.love += loveadd;
			[self.lifeLabel setText:[NSString stringWithFormat:@"好感:%d", APPALL.mySaveItem.love]];
		}
		self.avg1Index++;
		[self makeStory];
		return;
	}
	if (self.avg1Index >= [self.storyArray count] - 1) {
		NSArray *choice1 = [[self.storyArray lastObject] componentsSeparatedByString:@"-"];
		[self dealWithDialogChoice:[choice1 objectAtIndex:1]];
		return;
	}
	self.timeLabel.hidden = false;
	self.goldLabel.hidden = false;
	self.lifeLabel.hidden = false;
	self.talkLabel.hidden = false;
	self.talkButton.hidden = false;
	NSArray *choice = [[self.storyArray objectAtIndex:self.avg1Index] componentsSeparatedByString:@"-"];
	if ([choice count] != 5) {
		[SVProgressHUD showErrorWithStatus:@"errror make"];
		return;
	}
	switch ([[choice objectAtIndex:0] integerValue]) {
		case 0: {
			self.bgImageView.hidden = false;
			self.bodyImageView.hidden = true;
			self.faceImageView.hidden = true;
			[self dealWithTalkandBgm:choice];
			break;
		}
		case 1: {
			self.bgImageView.hidden = false;
			self.bodyImageView.hidden = false;
			if ([[choice objectAtIndex:1] hasPrefix:@"lt"]) {
				//do nothing;
			} else if ([[choice objectAtIndex:1] hasPrefix:@"0"]) {
				self.faceImageView.hidden = true;
			} else {
				self.faceImageView.hidden = false;
				self.faceImageView.image = [UIImage imageNamed:[choice objectAtIndex:1]];
			}
			[self dealWithTalkandBgm:choice];
			break;
		}
		//展示标题
		case 2: {
			self.bgImageView.hidden = true;
			self.bodyImageView.hidden = true;
			self.faceImageView.hidden = true;
			self.mainViewController.title = [choice objectAtIndex:3];
			[self dealWithTalkandBgm:choice];
			break;
		}
		//展示事件
		case 3: {
			self.bgImageView.hidden = false;
			self.bodyImageView.hidden = true;
			self.faceImageView.hidden = true;
			[self dealWithTalkandBgm:choice];
			break;
		}
		default:
			break;
	}
}

-(void)dealWithTalkandBgm:(NSArray*)aarray {
	if ([[aarray lastObject] hasPrefix:@"lt"]) {
		//do nothing;
	} else {
		[APPALL.mySoundManager playMusic:[NSString stringWithFormat:@"%@.mp3",[aarray lastObject]] looping:YES];
	}
	NSString *str = [[aarray objectAtIndex:2] isEqualToString:@"0"]?@"":[aarray objectAtIndex:2];
	str = [str stringByAppendingString:@"\n"];
	str = [str stringByAppendingString:[aarray objectAtIndex:3]];
	[self.talkLabel setText:str];
}

-(void)nextChapter {
	//TODO dialog end, try something different?
	[self.myGameDelegate gotoNextScene:@""];
}

-(int)getNextNumberAfter:(int)aDay {
	for (int i = 0; i < self.kGameArray.count; i++) {
		int aInteger = [[self.kGameArray objectAtIndex:i] intValue];
		if (aInteger > aDay) {
			return aInteger;
		}
	}
	return 999;
}

@end
