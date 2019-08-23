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

@end

@implementation MainGameViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = @"第0天";
		
		self.timeLabel = [UILabel new];
		self.timeLabel.text = @"10月1日 星期一";
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
}

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	NSLog(@"did appear....bbb, %ld", APPALL.gameStartFlag);
	if (APPALL.gameStartFlag < 0) {
		return;
	}
}

@end
