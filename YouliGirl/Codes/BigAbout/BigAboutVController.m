//
//  BigAboutVController.m
//  Chouqian
//
//  Created by MingmingSun on 2018/8/21.
//  Copyright © 2018年 Sunmingming. All rights reserved.
//

#import "BigAboutVController.h"
#import <FTCoreTextView.h>

@interface BigAboutVController ()<FTCoreTextViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) FTCoreTextView *coreTextView;

@end

@implementation BigAboutVController

-(id)init
{
	self = [super init];
	if (self) {
		self.title = mmsloc("helpintro");
		CGRect bounds = self.view.bounds;
		
		self.view.backgroundColor = [UIColor whiteColor];
		
		self.scrollView = [[UIScrollView alloc] initWithFrame:bounds];
		self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		
		//  Create FTCoreTextView. Everything will be rendered within this view
		self.coreTextView = [[FTCoreTextView alloc] initWithFrame:CGRectMake(bounds.origin.x + 5, bounds.origin.y, bounds.size.width - 10, bounds.size.height)];
		//        self.coreTextView = [[FTCoreTextView alloc] initWithFrame:bounds];
		self.coreTextView.backgroundColor = [UIColor clearColor];
		self.coreTextView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		
		[self.coreTextView addStyles:[self coreTextStyle]];
		self.coreTextView.text = [self textForView];
		self.coreTextView.delegate = self;
		
		[self.scrollView addSubview:self.coreTextView];
		[self.view addSubview:self.scrollView];
	}
	return self;
}

-(void)backPressed:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];
	[self.coreTextView fitToSuggestedHeight];
	[self.scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.scrollView.bounds), CGRectGetMaxY(self.coreTextView.frame))];
}

#pragma mark Load Static Content

- (NSString *)textForView
{
	NSString *localeLanguageCode = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
	if ([localeLanguageCode hasPrefix:@"zh"]) {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
		NSString *currentLanguage = [languages objectAtIndex:0];
		if ( [currentLanguage isEqualToString:@"zh-Hant"])
		{
			return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aboutzht" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
		}
		else
		{
			return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"about" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
		}
	} else {
		return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"abouten" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
	}
}

#pragma mark Styling

- (NSArray *)coreTextStyle
{
	NSMutableArray *result = [NSMutableArray array];
	
	//  This will be default style of the text not closed in any tag
	FTCoreTextStyle *defaultStyle = [FTCoreTextStyle new];
	defaultStyle.name = FTCoreTextTagDefault;	//thought the default name is already set to FTCoreTextTagDefault
	defaultStyle.font = [UIFont flatFontOfSize:16.f];
	defaultStyle.textAlignment = FTCoreTextAlignementJustified;
	[result addObject:defaultStyle];
	
	//  Create style using convenience method
	FTCoreTextStyle *titleStyle = [FTCoreTextStyle styleWithName:@"title"];
	titleStyle.font = [UIFont flatFontOfSize:40.f];
	titleStyle.paragraphInset = UIEdgeInsetsMake(20.f, 0, 25.f, 0);
	titleStyle.textAlignment = FTCoreTextAlignementCenter;
	[result addObject:titleStyle];
	
	//  Image will be centered
	FTCoreTextStyle *imageStyle = [FTCoreTextStyle new];
	imageStyle.name = FTCoreTextTagImage;
	imageStyle.textAlignment = FTCoreTextAlignementCenter;
	[result addObject:imageStyle];
	
	FTCoreTextStyle *firstLetterStyle = [FTCoreTextStyle new];
	firstLetterStyle.name = @"firstLetter";
	firstLetterStyle.font = [UIFont boldFlatFontOfSize:30.f];
	[result addObject:firstLetterStyle];
	
	//  This is the link style
	//  Notice that you can make copy of FTCoreTextStyle
	//  and just change any required properties
	FTCoreTextStyle *linkStyle = [defaultStyle copy];
	linkStyle.font = [UIFont flatFontOfSize:14.f];
	linkStyle.name = FTCoreTextTagLink;
	linkStyle.color = [UIColor blueColor];
	linkStyle.textAlignment = FTCoreTextAlignementCenter;
	[result addObject:linkStyle];
	
	FTCoreTextStyle *subtitleStyle = [FTCoreTextStyle styleWithName:@"subtitle"];
	subtitleStyle.font = [UIFont boldFlatFontOfSize:20.f];
	subtitleStyle.color = [UIColor blackColor];
	subtitleStyle.paragraphInset = UIEdgeInsetsMake(10, 0, 10, 0);
	[result addObject:subtitleStyle];
	
	//  This will be list of items
	//  You can specify custom style for a bullet
	FTCoreTextStyle *bulletStyle = [defaultStyle copy];
	bulletStyle.name = FTCoreTextTagBullet;
	bulletStyle.bulletFont = [UIFont flatFontOfSize:16.f];
	bulletStyle.bulletColor = [UIColor brownColor];
	bulletStyle.bulletCharacter = @"▶";
	bulletStyle.paragraphInset = UIEdgeInsetsMake(0, 20.f, 0, 0);
	[result addObject:bulletStyle];
	
	FTCoreTextStyle *italicStyle = [defaultStyle copy];
	italicStyle.name = @"italic";
	italicStyle.underlined = YES;
	italicStyle.font = [UIFont italicFlatFontOfSize:16.f];
	[result addObject:italicStyle];
	
	FTCoreTextStyle *boldStyle = [defaultStyle copy];
	boldStyle.name = @"bold";
	boldStyle.font = [UIFont boldFlatFontOfSize:16.f];
	[result addObject:boldStyle];
	
	FTCoreTextStyle *coloredStyle = [defaultStyle copy];
	[coloredStyle setName:@"colored"];
	[coloredStyle setColor:[UIColor redColor]];
	[result addObject:coloredStyle];
	
	return  result;
}

#pragma mark FTCoreTextViewDelegate

- (void)coreTextView:(FTCoreTextView *)acoreTextView receivedTouchOnData:(NSDictionary *)data
{
	NSURL *url = [data objectForKey:FTCoreTextDataURL];
	NSLog(@"join us!!%@",[url absoluteString]);
	if([[url absoluteString] hasPrefix:@"http://"])
	{
		// do nothing
	}
}

@end
