//
//  GameNextLevelView.m
//  Tomorrow
//
//  Created by sunmingming on 14/11/14.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import "GameSettingViewController.h"

@interface GameSettingViewController()

@property(nonatomic,assign) id delegate;
@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) UILabel *rotateLabel;
@property(nonatomic,strong) UILabel *musicLabel;
@property(nonatomic,strong) UILabel *edgeLabel;
@property(nonatomic,strong) UILabel *tipLabel;
@property(nonatomic,strong) UILabel *countLabel;

@property(nonatomic,strong) FUISwitch *rotateSwitch;
@property(nonatomic,strong) FUISwitch *musicSwitch;
@property(nonatomic,strong) FUISwitch *edgeSwitch;
@property(nonatomic,strong) FUISwitch *tipSwitch;
@property(nonatomic,strong) UISlider *countSlider;
@property(nonatomic,strong) UILabel *countNum;

@property(nonatomic,strong) FUIButton *backButton;
@property(nonatomic,strong) FUIButton *nextButton;

@property(nonatomic,assign) CGFloat edge;

@end

@implementation GameSettingViewController

@synthesize titleLabel,rotateLabel,musicLabel,edgeLabel,tipLabel,countLabel;
@synthesize rotateSwitch,musicSwitch, edgeSwitch,tipSwitch,countSlider,countNum;
@synthesize backButton,nextButton;
@synthesize edge;

