//
//  PCBaseViewController.m
//  GuokrChoiceness
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 pc. All rights reserved.
//

#import "PCBaseViewController.h"
#import <IIViewDeckController.h>
#import "PCHomeViewController.h"
#import "PCLikeViewController.h"
#import "PCSettingViewController.h"
#import "PCMailViewController.h"

@interface PCBaseViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation PCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupAllChildVc];
    
    //注册选中左视图cell的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(rootViewCloseLeftView:) name:CloseLeftView object:nil];
    
    NSInteger second = [[NSDate date] timeIntervalSince1970];
    NSLog(@"second---%ld",second);
}

- (void)setupNav{
    self.view.backgroundColor = [UIColor whiteColor];
#warning note--防止view延伸到屏幕左上角
    //    self.edgesForExtendedLayout = UIRectEdgeNone;//导航栏穿透效果
    
#warning note--防止scrollView延伸到屏幕左上角
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    // 设置导航栏标题
    UILabel *label = [[UILabel alloc] init];
    label.text = @"果壳精选";
    label.font = [UIFont systemFontOfSize:18];
    [label sizeToFit];
    label.textAlignment = NSTextAlignmentCenter;
    self.titleLabel  = label;
    self.navigationItem.titleView = label;
    self.navigationController.navigationBar.translucent = NO;//去掉导航栏半透明效果
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(leftBtnClick) image:@"nav_menuBtn" highImage:@"nav_menuBtn_press"];
}

- (void)setupAllChildVc{
    //添加为子控制器
    PCHomeViewController *homeVC = [[PCHomeViewController alloc] init];
    [self setupChildVC:homeVC];
    [self.view addSubview:homeVC.view];
    
    [self setupChildVC:[[PCLikeViewController alloc] init]];
    
    [self setupChildVC:[[PCSettingViewController alloc] initWithStyle:UITableViewStyleGrouped]];
    
    [self setupChildVC:[[PCMailViewController alloc] init]];
}

- (void)setupChildVC:(UIViewController *)vc{
    [self addChildViewController:vc];
    vc.view.frame = self.view.bounds;
}


- (void)leftBtnClick{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}


#pragma mark - rootViewController setup
//通知的方法,根据左视图选中行数切换center的view
//=============================================================================================
- (void)rootViewCloseLeftView:(NSNotification*)noti{
    
    NSDictionary *dict = noti.object;
    NSInteger row = [[dict objectForKey:@"row"] integerValue];
    
    NSLog(@"%ld",(long)row);
    
    for (UIView *view in self.view.subviews) {
        [view removeFromSuperview];
    }
    
    switch (row) {
        case kPCControllerHome://0.首页
            [self changeViewWithIndex:kPCControllerHome andTitle:@"果壳精选"];
            break;
            
        case kPCControllerCollection://1.收藏
            [self changeViewWithIndex:kPCControllerCollection andTitle:@"我的收藏"];
            break;
            
        case kPCControllerSetting://2.设置
            [self changeViewWithIndex:kPCControllerSetting andTitle:@"设置"];
            break;
            
        default ://3.吐槽(建议)
            [self changeViewWithIndex:kPCControllerMail andTitle:@"请吐槽"];
            break;
    }
    
    //关闭左视图
    [self.viewDeckController closeLeftViewAnimated:YES];
}

- (void)changeViewWithIndex:(NSInteger)index andTitle:(NSString *)title{
    [self.view addSubview:self.childViewControllers[index].view];
    self.titleLabel.text = title;
}

- (void)dealloc
{
    //    移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:CloseLeftView object:nil];
}



@end



















