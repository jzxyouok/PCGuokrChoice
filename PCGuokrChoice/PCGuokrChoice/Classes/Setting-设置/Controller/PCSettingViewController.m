//
//  PCSettingViewController.m
//  GuokrChoiceness
//
//  Created by mac on 16/3/21.
//  Copyright © 2016年 pc. All rights reserved.
//

#import "PCSettingViewController.h"

@interface PCSettingViewController ()

/** 开关状态 */
@property (nonatomic, assign) BOOL switchIsOn;

@end

@implementation PCSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.autoresizingMask =  UIViewAutoresizingFlexibleWidth;
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (section == 2) ? 2 : 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"点击登录";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"自动离线下载";
//        UISwitch *downloadOffline = [[UISwitch alloc] init];
//        downloadOffline.on = self.switchIsOn;
//        [downloadOffline addTarget:self action:@selector(onOrOff:) forControlEvents:UIControlEventValueChanged];
//        downloadOffline.centerY = cell.centerY;
//        downloadOffline.x = self.view.width - downloadOffline.width - 10;
//        [cell.contentView addSubview:downloadOffline];
    } else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"大字体";
        } else{
            cell.textLabel.text = @"清理缓存";
            cell.detailTextLabel.text = @"0 M";
        }
    } else{
        cell.textLabel.text = @"关于我们";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    return cell;
}

- (void)onOrOff:(UISwitch *)mySwitch{
    self.switchIsOn = mySwitch.on;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    // 创建footer
    UIView *footer = [[UIView alloc] init];
    footer.width = self.view.width;

    // 设置文字
    if (section == 1){
        // 创建label
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:13];
        label.text = @"打开后，WiFi下将自动下载最新20篇文章供离线查看";
        label.frame = CGRectMake(0, 0, footer.width, 25);
        label.textAlignment = NSTextAlignmentCenter;
        [footer addSubview:label];
    }
    return footer;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return (section == 1) ? 25.0f : 10.0f;
}

@end



