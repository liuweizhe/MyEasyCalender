//
//  ViewController.m
//  日历自己
//
//  Created by 刘伟哲 on 2018/3/15.
//  Copyright © 2018年 刘伟哲. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}
- (void)configView{
    self.view.backgroundColor = Color(244, 244, 244);
    self.TopLabelArray = [NSMutableArray array];
    self.WeekArray = [NSMutableArray arrayWithObjects:@"日",@"一",@"二",@"三",@"四",@"五",@"六", nil];
    self.Content_DataSource = [NSMutableArray new];
    [self configTopView];
    [self configCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
