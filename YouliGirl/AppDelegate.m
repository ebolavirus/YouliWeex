//
//  AppDelegate.m
//  Puzzle
//
//  Created by Andrea Barbon on 19/04/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//

#import "AppDelegate.h"
#import "PuzzleController.h"

#import "SMMNavigationController.h"
#import "BigLevelsVController.h"
#import "TMStartViewController.h"

@interface AppDelegate()<DNSInAppPurchaseManagerDelegate>

@property(nonatomic,assign) BOOL enableIAP;
@property(nonatomic,strong) UIViewController *levelController;

@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize myNowAppId;
@synthesize storePayStatus;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	self.enableIAP = YES;
	self.puzzleImage = nil;
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	// Override point for customization after application launch.
	self.window.backgroundColor = MMColorWhite;
	[self.window makeKeyAndVisible];
	
	self.storePayStatus = EStoreNotReached;
	self.myNowAppId = kIAPBuy;
	self.iapManager = [[DNSInAppPurchaseManager alloc] init];
	self.iapManager.delegate = self;
	[self setupStore];
	
//	LKDBHelper *cacheHelper = [DBSaveItem getUsingLKDBHelper];
	// [cacheHelper dropAllTable];
	self.mySaveItem = [DBSaveItem searchSingleWithWhere:@"myID = 1" orderBy:@""];
	if(!self.mySaveItem) {
		NSLog(@"save not exist!");
		self.mySaveItem = [[DBSaveItem alloc] init];
		[self.mySaveItem saveToDB];
	} else {
//		NSLog(@"save exist!!! nowlevel:%ld-%ld",self.mySaveItem.myLevel,self.mySaveItem.myState);
	}
	self.myImageArray = [DBImageItem searchWithWhere:NULL orderBy:@"imageDate desc" offset:0 count:SAVEITEM];
	if(!self.myImageArray) {
		NSLog(@"image not exist!");
		self.myImageArray = [NSMutableArray array];
	} else {
		NSLog(@"image exist!!! %@",self.myImageArray);
	}
	
	
	self.myCacheItem = [[DBCacheItem alloc] init];
	
	self.myKGModal = [KGModal sharedInstance];
	[self.myKGModal setTapOutsideToDismiss:NO];
	[self.myKGModal setCloseButtonType:KGModalCloseButtonTypeNone];
	[self.myKGModal setModalBackgroundColor:[UIColor clearColor]];
	
	self.mySoundManager = [SoundManager sharedManager];
	[self.mySoundManager prepareToPlayWithSound:@"enter.caf"];
	[self.mySoundManager prepareToPlayWithSound:@"shake.wav"];
	[self.mySoundManager prepareToPlayWithSound:@"splash.mp3"];
	[self.mySoundManager setSoundVolume:self.myCacheItem.myMusic?1.0f:0.0f];
	[self.mySoundManager setMusicVolume:self.myCacheItem.myMusic?1.0f:0.0f];
	
	self.levelController = [[TMStartViewController alloc] init];
	SMMNavigationController *navLevel = [[SMMNavigationController alloc] initWithRootViewController:self.levelController];
	
	self.window.rootViewController = navLevel;
	return YES;
}

#pragma mark - In-App Purchase setup
-(void)setupStore
{
	if ([self.iapManager canMakePurchases]) {
		NSLog(@"-----------can pay--------------");
		
		//Run on background thread - delegate forces callbacks on main thread.
		NSOperationQueue *background = [[NSOperationQueue alloc] init];
		__block DNSInAppPurchaseManager *blockManager = self.iapManager;
		[background addOperationWithBlock:^{
			//Gets your store items.
			[blockManager loadStoreWithIdentifiers:[NSSet setWithObjects:kIAPBuy,nil]];
		}];
	} else {
		NSLog(@"-----------cannot pay--------------");
	}
}

-(void)startToIAP:(NSString*)aIAP{
	if(!self.enableIAP){
		[self.myIAPDelegate VCIAPSucceed:aIAP];
		return;
	}
	if(storePayStatus == EStoreNotReached){
		[self.myIAPDelegate VCIAPFailed:mmsloc("iapLinking")];
		return;
	}
	if(storePayStatus == EStoreCanNotPay){
		[self.myIAPDelegate VCIAPFailed:mmsloc("iapGetFailed")];
		return;
	}
	if(storePayStatus == EStoreReachFailed){
		[self.myIAPDelegate VCIAPFailed:mmsloc("iapLinkFailed")];
		return;
	}
	if(storePayStatus != EStoreCanPay)
		return;
	BOOL findProduct = NO;
	for (SKProduct *cacheProduct in self.availableProducts) {
		if([cacheProduct.productIdentifier isEqualToString:aIAP]){
			findProduct = YES;
			self.myNowAppId = cacheProduct.productIdentifier;
			
			typeof(self) __weak weakSelf = self;
			NSOperationQueue *background = [[NSOperationQueue alloc] init];
			[background addOperationWithBlock:^{
				[weakSelf.iapManager purchaseProduct:cacheProduct];
			}];
			break;
		}
	}
	if(!findProduct){
		[self.myIAPDelegate VCIAPFailed:mmsloc("iapNoneFailed")];
		return;
	}
}

#pragma mark - In App Purchase Manager Delegate
-(void)productRetrievalFailed:(NSString *)errorMessage
{
	self.storePayStatus = EStoreReachFailed;
}

-(void)productsRetrieved:(NSArray *)products
{
	if (products) {
		self.availableProducts = products;
		if(products.count)
		{
			self.storePayStatus = EStoreCanPay;
		}
		else
		{
			self.storePayStatus = EStoreReachFailed;
		}
	} else {
		self.storePayStatus = EStoreCanNotPay;
	}
}

-(void)purchaseFailed:(NSString *)errorMessage
{
	[self.myIAPDelegate VCIAPFailed:[NSString stringWithFormat:@"%@：%@",mmsloc("payfailed"),errorMessage]];
}

-(void)purchaseCancelled
{
	[self.myIAPDelegate VCIAPFailed:mmsloc("qxzf")];
}

-(void)purchaseSucceeded:(NSString *)productIdentifier
{
	if(!productIdentifier.length)
	{
		[self.myIAPDelegate VCIAPFailed:mmsloc("zfsb_zfcscw")];
		return;
	}
	[self.myIAPDelegate VCIAPSucceed:productIdentifier];
}

-(void)restorationSucceeded
{
	NSLog(@"--restore succeed--");
	//not used
}

-(void)restorationFailedWithError:(NSString *)errorMessage
{
	NSLog(@"--restore failed-- %@",errorMessage);
	//  not used;
}

@end
