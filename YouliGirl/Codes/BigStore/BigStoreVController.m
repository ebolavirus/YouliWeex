////
////  BigStoreVController.m
////  Tomorrow
////
////  Created by sunmingming on 14/12/6.
////  Copyright (c) 2014年 Ebola. All rights reserved.
////
//
//#import "BigStoreVController.h"
//
//#import <DNSInAppPurchaseManager.h>
//
////Replace this with
//static NSString * const kMyAppID0 = @"coins600";
//static NSString * const kMyAppID1 = @"coins1200";
//static NSString * const kMyAppID2 = @"coins2500";
//static NSString * const kMyAppID3 = @"coins4000";
//static NSString * const kMyAppID4 = @"coins5000";
//static NSString * const kMyAppID5 = @"coins10000";
//
//@interface BigStoreVController()<FUIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate,DNSInAppPurchaseManagerDelegate>
//
//@property(nonatomic,strong) UIButton *scoreButton;
//
//typedef enum {
//    ECoin600 = 1,
//    ECoin1200,
//    ECoin2500,
//    ECoin4000,
//    ECoin5000,
//    ECoin10000,
//}ECoinTag;
//@property(nonatomic,assign) int myCoinTag;
//
//@property(nonatomic,strong) UITableView *mainTableView;
//
//@property (nonatomic, strong) DNSInAppPurchaseManager *iapManager;
//@property (nonatomic, strong) NSArray *availableProducts;
//
//@property (nonatomic, strong) NSString *myNowAppId;
//
//typedef enum {
//    EStoreNotReached = 0,
//    EStoreCanPay,
//    EStoreCanNotPay,
//	EStoreReachFailed,
//}EReachedTag;
//@property (nonatomic, assign) int storePayStatus;
//
//@end
//
//@implementation BigStoreVController
//
//@synthesize scoreButton;
//@synthesize myNowAppId;
//@synthesize storePayStatus;
//
//-(id)init
//{
//    self = [super init];
//    if(self)
//    {
//    }
//    return self;
//}
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//        if([tooles DeviceVersion]>=7.0f){
//            self.edgesForExtendedLayout = UIRectEdgeNone;
//        }
//        
//        self.storePayStatus = EStoreNotReached;
//        [APPALL.mySoundManager prepareToPlayWithSound:@"BuyCoin4.caf"];
//        
//        // Custom initialization
//        UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_game"]];
//        bgView.contentMode = UIViewContentModeScaleToFill;
//        bgView.frame = CGRectMake(0, 0, kDeviceWidth, KDeviceHeight - 64);
//        [self.view addSubview:bgView];
//        
//        UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text_store"]];
//        titleView.contentMode = UIViewContentModeScaleAspectFit;
//        titleView.frame = CGRectMake(0,0, 320,32);
//        self.navigationItem.titleView = titleView;
//        
//        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//        [backButton setImage:[UIImage imageNamed:@"btn_back_circle"] forState:UIControlStateNormal];
//        [backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//        
//        self.scoreButton = [[UIButton alloc] initWithFrame:CGRectMake(kDeviceWidth - 10 - 112, 10, 112, 32)];
//        scoreButton.titleLabel.font = [UIFont fontWithName:@"American Typewriter" size:14.0f];
//        [scoreButton setTitle:[NSString stringWithFormat:@"%ld",APPALL.mySaveItem.myCoin] forState:UIControlStateNormal];
//        [scoreButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 5, 0, 0)];
//        [scoreButton setBackgroundImage:[UIImage imageNamed:@"btn_add_coins"] forState:UIControlStateNormal];
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:scoreButton];
//        
//        //add 6 buttons.
//        self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, kDeviceWidth - 20, KDeviceHeight - 64) style:UITableViewStylePlain];
//        self.mainTableView.dataSource = self;
//        self.mainTableView.delegate = self;
//        self.mainTableView.backgroundColor = [UIColor clearColor];
//        self.mainTableView.backgroundView = nil;
//        self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [self.view addSubview:self.mainTableView];
//    
//		self.myNowAppId = kMyAppID0;
//		self.iapManager = [[DNSInAppPurchaseManager alloc] init];
//		self.iapManager.delegate = self;
//		[self setupStore];
//    }
//    return self;
//}
//
//#pragma mark - In-App Purchase setup
//-(void)setupStore
//{
//    if ([self.iapManager canMakePurchases]) {
//        NSLog(@"-----------can pay--------------");
//        
//        //Run on background thread - delegate forces callbacks on main thread.
//        NSOperationQueue *background = [[NSOperationQueue alloc] init];
//        __block DNSInAppPurchaseManager *blockManager = self.iapManager;
//        [background addOperationWithBlock:^{
//            //Gets your store items.
//            [blockManager loadStoreWithIdentifiers:[NSSet setWithObjects:kMyAppID0,kMyAppID1,kMyAppID2,kMyAppID3,kMyAppID4,kMyAppID5,nil]];
//        }];
//    } else {
//        NSLog(@"-----------cannot pay--------------");
//    }
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (void)dealloc
//{
////	self.iapManager ＝ nil;
//}
//
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    [APPALL.mySoundManager playMusic:@"theme_coin.mp3" looping:YES];
//}
//
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    [APPALL.mySoundManager stopMusic:YES];
//}
//
//- (BOOL)shouldAutorotate
//{
//    return YES;
//}
//
//- (void)alertView:(FUIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if(buttonIndex <= 0)
//        return;
//    //    switch (self.myAlertTag) {
//    //        case EButtonHelp:
//    //        {
//    //            APPALL.mySaveItem.myCoin -= 50;
//    //            [APPALL.mySaveItem saveToDB];
//    //            [scoreButton setTitle:[NSString stringWithFormat:@"%d",APPALL.mySaveItem.myCoin] forState:UIControlStateNormal];
//    //            self.noteStr = [self.answerView getFirstWrongStr];
//    //            [self.charButtonCView reloadData];
//    //        }
//    //            break;
//    //        case EButtonBuy:
//    //        {
//    //            [self buyPressed:nil];
//    //        }
//    //            break;
//    //        default:
//    //            break;
//    //    }
//}
//
//-(void)backButtonPressed:(id)sender
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//#pragma mark - TableView datasource
//- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Just to retain the old version
//	switch(storePayStatus)
//	{
//	case EStoreNotReached:
//	case EStoreCanNotPay:
//	case EStoreReachFailed:
//		return 1;
//	case EStoreCanPay:
//		return self.availableProducts.count;
//	default:
//		return 0;
//	}
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 70.0f;
//}
//
//- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
//    static NSString *CellIdentifier = @"aboutCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.backgroundColor = [UIColor clearColor];
//        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_store_info"]];
//    }
//    if(storePayStatus != EStoreCanPay)
//    {
//        cell.imageView.image = nil;
//		if(storePayStatus == EStoreNotReached)
//		{
//			cell.textLabel.text = mmsloc("linkingStore");
//			cell.detailTextLabel.text = @"linking AppStore...";
//		}
//		else if(storePayStatus == EStoreCanNotPay)
//		{
//			cell.textLabel.text = mmsloc("cannotLinkStore");
//			cell.detailTextLabel.text = @"can not link AppStore";
//		}
//		else if(storePayStatus == EStoreReachFailed)
//		{
//			cell.textLabel.text = mmsloc("failedLinkStore");
//			cell.detailTextLabel.text = @"linking AppStore failed";
//		}
//        return cell;
//    }
//	int cacheIndex = indexPath.row > 5? 5 : (int)indexPath.row;
//    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"coin%d",cacheIndex]];
//	SKProduct *cacheProduct = [self.availableProducts objectAtIndex:indexPath.row];
//	cell.textLabel.text = cacheProduct.localizedTitle;
//	cell.detailTextLabel.text = cacheProduct.localizedDescription;
//    return cell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(storePayStatus != EStoreCanPay)
//        return;
//    SKProduct *cacheProduct = [self.availableProducts objectAtIndex:indexPath.row];
//    self.myNowAppId = cacheProduct.productIdentifier;
//    
//    typeof(self) __weak weakSelf = self;
//    NSOperationQueue *background = [[NSOperationQueue alloc] init];
//    [background addOperationWithBlock:^{
//        [weakSelf.iapManager purchaseProduct:cacheProduct];
//    }];
//	//[self.iapManager restoreExistingPurchases];
//}
//
//#pragma mark - In App Purchase Manager Delegate
//-(void)productRetrievalFailed:(NSString *)errorMessage
//{
//    self.storePayStatus = EStoreReachFailed;
//    [self.mainTableView reloadData];
//}
//
//-(void)productsRetrieved:(NSArray *)products
//{
//    NSLog(@"--retrieved--");
//    if (products) {
//        //Store your available products.
//        self.availableProducts = [products sortedArrayUsingComparator:^NSComparisonResult(SKProduct *obj1, SKProduct *obj2) {
//            if(obj1.price.intValue > obj2.price.intValue)
//                return (NSComparisonResult)NSOrderedDescending;
//            if(obj1.price.intValue < obj2.price.intValue)
//                return (NSComparisonResult)NSOrderedAscending;
//            return (NSComparisonResult)NSOrderedSame;
//        }];
//        if(products.count)
//        {
//            self.storePayStatus = EStoreCanPay;
//            [self.mainTableView reloadData];
//        }
//        else
//        {
//            self.storePayStatus = EStoreReachFailed;
//            [self.mainTableView reloadData];
//        }
//    } else {
////		[tooles showAlertView];
//        self.storePayStatus = EStoreCanNotPay;
//        [self.mainTableView reloadData];
//    }
//}
//
//-(void)purchaseFailed:(NSString *)errorMessage
//{
//    NSLog(@"--failed-- %@",errorMessage);
////    [tooles showAlertView];
//    [tooles showGlobalAlertWithTitle:@"购买失败" andMsg:errorMessage delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil];
//}
//
//-(void)purchaseCancelled
//{
//    NSLog(@"--cancelled--");
////    [tooles showAlertView];
//}
//
//-(void)purchaseSucceeded:(NSString *)productIdentifier
//{
//    NSLog(@"--succeed-- %@",productIdentifier);
//    if(!productIdentifier.length)
//    {
//        [tooles showGlobalAlertWithTitle:@"购买失败" andMsg:@"购买参数错误。" delegate:nil cancelButtonTitle:@"好吧" otherButtonTitles:nil];
//        return;
//    }
//    int addSumCoin = 0;
//    if([productIdentifier isEqualToString:kMyAppID0])
//    {
//        addSumCoin = 600;
//    }
//    else if([productIdentifier isEqualToString:kMyAppID1])
//    {
//        addSumCoin = 1300;
//    }
//    else if([productIdentifier isEqualToString:kMyAppID2])
//    {
//        addSumCoin = 2750;
//    }
//    else if([productIdentifier isEqualToString:kMyAppID3])
//    {
//        addSumCoin = 4500;
//    }
//    else if([productIdentifier isEqualToString:kMyAppID4])
//    {
//        addSumCoin = 5800;
//    }
//    else if([productIdentifier isEqualToString:kMyAppID5])
//    {
//        addSumCoin = 12000;
//    }
//    [APPALL.mySoundManager playSound:@"BuyCoin4.caf"];
//    APPALL.mySaveItem.myCoin += addSumCoin;
//    [scoreButton setTitle:[NSString stringWithFormat:@"%ld",APPALL.mySaveItem.myCoin] forState:UIControlStateNormal];
//    [APPALL.mySaveItem saveToDB];
//    [tooles showGlobalAlertWithTitle:@"购买成功" andMsg:[NSString stringWithFormat:@"恭喜您获得了%d金币！",addSumCoin] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//}
//
//-(void)restorationSucceeded
//{
//    NSLog(@"--restore succeed--");
//    //not used
//}
//
//-(void)restorationFailedWithError:(NSString *)errorMessage
//{
//    NSLog(@"--restore failed-- %@",errorMessage);
////  not used;
//}
//
//@end