- (id)initWithDelegate:(id<GameSettingDelegate>)delegate {
	self = [super init];
	if (self) {
		//solid frame,up validition is a just frame...
		self.edge = MIN(KDeviceHeight - 20, kDeviceWidth - 20);
		self.view.frame = CGRectMake(0,0,edge,edge);
		self.delegate = delegate;
		
		self.view.backgroundColor = MMColorYellow;
		
		self.titleLabel = [[UILabel alloc] init];
		titleLabel.text = mmsloc("gameconfig");
		titleLabel.font = [UIFont flatFontOfSize:20.0f];
		titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.view addSubview:titleLabel];
		
		self.musicLabel = [[UILabel alloc] init];
		musicLabel.text = mmsloc("menumusic");
		musicLabel.font = [UIFont flatFontOfSize:16.0f];
		musicLabel.textAlignment = NSTextAlignmentRight;
		[self.view addSubview:musicLabel];
		
		self.rotateLabel = [[UILabel alloc] init];
		rotateLabel.text = mmsloc("configrotate");
		rotateLabel.font = [UIFont flatFontOfSize:16.0f];
		rotateLabel.textAlignment = NSTextAlignmentRight;
		[self.view addSubview:rotateLabel];
		
		self.edgeLabel = [[UILabel alloc] init];
		edgeLabel.text = mmsloc("configedge");
		edgeLabel.font = [UIFont flatFontOfSize:16.0f];
		edgeLabel.textAlignment = NSTextAlignmentRight;
		[self.view addSubview:edgeLabel];
		
		self.tipLabel = [[UILabel alloc] init];
		tipLabel.text = mmsloc("configtip");
		tipLabel.font = [UIFont flatFontOfSize:16.0f];
		tipLabel.textAlignment = NSTextAlignmentRight;
		[self.view addSubview:tipLabel];
		
		self.countLabel = [[UILabel alloc] init];
		countLabel.text = mmsloc("configcount");
		countLabel.font = [UIFont flatFontOfSize:16.0f];
		countLabel.textAlignment = NSTextAlignmentRight;
		[self.view addSubview:countLabel];
		
		self.countSlider = [[UISlider alloc] init];
		[countSlider configureFlatSliderWithTrackColor:MMColorWhite progressColor:MMColorOrange thumbColor:MMColorBrown];
		countSlider.minimumValue = 2;
		countSlider.maximumValue = 10;
		countSlider.continuous = YES;
		countSlider.value = APPALL.myCacheItem.countNum;
		[self.view addSubview:countSlider];
		
		self.countNum = [[UILabel alloc] init];
		countNum.text = [NSString stringWithFormat:@"%zd*%zd",APPALL.myCacheItem.countNum,APPALL.myCacheItem.countNum];
		countNum.font = [UIFont flatFontOfSize:16.0f];
		countNum.textAlignment = NSTextAlignmentRight;
		[self.view addSubview:countNum];
		
		self.rotateSwitch = [[FUISwitch alloc] init];
		rotateSwitch.onColor = MMColorWhite;
		rotateSwitch.offColor = MMColorOrange;
		rotateSwitch.onBackgroundColor = MMColorBrown;
		rotateSwitch.offBackgroundColor = MMColorBrown;
		rotateSwitch.offLabel.font = [UIFont boldFlatFontOfSize:14];
		rotateSwitch.onLabel.font = [UIFont boldFlatFontOfSize:14];
		rotateSwitch.onLabel.text = mmsloc("configon");
		rotateSwitch.offLabel.text = mmsloc("configoff");
		[self.view addSubview:rotateSwitch];
		
		self.musicSwitch = [[FUISwitch alloc] init];
		musicSwitch.onColor = MMColorWhite;
		musicSwitch.offColor = MMColorOrange;
		musicSwitch.onBackgroundColor = MMColorBrown;
		musicSwitch.offBackgroundColor = MMColorBrown;
		musicSwitch.offLabel.font = [UIFont boldFlatFontOfSize:14];
		musicSwitch.onLabel.font = [UIFont boldFlatFontOfSize:14];
		musicSwitch.onLabel.text = mmsloc("configon");
		musicSwitch.offLabel.text = mmsloc("configoff");
		[self.view addSubview:musicSwitch];
		
		self.edgeSwitch = [[FUISwitch alloc] init];
		edgeSwitch.onColor = MMColorWhite;
		edgeSwitch.offColor = MMColorOrange;
		edgeSwitch.onBackgroundColor = MMColorBrown;
		edgeSwitch.offBackgroundColor = MMColorBrown;
		edgeSwitch.offLabel.font = [UIFont boldFlatFontOfSize:14];
		edgeSwitch.onLabel.font = [UIFont boldFlatFontOfSize:14];
		edgeSwitch.onLabel.text = mmsloc("configon");
		edgeSwitch.offLabel.text = mmsloc("configoff");
		[self.view addSubview:edgeSwitch];
		
		self.tipSwitch = [[FUISwitch alloc] init];
		tipSwitch.onColor = MMColorWhite;
		tipSwitch.offColor = MMColorOrange;
		tipSwitch.onBackgroundColor = MMColorBrown;
		tipSwitch.offBackgroundColor = MMColorBrown;
		tipSwitch.offLabel.font = [UIFont boldFlatFontOfSize:14];
		tipSwitch.onLabel.font = [UIFont boldFlatFontOfSize:14];
		tipSwitch.onLabel.text = mmsloc("configon");
		tipSwitch.offLabel.text = mmsloc("configoff");
//		[[tipSwitch rac_signalForControlEvents:UIControlEventValueChanged] subscribeNext:^(id x) {
//			[self switchChanged:@"tip"];
//		}];
		[self.view addSubview:tipSwitch];
		
		self.backButton = [[FUIButton alloc] init];
		backButton.buttonColor = MMColorOrange;
		backButton.shadowColor = MMColorBrown;
		backButton.shadowHeight = 2;
		[backButton setTitle:mmsloc("naviback") forState:UIControlStateNormal];
//		[[backButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//			[self backPressed:nil];
//		}];
		[self.view addSubview:backButton];
		
		self.nextButton = [[FUIButton alloc] init];
		nextButton.buttonColor = MMColorOrange;
		nextButton.shadowColor = MMColorBrown;
		nextButton.shadowHeight = 2;
		[nextButton setTitle:mmsloc("navistart") forState:UIControlStateNormal];
		[self.view addSubview:nextButton];
	}
	return self;
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	[self.rotateSwitch setOn:APPALL.myCacheItem.isRotate];
	[self.edgeSwitch setOn:APPALL.myCacheItem.isEdge];
	[self.musicSwitch setOn:APPALL.myCacheItem.myMusic];
	[self.tipSwitch setOn:APPALL.myCacheItem.isTip];
	[self.countSlider setValue:APPALL.myCacheItem.countNum];
	WS(ws);
	// 13/24 * edge
	CGFloat space = ws.edge/15;
	
	[self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view).with.offset(20);
		make.right.mas_equalTo(ws.view).with.offset(-20);
		make.top.mas_equalTo(ws.view).with.offset(space);
		make.height.mas_equalTo(ws.edge/15);
	}];
	//
	[self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view);
		make.right.mas_equalTo(ws.view.mas_centerX).with.offset(-ws.edge/5);
		make.top.mas_equalTo(ws.titleLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(ws.edge/15);
	}];
	
	[self.countSlider mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.countLabel.mas_right).with.offset(10);
		make.right.mas_equalTo(ws.view).with.offset(- space - 60);
		make.top.and.height.mas_equalTo(ws.countLabel);
	}];
	
	[self.countNum mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.countSlider.mas_right);
		make.right.mas_equalTo(ws.view).with.offset(-space);
		make.top.and.height.mas_equalTo(ws.countLabel);
	}];
	
	[self.musicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.countLabel);
		make.top.mas_equalTo(ws.countLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(ws.edge/15);
	}];
	
	[self.musicSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.countLabel.mas_right).with.offset(10);
		make.width.mas_equalTo(ws.edge/5);
		make.top.and.height.mas_equalTo(ws.musicLabel);
	}];
	
	[self.rotateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.countLabel);
		make.top.mas_equalTo(ws.musicLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(ws.edge/15);
	}];
	
	[self.rotateSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.countLabel.mas_right).with.offset(10);
		make.width.mas_equalTo(ws.edge/5);
		make.top.and.height.mas_equalTo(ws.rotateLabel);
	}];
	
	[self.edgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.countLabel);
		make.top.mas_equalTo(ws.rotateLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(ws.edge/15);
	}];
	
	[self.edgeSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.edgeLabel.mas_right).with.offset(10);
		make.width.mas_equalTo(ws.edge/5);
		make.top.and.height.mas_equalTo(ws.edgeLabel);
	}];
	
	[self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.mas_equalTo(ws.countLabel);
		make.top.mas_equalTo(ws.edgeLabel.mas_bottom).with.offset(space);
		make.height.mas_equalTo(ws.edge/15);
	}];
	
	[self.tipSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.tipLabel.mas_right).with.offset(10);
		make.width.mas_equalTo(ws.edge/5);
		make.top.and.height.mas_equalTo(ws.tipLabel);
	}];
	
	[self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.mas_equalTo(ws.edge/2 - 10);
		make.height.mas_equalTo(ws.edge/9);
		make.right.mas_equalTo(ws.view.mas_centerX).with.offset(-5);
		make.top.mas_equalTo(ws.tipLabel.mas_bottom).with.offset(space);
	}];
	
	[self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.and.height.and.bottom.mas_equalTo(ws.backButton);
		make.left.mas_equalTo(ws.view.mas_centerX).with.offset(5);
	}];
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

