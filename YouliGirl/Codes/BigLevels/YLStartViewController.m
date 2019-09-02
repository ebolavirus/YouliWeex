//
//  TMStartViewController.m
//  Tomorrow
//
//  Created by sunmingming on 14-9-18.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import "YLStartViewController.h"
//#import "BigHistoryVController.h"

@interface YLStartViewController ()

@property(nonatomic,strong) UIImageView *girlView;
@property(nonatomic,strong) UIImageView *logoView;
@property(nonatomic,strong) UILabel *logoLabel;

@property(nonatomic,strong) FUIButton *startButton;
@property(nonatomic,strong) FUIButton *loadButton;
@property(nonatomic,strong) FUIButton *configButton;

@end

@implementation YLStartViewController

@synthesize startButton, loadButton, configButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
		self.view.backgroundColor = MMColorPink;
		
		self.girlView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yuri_date_b"]];
		self.girlView.contentMode = UIViewContentModeScaleAspectFit;
		[self.view addSubview:self.girlView];
		
		self.logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show_title"]];
		self.logoView.contentMode = UIViewContentModeScaleAspectFit;
		[self.view addSubview:self.logoView];
		
		self.startButton = [FUIButton new];
		startButton.buttonColor = [UIColor orangeColor];
		startButton.shadowColor = [UIColor redColor];
		startButton.shadowHeight = 3.0f;
		startButton.cornerRadius = 6.0f;
		[startButton setTitle:@"开始游戏" forState:UIControlStateNormal];
		[startButton addTarget:self action:@selector(startPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:startButton];
		
		self.loadButton = [FUIButton new];
		loadButton.buttonColor = [UIColor orangeColor];
		loadButton.shadowColor = [UIColor redColor];
		loadButton.shadowHeight = 3.0f;
		loadButton.cornerRadius = 6.0f;
		[loadButton setTitle:@"加载进度" forState:UIControlStateNormal];
		[loadButton addTarget:self action:@selector(loadPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:loadButton];
		
		self.configButton = [FUIButton new];
		configButton.buttonColor = [UIColor turquoiseColor];
		configButton.shadowColor = [UIColor greenSeaColor];
		configButton.shadowHeight = 3.0f;
		configButton.cornerRadius = 6.0f;
		[configButton setTitle:@"软件设置" forState:UIControlStateNormal];
		[configButton addTarget:self action:@selector(selectPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:configButton];
#if 0
		FUIButton *historyButton = [[FUIButton alloc] initWithFrame:CGRectMake(100, (KDeviceHeight - 64)/2 + 20 + 4, 120, 40)];
		historyButton.buttonColor = [UIColor grassColor];
		historyButton.shadowColor = [UIColor hollyGreenColor];
		historyButton.shadowHeight = 3.0f;
		historyButton.cornerRadius = 6.0f;
		[historyButton setTitle:@"解锁列表" forState:UIControlStateNormal];
		[historyButton addTarget:self action:@selector(historyPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:historyButton];
#endif
		NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
		NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
		self.logoLabel = [UILabel new];
		self.logoLabel.numberOfLines = 0;
		self.logoLabel.text = [NSString stringWithFormat:@"Version：%@", version];
		self.logoLabel.textAlignment = NSTextAlignmentLeft;
		self.logoLabel.textColor = [UIColor blackColor];
		[self.view addSubview:self.logoLabel];
		
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	WS(ws);
	[self.girlView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.and.right.mas_equalTo(ws.view);
		make.height.mas_equalTo(ws.view.frame.size.height * 4/5);
		make.width.mas_equalTo(ws.view.frame.size.height * 8/25);
	}];
	[self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.and.left.and.right.mas_equalTo(ws.view);
		make.height.mas_equalTo(ws.view.frame.size.height/5);
	}];
	[self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(ws.view).with.mas_offset(ws.view.frame.size.width/20);
		make.right.mas_equalTo(ws.girlView.mas_left).with.mas_offset(-ws.view.frame.size.width/20);
		make.height.mas_equalTo(ws.view.frame.size.height/12);
		make.centerY.mas_equalTo(ws.girlView).with.mas_offset(-ws.view.frame.size.height/10);
	}];
	[self.loadButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.and.height.mas_equalTo(ws.startButton);
		make.centerY.mas_equalTo(ws.girlView);
	}];
	[self.configButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.and.right.and.height.mas_equalTo(ws.startButton);
		make.centerY.mas_equalTo(ws.girlView).with.mas_offset(ws.view.frame.size.height/10);
	}];
	[self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.right.and.bottom.mas_equalTo(ws.view);
		make.left.mas_equalTo(ws.startButton);
		make.height.mas_equalTo(ws.view.frame.size.height/10);
	}];
	[APPALL.mySoundManager playMusic:@"2205001.mp3" looping:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	
	[APPALL.mySoundManager stopMusic:YES];
}

-(void)startPressed:(id)sender
{
	APPALL.gameStartFlag = 0;
	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)loadPressed:(id)sender{
	APPALL.gameStartFlag = 0;
	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)selectPressed:(id)sender
{
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"软件设置" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
	UIAlertAction *musicButton = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"背景音乐:%@",APPALL.myCacheItem.myMusic? @"开":@"关"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		APPALL.myCacheItem.myMusic = !APPALL.myCacheItem.myMusic;
		[APPALL.mySaveItem saveToDB];
		[APPALL.mySoundManager setSoundVolume:APPALL.myCacheItem.myMusic?1.0f:0.0f];
		[APPALL.mySoundManager setMusicVolume:APPALL.myCacheItem.myMusic?1.0f:0.0f];
	}];
	
	UIAlertAction *resAction = [UIAlertAction actionWithTitle:@"制作信息" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		UIAlertController *vc2 = [UIAlertController alertControllerWithTitle:@"制作人员" message:@"制作总监\n王梁华\n制作副总监\n谢兆龙\n专家、技术监制\n罗睿明" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
			//DO NOTHING
		}];
		[vc2 addAction:cancelAction];
		[self presentViewController:vc2 animated:NO completion:nil];
	}];
	
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
		//DO NOTHING
	}];
	[vc addAction:musicButton];
	[vc addAction:resAction];
	[vc addAction:cancelAction];
	[self presentViewController:vc animated:YES completion:nil];
}

-(void)historyPressed:(id)sender
{
	//    BigHistoryVController *vc = [[BigHistoryVController alloc] init];
	//    [self.navigationController pushViewController:vc animated:YES];
}

@end
