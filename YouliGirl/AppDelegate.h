//
//  AppDelegate.h
//  Puzzle
//
//  Created by Andrea Barbon on 19/04/12.
//  Copyright (c) 2012 Università degli studi di Padova. All rights reserved.
//  TODO
//  2.80张图片确定
//

#import <UIKit/UIKit.h>
#import <KGModal.h>
#import <SoundManager.h>
#import "DBSaveItem.h"
#import "DBImageItem.h"
#import "DBCacheItem.h"
#import <DNSInAppPurchaseManager.h>

typedef enum {
	EStoreNotReached = 0,
	EStoreCanPay,
	EStoreCanNotPay,
	EStoreReachFailed,
}EReachedTag;

static NSString * const kIAPBuy = @"unlocklevel_0";

@protocol VCIAPDelegate<NSObject>
@optional
- (void)VCIAPSucceed:(NSString*)aSucc;
- (void)VCIAPFailed:(NSString*)aSucc;
@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) DNSInAppPurchaseManager *iapManager;
@property (nonatomic, strong) NSArray *availableProducts;
@property (nonatomic, strong) NSString *myNowAppId;
@property (nonatomic, assign) int storePayStatus;

@property(strong,nonatomic) UIWindow *window;
@property(nonatomic,strong) KGModal *myKGModal;
@property(nonatomic,strong) SoundManager *mySoundManager;
@property(nonatomic,strong) UIImage *puzzleImage;

//需存储数据库
@property(nonatomic,strong) DBSaveItem *mySaveItem;
// 图片库
@property(nonatomic,strong) NSMutableArray *myImageArray;
//不需存储数据库
@property(nonatomic,strong) DBCacheItem *myCacheItem;

@property(nonatomic,assign) id<VCIAPDelegate> myIAPDelegate;
-(void)startToIAP:(NSString*)aIAP;

@end
