//
//  PCHomeViewController.m
//  GuokrChoiceness
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 pc. All rights reserved.
//

#import "PCHomeViewController.h"
#import <IIViewDeckController.h>
#import "DetailViewController.h"
#import "PCWaterFlowLayout.h"


@interface PCHomeViewController () <UICollectionViewDataSource,UICollectionViewDelegate,PCWaterFlowLayoutDelegate>

@end

@implementation PCHomeViewController

static NSString * const PCArticleId = @"article";

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning why->设置成 self.view.backgroundColor 无效
    //设置导航栏背景颜色
//    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 252.0 alpha:1.0];
    
    [self setupLayout];
    
//    NSLog(@"%@",NSTemporaryDirectory());
//    NSLog(@"%@",NSHomeDirectory());
    
}

- (void)setupLayout{
    
    // 创建布局
    PCWaterFlowLayout *layout = [[PCWaterFlowLayout alloc] init];
    layout.delegate = self;
    
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:PCArticleId];

}



#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PCArticleId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}


#pragma mark - <PCWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(PCWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    CGFloat h = 100 + arc4random_uniform(100);
    
//    NSLog(@"h----%f",h);
    
    return h;
    
}





//
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    DetailViewController *detailVC = [[DetailViewController alloc] init];
//    [self.navigationController pushViewController:detailVC animated:YES];
//}



//预取图片大小:
//http://www.cocoachina.com/bbs/read.php?tid=165823







@end
