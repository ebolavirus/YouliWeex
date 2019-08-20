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

@end

@implementation YLStartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
		
        UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"game_bg.png"]];
        bgView.contentMode = UIViewContentModeScaleToFill;
        bgView.frame = CGRectMake(0, 0, kDeviceWidth, KDeviceHeight - 64);
        [self.view addSubview:bgView];
		
        // Custom initialization
        UIImageView *dnView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meadow"]];
        dnView.contentMode = UIViewContentModeScaleToFill;
        dnView.frame = CGRectMake(0,KDeviceHeight - 64 - 109,kDeviceWidth,109);
        [self.view addSubview:dnView];
        
        // Custom initialization
        UIImageView *shinyView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_shine"]];
        shinyView.contentMode = UIViewContentModeScaleToFill;
        shinyView.frame = CGRectMake(0,(KDeviceHeight - 64)/2 - 160,320,320);
        [self.view addSubview:shinyView];
        
        // Custom initialization
        UIImageView *topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_name"]];
        topView.contentMode = UIViewContentModeScaleAspectFit;
        topView.frame = CGRectMake(0, (KDeviceHeight - 64)/20, 320,145);
        [self.view addSubview:topView];
        
        FUIButton *startButton = [[FUIButton alloc] initWithFrame:CGRectMake(100, (KDeviceHeight - 64)/2 - 20 - 4, 120, 40)];
        startButton.buttonColor = [UIColor orangeColor];
        startButton.shadowColor = [UIColor orangeColor];
        startButton.shadowHeight = 3.0f;
        startButton.cornerRadius = 6.0f;
        [startButton setTitle:@"开始游戏" forState:UIControlStateNormal];
        [startButton addTarget:self action:@selector(startPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:startButton];
        
        FUIButton *selectButton = [[FUIButton alloc] initWithFrame:CGRectMake(100, (KDeviceHeight - 64)/2 + 60 + 12, 120, 40)];
        selectButton.buttonColor = [UIColor turquoiseColor];
        selectButton.shadowColor = [UIColor greenSeaColor];
        selectButton.shadowHeight = 3.0f;
        selectButton.cornerRadius = 6.0f;
        [selectButton setTitle:@"关于软件" forState:UIControlStateNormal];
        [selectButton addTarget:self action:@selector(selectPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:selectButton];
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
        UILabel *logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, KDeviceHeight - 64 - 50, kDeviceWidth, 50)];
        logoLabel.numberOfLines = 0;
        logoLabel.text = @"http://www.qianyanclub.com";
        logoLabel.textAlignment = NSTextAlignmentCenter;
        logoLabel.textColor = [UIColor blackColor];
        [self.view addSubview:logoLabel];
        
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
	[APPALL.mySoundManager playMusic:@"2205001.mp3" looping:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [APPALL.mySoundManager stopMusic:YES];
}

-(void)startPressed:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)selectPressed:(id)sender
{
//    [tooles showGlobalAlertWithTitle:@"" andMsg:@"版本：1.0.0\n作者：埃博拉病毒\nQQ:570259952\n网址:http://www.xiaoluoli.com" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
}

-(void)historyPressed:(id)sender
{
//    BigHistoryVController *vc = [[BigHistoryVController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}

@end
