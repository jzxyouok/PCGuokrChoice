//
//  DetailViewController.m
//  GuokrChoiceness
//
//  Created by pczhu on 16/5/11.
//  Copyright © 2016年 pc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"nav_back.png" highImage:@"nav_back_press.png"];
    
    UIButton *button = (UIButton *)self.navigationItem.leftBarButtonItem.customView;
    button.contentEdgeInsets = UIEdgeInsetsMake(0,-5, 0, 0);
    
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
