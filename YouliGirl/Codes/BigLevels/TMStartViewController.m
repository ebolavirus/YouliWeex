//
//  TMStartViewController.m
//  Tomorrow
//
//  Created by sunmingming on 14-9-18.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import "TMStartViewController.h"
#import "BigAboutVController.h"
#import "GameSettingViewController.h"
#import "BigLevelsVController.h"
#import "PuzzleController.h"

@interface TMStartViewController ()<GameSettingDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong) UIImageView *topView;
@property(nonatomic,strong) UIButton *uploadButton;
@property(nonatomic,strong) UIImageView *uploadView;
@property(nonatomic,strong) UILabel *uploadLabel;

@property(nonatomic,strong) FUIButton *playButton;
@property(nonatomic,strong) FUIButton *aboutButton;
@property(nonatomic,strong) UILabel *logoLabel;

@property(nonatomic,strong) UIImagePickerController *imagePickerController;
@property(nonatomic,strong) UIImage *imageNode;

@end

@implementation TMStartViewController

@synthesize topView, uploadButton, uploadLabel, uploadView;
@synthesize playButton, aboutButton, logoLabel;
@synthesize imagePickerController, imageNode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = mmsloc("GameTitle");
		self.view.backgroundColor = MMColorYellow;
		
		// Custom initialization
		self.topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"titleLogo"]];
		topView.contentMode = UIViewContentModeScaleAspectFit;
		[self.view addSubview:topView];
		
		self.uploadView = [[UIImageView alloc] initWithImage:[tooles getImageByColor:MMColorGreen]];
		uploadView.contentMode = UIViewContentModeScaleAspectFit;
		[self.view addSubview:uploadView];
		
		self.uploadLabel = [[UILabel alloc] init];
		uploadLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5f];
		uploadLabel.text = mmsloc("chooseLevel");
		uploadLabel.textAlignment = NSTextAlignmentCenter;
		uploadLabel.textColor = MMColorWhite;
		[self.view addSubview:uploadLabel];
		
		self.uploadButton = [[UIButton alloc] init];
		[uploadButton setImage:[UIImage imageNamed:@"upload"] forState:UIControlStateNormal];
		[uploadButton setTitleColor:MMColorBrown forState:UIControlStateNormal];
		[uploadButton setContentVerticalAlignment:UIControlContentVerticalAlignmentBottom];
		[[uploadButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
			[self uploadPressed:nil];
		}];
		[uploadButton setTintColor:[UIColor blackColor]];
		[self.view addSubview:uploadButton];
		
		self.playButton = [[FUIButton alloc] init];
		playButton.buttonColor = MMColorOrange;
		playButton.shadowColor = MMColorBrown;
		playButton.shadowHeight = 2;
		playButton.cornerRadius = 20.0f;
		[playButton setTitle:mmsloc("startGame") forState:UIControlStateNormal];
		[[playButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
			[self startPressed:nil];
		}];
		[self.view addSubview:playButton];
		
		self.aboutButton = [[FUIButton alloc] init];
		aboutButton.buttonColor = MMColorOrange;
		aboutButton.shadowColor = MMColorBrown;
		aboutButton.shadowHeight = 2;
		aboutButton.cornerRadius = 20.0f;
		[aboutButton setTitle:mmsloc("gameHelp") forState:UIControlStateNormal];
		[[aboutButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
			[self aboutPressed:nil];
		}];
		[self.view addSubview:aboutButton];
		
		NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
		NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];//app版本号 Version
		self.logoLabel = [[UILabel alloc] init];
		logoLabel.numberOfLines = 0;
		logoLabel.text = [NSString stringWithFormat:@"Version：%@\nCopyright © 2018 xiaoluoli.com", version];
		logoLabel.font = [UIFont flatFontOfSize:12.0f];
		logoLabel.textAlignment = NSTextAlignmentCenter;
		logoLabel.textColor = MMColorBrown;
		[self.view addSubview:logoLabel];
		
		self.imageNode = nil;
		
		//初始化相机
		self.imagePickerController = [UIImagePickerController new];
		self.imagePickerController.delegate = self;
		self.imagePickerController.allowsEditing = YES;
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self dealWithUIAboutImage:self.imageNode];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	WS(ws);
	[self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(ws.view);
		make.left.mas_equalTo(ws.view);
		make.right.mas_equalTo(ws.view);
		make.height.mas_equalTo(KDeviceHeight/8);
	}];
	[self.uploadView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.top.mas_equalTo(ws.topView.mas_bottom).with.offset(20);
		make.centerX.mas_equalTo(ws.view);
		make.width.and.height.mas_equalTo(kDeviceWidth * 2/3);
	}];
	[self.uploadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(ws.uploadView);
		make.width.and.bottom.mas_equalTo(ws.uploadView);
		make.height.mas_equalTo(kDeviceWidth/12);
	}];
	[self.uploadButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.equalTo(ws.uploadView);
	}];
	[self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.mas_equalTo(kDeviceWidth * 2/3);
		make.height.mas_equalTo(KDeviceHeight/14);
		make.centerX.mas_equalTo(ws.view);
		make.top.mas_equalTo(ws.uploadView.mas_bottom).with.offset(KDeviceHeight/20);
	}];
	[self.aboutButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.size.mas_equalTo(ws.playButton);
		make.centerX.mas_equalTo(ws.view);
		make.top.mas_equalTo(ws.playButton.mas_bottom).with.offset(10);
	}];
	[self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.bottom.mas_equalTo(ws.view);
		make.left.mas_equalTo(ws.view);
		make.right.mas_equalTo(ws.view);
		make.height.mas_equalTo(30);
	}];
}

