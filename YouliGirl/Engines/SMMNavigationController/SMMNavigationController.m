//
//  SMMNavigationController.m
//  RentCar
//
//  Created by sunmingming on 14-4-1.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import "SMMNavigationController.h"
#import "tooles.h"

@interface SMMNavigationController ()

@end

@implementation SMMNavigationController

-(id)initWithRootViewController:(UIViewController *)rootViewController
{
	self = [super initWithRootViewController:rootViewController];
	if (self) {
		// Custom initialization
		self.navigationBar.barStyle = UIBarStyleBlack;
		[self.navigationBar configureFlatNavigationBarWithColor:MMColorBrown];
		rootViewController.edgesForExtendedLayout = UIRectEdgeNone;
		self.navigationBar.tintColor = [UIColor whiteColor];
	}
	return self;
}

@end
