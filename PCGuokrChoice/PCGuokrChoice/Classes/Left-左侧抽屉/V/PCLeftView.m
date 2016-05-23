//
//  PCLeftView.m
//  GuokrChoiceness
//
//  Created by mac on 16/5/11.
//  Copyright © 2016年 pc. All rights reserved.
//

#import "PCLeftView.h"
#import "PCHomeViewController.h"

#define PreviousIndexPath @"previousIndexPath"

#define LeftWidth [UIScreen mainScreen].bounds.size.width / 3 * 2
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface PCLeftView()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *leftViewTitleArray;

@property (nonatomic, strong) NSArray *titleImageArray;

@property (nonatomic, strong) NSArray *titleImagePressArray;



@end


@implementation PCLeftView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

/**
 *  初始化view
 */
- (void)initViews{
    
    
    //初始化数据
    _leftViewTitleArray = [NSArray arrayWithObjects:@"首页",@"我的收藏",@"设置",@"请吐槽",@"来个好评吧!", nil];
    
    _titleImageArray = [NSArray arrayWithObjects:@"menu_home",@"menu_collection",@"menu_settings",@"menu_mail",@"menu_comments",nil];
    _titleImagePressArray = [NSArray arrayWithObjects:@"menu_home_press",@"menu_collection_press",@"menu_settings_press",@"menu_mail_press",@"menu_comments_press",nil];

    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, LeftWidth, SCREEN_HEIGHT - 20) style:UITableViewStylePlain];
    _leftTableView.backgroundColor = [UIColor clearColor];
    _leftTableView.dataSource = self;
    _leftTableView.delegate = self;
    _leftTableView.bounces = NO;
    _leftTableView.showsVerticalScrollIndicator = NO;
    _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self addSubview:_leftTableView];
    
}


#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _leftViewTitleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifer = @"leftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    //设置cell
    cell.imageView.image = (indexPath.row == 0) ? [UIImage imageNamed:_titleImagePressArray[indexPath.row]] : [UIImage imageNamed:_titleImageArray[indexPath.row]];
    cell.textLabel.text = _leftViewTitleArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.textColor = (indexPath.row == 0) ? [UIColor whiteColor] : [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1.0];
    cell.accessoryView = (indexPath.row == 0) ?[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_arrow_press"]] : [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_arrow"]];
    cell.backgroundColor = [UIColor clearColor];
    
    //cell选中时候的背景
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:38 / 255.0 green:38 / 255.0 blue:38 / 255.0 alpha:1.0];
    
    // 默认选中首行
    [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
    
    return cell;
}


#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:_titleImagePressArray[indexPath.row]];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_arrow_press"]];
    cell.textLabel.textColor = [UIColor whiteColor];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectedInLeftViewAtIndexOfRow:)]) {
        [self.delegate selectedInLeftViewAtIndexOfRow:indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    cell.imageView.image = [UIImage imageNamed:_titleImageArray[indexPath.row]];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_arrow"]];
    cell.textLabel.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1.0];
}



@end
















