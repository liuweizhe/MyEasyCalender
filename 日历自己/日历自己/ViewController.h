//
//  ViewController.h
//  日历自己
//
//  Created by 刘伟哲 on 2018/3/15.
//  Copyright © 2018年 刘伟哲. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *WeekArray;
@property (nonatomic, strong) NSMutableArray *TopLabelArray;
@property (nonatomic, strong) NSMutableArray * Content_DataSource;


@property (nonatomic, weak) UILabel *TopDay_Label;
@property (nonatomic, weak) UIView *WeekNum_View;

@property (nonatomic, assign) NSInteger days;
@property (nonatomic, assign) NSInteger firstDays;

@property (nonatomic, strong) NSDate *currentDate;

@property (nonatomic, strong) UICollectionView * CollectionView;


@end