-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	if (!APPALL.puzzleImage)
		return;
	imageNode = [APPALL.puzzleImage copy];
	[self dealWithUIAboutImage:imageNode];
	self.uploadView.image = imageNode;
}

-(void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
//	[APPALL.mySoundManager stopMusic:YES];
}

-(void)dealWithUIAboutImage:(UIImage*)nextImage {
	if (nextImage == nil) {
		[uploadButton setImage:[UIImage imageNamed:@"upload"] forState:UIControlStateNormal];
		uploadLabel.text = mmsloc("chooseLevel");
	} else {
		[uploadButton setImage:[UIImage imageNamed:@"upload2"] forState:UIControlStateNormal];
		uploadLabel.text = mmsloc("reselect");
	}
}

-(void)startPressed:(id)sender
{
	if (0) {
		APPALL.puzzleImage = [UIImage imageNamed:@"001"];
		PuzzleController *puzzle = [[PuzzleController alloc] init];
		[puzzle loadPuzzle];
		[SVProgressHUD dismiss];
		[self.navigationController pushViewController:puzzle animated:YES];
		return;
	}
	if (self.imageNode == nil) {
		NSLog(@"emputy....");
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:mmsloc("chooseLevel") message:mmsloc("chooseImageFirst") preferredStyle:UIAlertControllerStyleAlert];
		// 设置警告响应事件
		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("iknow") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
		}];
		[alert addAction:cancelAction];
		// 展示警告控制器
		dispatch_async(dispatch_get_main_queue(), ^{
			[self presentViewController:alert animated:YES completion:nil];
		});
		return;
	}
	GameSettingViewController *cacheView = [[GameSettingViewController alloc] initWithDelegate:self];
	[APPALL.myKGModal showWithContentViewController:cacheView andAnimated:YES];
}

-(void)backPressed:(id)sender {
	[APPALL.myKGModal hideAnimated:YES];
}
-(void)nextPressed:(id)sender {
	[APPALL.mySoundManager playSound:@"enter.caf"];
	[SVProgressHUD show];
	[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeFired:) userInfo:nil repeats:NO];
}

-(void)timeFired:(id)sender
{
	[APPALL.myKGModal hideAnimated:YES];
	PuzzleController *puzzle = [[PuzzleController alloc] init];
	[puzzle loadPuzzle];
	[SVProgressHUD dismiss];
	[self.navigationController pushViewController:puzzle animated:YES];
}

-(void)uploadPressed:(id)sender {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:mmsloc("chooseLevel") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
	// 设置警告响应事件
	WS(ws)
	UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:mmsloc("menuCamera") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		// 设置照片来源为相机
		ws.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
		// 设置进入相机时使用前置或后置摄像头
		ws.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
		// 展示选取照片控制器
		[self presentViewController:ws.imagePickerController animated:YES completion:^{}];
	}];
	UIAlertAction *photosAction = [UIAlertAction actionWithTitle:mmsloc("menuAlbum") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		ws.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		[self presentViewController:ws.imagePickerController animated:YES completion:^{}];
	}];
	UIAlertAction *historyAction = [UIAlertAction actionWithTitle:mmsloc("menuHistory") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		BigLevelsVController *puzzle = [[BigLevelsVController alloc] init];
		[self.navigationController pushViewController:puzzle animated:YES];
	}];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("menuCancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
	}];
	// 判断是否支持相机
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
		// 添加警告按钮
		[alert addAction:cameraAction];
	}
	[alert addAction:photosAction];
	[alert addAction:historyAction];
	[alert addAction:cancelAction];
	// 展示警告控制器
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:alert animated:YES completion:nil];
	});
}

-(void)aboutPressed:(id)sender
{
	BigAboutVController *vc = [[BigAboutVController alloc] init];
	[self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIImagePickerControllerDelegate
// 完成图片的选取后调用的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissViewControllerAnimated:YES completion:nil];
	UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
	APPALL.puzzleImage = [tooles cropSquareImage:image];
	DBImageItem *cacheItem = [[DBImageItem alloc] init];
	cacheItem.imageDate = [NSDate date];
	cacheItem.imageData = UIImageJPEGRepresentation(APPALL.puzzleImage, 1.0f);
	[cacheItem saveToDB];
	[APPALL.myImageArray insertObject:cacheItem atIndex:0];
	if (APPALL.myImageArray.count > SAVEITEM) {
		[DBImageItem deleteWithWhere:[NSString stringWithFormat:@"imageDate not in (select imageDate from DBImageItem order by imageDate desc limit %d)", SAVEITEM]];
		APPALL.myImageArray = [DBImageItem searchWithWhere:nil orderBy:@"imageDate desc" offset:0 count:SAVEITEM];
	}
	NSLog(@"aaaaaaa:%ld", APPALL.myImageArray.count);
	imageNode = [APPALL.puzzleImage copy];
	[self dealWithUIAboutImage:imageNode];
	self.uploadView.image = imageNode;
}

// 取消选取调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	NSLog(@"cancel ....");
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
