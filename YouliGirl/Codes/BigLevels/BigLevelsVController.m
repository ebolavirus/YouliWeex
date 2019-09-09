//
//  BigLevelsVController.m
//  Tomorrow
//
//  Created by sunmingming on 14-9-28.
//  Copyright (c) 2014年 Ebola. All rights reserved.
//

#import "BigLevelsVController.h"
#import <KGModal.h>

@interface BigLevelsVController()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,VCIAPDelegate>

@property(nonatomic,strong) UICollectionView *cacheCollView;

@end

@implementation BigLevelsVController

@synthesize cacheCollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		self.title = mmsloc("titleHistory");
		self.view.backgroundColor = MMColorOrange;
		
		UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
		[flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
		flowLayout.minimumLineSpacing = 0;
		flowLayout.minimumInteritemSpacing = 0;
		self.cacheCollView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0,kDeviceWidth,KDeviceHeight - 64) collectionViewLayout:flowLayout];
		cacheCollView.tag = 0;
		cacheCollView.dataSource = self;
		cacheCollView.delegate = self;
		cacheCollView.backgroundColor = [UIColor clearColor];
		UINib *cellNib = [UINib nibWithNibName:@"MainCollectionCell" bundle:nil];
		[cacheCollView registerNib:cellNib forCellWithReuseIdentifier:@"MainCID"];
		[self.view addSubview:cacheCollView];
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
	NSLog(@"...111");
	[super viewWillAppear:animated];
	[cacheCollView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
	return 1;
//	return APPALL.myImageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *cellIdentifier = @"MainCID";
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
//	UILabel *lab1 = (UILabel *)[cell viewWithTag:1];
//	UIImageView *img2 = (UIImageView *)[cell viewWithTag:2];
//	DBImageItem *cacheItem = [APPALL.myImageArray objectAtIndex:indexPath.row];
//	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
//	lab1.text = [dateFormatter stringFromDate:cacheItem.imageDate];
//	img2.image = [UIImage imageWithData:cacheItem.imageData];
	return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(160,200);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
	return CGSizeMake(0,0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
	return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	///////////////
//	DBImageItem *cacheItem = [APPALL.myImageArray objectAtIndex:indexPath.row];
	[self.navigationController popViewControllerAnimated:YES];
}

-(void)gongdePressed:(id)sender{
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:mmsloc("gameBuyTitle") message:mmsloc("gameBuyContent") preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("gameBuyCancel") style:UIAlertActionStyleCancel handler:nil];
	UIAlertAction *ok1Action = [UIAlertAction actionWithTitle:mmsloc("gameBuyOK") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[SVProgressHUD showWithStatus:@"..."];
		APPALL.myIAPDelegate = self;
		NSString *iapID = kIAPBuy;
		[APPALL startToIAP:iapID];
	}];
	UIAlertAction *resAction = [UIAlertAction actionWithTitle:mmsloc("gameBuyRestore") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
		[SVProgressHUD showWithStatus:@"..."];
		APPALL.myIAPDelegate = self;
		NSString *iapID = kIAPBuy;
		[APPALL startToIAP:iapID];
	}];
	[vc addAction:ok1Action];
	[vc addAction:resAction];
	[vc addAction:cancelAction];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:vc animated:NO completion:nil];
	});
}

- (void)VCIAPSucceed:(NSString*)aSucc{
	[SVProgressHUD dismiss];
	APPALL.mySaveItem.bought = YES;
	[APPALL.mySaveItem saveToDB];
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:mmsloc("paySuccess") preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("OK") style:UIAlertActionStyleCancel handler:nil];
	[vc addAction:cancelAction];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:vc animated:NO completion:nil];
	});
}

- (void)VCIAPFailed:(NSString*)aSucc{
	[SVProgressHUD dismiss];
	UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"" message:aSucc preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:mmsloc("OK") style:UIAlertActionStyleCancel handler:nil];
	[vc addAction:cancelAction];
	dispatch_async(dispatch_get_main_queue(), ^{
		[self presentViewController:vc animated:NO completion:nil];
	});
}

@end