-(void)countChanged:(UISlider*)sender {
	NSInteger i = (NSInteger)[self.countSlider value];
	APPALL.myCacheItem.countNum = i;
	self.countNum.text = [NSString stringWithFormat:@"%zd*%zd",i,i];
}

-(void)switchChanged:(NSString*)aTag {
	if ([aTag hasPrefix:@"rotate"]) {
		APPALL.myCacheItem.isRotate = rotateSwitch.isOn;
	} else if ([aTag hasPrefix:@"edge"]) {
		APPALL.myCacheItem.isEdge = edgeSwitch.isOn;
	} else if ([aTag hasPrefix:@"tip"]) {
		APPALL.myCacheItem.isTip = tipSwitch.isOn;
	} else if ([aTag hasPrefix:@"music"]) {
		APPALL.myCacheItem.myMusic = musicSwitch.isOn;
		[APPALL.mySaveItem saveToDB];
		[APPALL.mySoundManager setSoundVolume:APPALL.myCacheItem.myMusic?1.0f:0.0f];
		[APPALL.mySoundManager setMusicVolume:APPALL.myCacheItem.myMusic?1.0f:0.0f];
	}
}

-(void)nextPressed:(id)sender
{
	if(!self.delegate)
		return;
	[self.backButton setEnabled:NO];
	[self.nextButton setEnabled:NO];
	[self.delegate nextPressed:sender];
}

-(void)backPressed:(id)sender
{
	if(!self.delegate)
		return;
	[self.backButton setEnabled:NO];
	[self.nextButton setEnabled:NO];
	[self.delegate backPressed:sender];
}

@end
