//
//  MainGameViewController.m
//  YouliGirl
//
//  Created by MingmingSun on 2019/8/22.
//  Copyright © 2019 Sunmingming. All rights reserved.
//

#import "MainGameViewController.h"

@interface MainGameViewController ()<GameDelegate>
//日期
@property(nonatomic,strong) UILabel *timeLabel;
//金钱
@property(nonatomic,strong) UILabel *goldLabel;
//精力
@property(nonatomic,strong) UILabel *lifeLabel;
//背景图片
@property(nonatomic,strong) UIImageView *bgImageView;
//祐莉
@property(nonatomic,strong) UIImageView *bodyImageView;
//二次表情粘贴
@property(nonatomic,strong) UIImageView *faceImageView;
//聊天内容
@property(nonatomic,strong) UITextView *talkLabel;
//聊天按钮
@property(nonatomic,strong) FUIButton *talkButton;

@property(nonatomic,strong) NSTimer *myTimer;

@end

@implementation MainGameViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = @"--";
		self.view.backgroundColor = [UIColor blackColor];
		
		self.timeLabel = [UILabel new];
		self.timeLabel.text = @"--";
		self.timeLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:self.timeLabel];
		
		self.goldLabel = [UILabel new];
		self.goldLabel.text = @"--";
		self.goldLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:self.goldLabel];
		
		self.lifeLabel = [UILabel new];
		self.lifeLabel.text = @"--";
		self.lifeLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:self.lifeLabel];
		
		self.bgImageView = [UIImageView new];
		[self.bgImageView setContentMode:UIViewContentModeScaleAspectFit];
		[self.view addSubview:self.bgImageView];
		
		self.bodyImageView = [UIImageView new];
		[self.bodyImageView setContentMode:UIViewContentModeScaleAspectFit];
		[self.view addSubview:self.bodyImageView];
		
		self.faceImageView = [UIImageView new];
		[self.faceImageView setContentMode:UIViewContentModeScaleAspectFit];
		[self.view addSubview:self.faceImageView];
		
		self.talkLabel = [UITextView new];
		self.talkLabel.text = @"加载中...";
		self.talkLabel.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
		self.talkLabel.font = [UIFont flatFontOfSize:kDeviceWidth/20];
		self.talkLabel.backgroundColor = [UIColor paleRoseColor];
		self.talkLabel.layer.borderColor = [[UIColor pinkLipstickColor] CGColor];
		self.talkLabel.layer.borderWidth = 5.0f;
		[self.view addSubview:self.talkLabel];
		
		self.talkButton = [FUIButton new];
		self.talkButton.buttonColor = [UIColor pinkLipstickColor];
		self.talkButton.shadowColor = [UIColor eggplantColor];
		self.talkButton.shadowHeight = 3.0f;
		self.talkButton.hidden = true;
		[self.talkButton setTitle:@"点此继续" forState:UIControlStateNormal];
		[self.talkButton addTarget:self action:@selector(selectPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:self.talkButton];
		//link the components
		[APPALL.gameEngine setTimeLabel:self.timeLabel
											 andGoldLabel:self.goldLabel
											 andLifeLabel:self.lifeLabel
										 andBgImageView:self.bgImageView
									 andBodyImageView:self.bodyImageView
									 andFaceImageView:self.faceImageView
											 andTalkLabel:self.talkLabel
											andTalkButton:self.talkButton
												andMainView:self];
		APPALL.gameEngine.myGameDelegate = self;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"will appear....bbb, %ld", APPALL.gameStartFlag);
	if (APPALL.gameStartFlag < 0) {
		return;
	}
	WS(ws);
	CGFloat layoutWidth = ws.view.frame.size.width;
	CGFloat layoutHeight = ws.view.frame.size.height;
	CGFloat youliWidth = ws.view.frame.size.height *2/5;
	[self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.and.left.mas_equalTo(ws.view);
		make.height.mas_equalTo(layoutWidth/10);
		make.width.mas_equalTo(layoutWidth);
	}];
	[self.goldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.height.mas_equalTo(layoutWidth/10);
		make.width.mas_equalTo(layoutWidth/2);
		make.left.mas_equalTo(ws.view);
		make.top.mas_equalTo(ws.timeLabel.mas_bottom);
	}];
	[self.lifeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.height.mas_equalTo(layoutWidth/10);
		make.width.mas_equalTo(layoutWidth/2);
		make.right.mas_equalTo(ws.view);
		make.top.mas_equalTo(ws.timeLabel.mas_bottom);
	}];
	[self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.width.mas_equalTo(ws.view);
		make.height.mas_equalTo(ws.view.frame.size.height/2);
		make.top.mas_equalTo(ws.lifeLabel.mas_bottom);
	}];
	[self.bodyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.and.height.mas_equalTo(youliWidth);
		make.centerX.and.bottom.mas_equalTo(ws.bgImageView);
	}];
	// h 42 w 48 x 25 y 38
	[self.faceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.mas_equalTo(youliWidth * 48/160);
		make.height.mas_equalTo(youliWidth * 42/160);
		make.left.mas_equalTo(ws.bodyImageView).with.offset(youliWidth * 50/160);
		make.top.mas_equalTo(ws.bodyImageView).with.offset(youliWidth * 39/160);
	}];
	[self.talkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.mas_equalTo(ws.view);
		make.bottom.mas_equalTo(ws.view).with.offset(-layoutHeight/10);
		make.left.mas_equalTo(ws.view);
		make.top.mas_equalTo(ws.bodyImageView.mas_bottom);
	}];
	[self.talkButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.mas_equalTo(layoutWidth*2/3);
		make.height.mas_equalTo(layoutHeight/14);
		make.centerX.mas_equalTo(ws.view);
		make.top.mas_equalTo(ws.talkLabel.mas_bottom);
	}];
}

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	NSLog(@"did appear....bbb, %ld", APPALL.gameStartFlag);
	if (APPALL.gameStartFlag < 0) {
		return;
	}
	// 0 重新开始
	if (APPALL.gameStartFlag == 0) {
		//init all data
		[APPALL.mySaveItem resetData];
		[self.goldLabel setText:[NSString stringWithFormat:@"金钱:%d", APPALL.mySaveItem.gold]];
		if (APPALL.mySaveItem.day < 10) {
			[self.timeLabel setText:@"今天:9月?日"];
		} else {
			[self.timeLabel setText:[NSString stringWithFormat:@"今天:10月%d日", APPALL.mySaveItem.day/10]];
		}
		[self.lifeLabel setText:[NSString stringWithFormat:@"好感:%d", APPALL.mySaveItem.love]];
		[APPALL.gameEngine loadScript:APPALL.mySaveItem.day];
		[APPALL.gameEngine fire];
	}
}

-(void)gotoNextScene:(NSString*)aStr {
	APPALL.mySaveItem.day = [APPALL.gameEngine getNextNumberAfter:APPALL.mySaveItem.day];
	if (APPALL.mySaveItem.day >= 999) {
		// game over
		return;
	}
	[APPALL.gameEngine loadScript:APPALL.mySaveItem.day];
	[APPALL.gameEngine fire];
}

-(void)selectPressed:(id)sender {
	self.talkButton.enabled = false;
	[UIView animateWithDuration:0.2 animations:^{
		self.talkButton.alpha = 0.9;
		self.talkButton.enabled = false;
	} completion:^(BOOL finished) {
		self.talkButton.alpha = 1;
		self.talkButton.enabled = true;
	}];
	[APPALL.gameEngine gotoNext];
}

-(void)scrollTimer {
//	[self.myTimer invalidate];
//	self.myTimer = nil;
	self.talkButton.enabled = true;
}

@end
