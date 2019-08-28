//
//  MainGameViewController.m
//  YouliGirl
//
//  Created by MingmingSun on 2019/8/22.
//  Copyright © 2019 Sunmingming. All rights reserved.
//

#import "MainGameViewController.h"

@interface MainGameViewController ()
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
		self.view.backgroundColor = [UIColor blueColor];
		
		self.timeLabel = [UILabel new];
		self.timeLabel.text = @"10月1日 星期一";
		self.timeLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:self.timeLabel];
		
		self.goldLabel = [UILabel new];
		self.goldLabel.text = @"钱包：0圆";
		self.goldLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:self.goldLabel];
		
		self.lifeLabel = [UILabel new];
		self.lifeLabel.text = @"精神：良好";
		self.lifeLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:self.lifeLabel];
		
		self.bgImageView = [UIImageView new];
		self.bgImageView.image = [UIImage imageNamed:@"scene_cinema"];
		[self.bgImageView setContentMode:UIViewContentModeScaleAspectFit];
		[self.view addSubview:self.bgImageView];
		
		self.bodyImageView = [UIImageView new];
		self.bodyImageView.image = [UIImage imageNamed:@"face01001"];
		[self.bodyImageView setContentMode:UIViewContentModeScaleAspectFit];
		[self.view addSubview:self.bodyImageView];
		
		self.faceImageView = [UIImageView new];
		self.faceImageView.image = [UIImage imageNamed:@"face02002.png"];
		[self.faceImageView setContentMode:UIViewContentModeScaleAspectFit];
		[self.view addSubview:self.faceImageView];
		
		self.talkLabel = [UITextView new];
		self.talkLabel.text = @"祐莉：\n谢谢你今天陪我出来，今天的电影真好看啊啊啊真好看啊真好看，真好看啊真好看";
		self.talkLabel.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
		self.talkLabel.font = [UIFont flatFontOfSize:kDeviceWidth/20];
		self.talkLabel.layer.borderColor = [[UIColor greenColor] CGColor];
		self.talkLabel.layer.borderWidth = 5.0f;
		[self.view addSubview:self.talkLabel];
		
		self.talkButton = [FUIButton new];
		self.talkButton.buttonColor = [UIColor turquoiseColor];
		self.talkButton.shadowColor = [UIColor greenSeaColor];
		self.talkButton.shadowHeight = 3.0f;
		self.talkButton.cornerRadius = 6.0f;
		[self.talkButton setTitle:@"点击继续" forState:UIControlStateNormal];
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
												andMainView:self];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor greenColor];
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
	CGFloat youliWidth = ws.view.frame.size.height/3;
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
		make.height.mas_equalTo(youliWidth);
		make.top.mas_equalTo(ws.lifeLabel.mas_bottom);
	}];
	[self.bodyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.and.height.mas_equalTo(youliWidth);
		make.centerX.and.top.mas_equalTo(ws.bgImageView);
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
		make.height.mas_equalTo(youliWidth);
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
		[APPALL.gameEngine loadScript:1];
		[APPALL.gameEngine fire];
	}
}

-(void)selectPressed:(id)sender {
	self.talkButton.enabled = false;
	self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(scrollTimer) userInfo:nil repeats:NO];
	[APPALL.gameEngine gotoNext];
}

-(void)scrollTimer {
	[self.myTimer invalidate];
	self.myTimer = nil;
	self.talkButton.enabled = true;
}

@end
