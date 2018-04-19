//
//  ViewController+ConfigView.m
//  日历自己
//
//  Created by 刘伟哲 on 2018/3/15.
//  Copyright © 2018年 刘伟哲. All rights reserved.
//

#import "ViewController+ConfigView.h"

@implementation ViewController (ConfigView)
- (void)configTopView{
    self.currentDate = [NSDate date];
    UIButton *preBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 40, 40)];
    [preBtn setTitle:@"<<" forState:UIControlStateNormal];
    [preBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [preBtn addTarget:self action:@selector(preBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:preBtn];
    

    
    UILabel *TopDay_Label = [[UILabel alloc] init];
    TopDay_Label.frame = CGRectMake(preBtn.x+preBtn.width, preBtn.y, ScreenWidth-preBtn.width*2-preBtn.x*2, preBtn.height);
    TopDay_Label.text = @"2010年10月20日";
    TopDay_Label.textAlignment = NSTextAlignmentCenter;
    TopDay_Label.textColor = [UIColor blackColor];
    [self.view addSubview:TopDay_Label];
    self.TopDay_Label = TopDay_Label;
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(TopDay_Label.x+TopDay_Label.width, preBtn.y, preBtn.width, preBtn.height)];
    [nextBtn setTitle:@">>" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
    UIView *WeekNum_View = [[UIView alloc] initWithFrame:CGRectMake(0, preBtn.y+preBtn.height, ScreenWidth, ScreenWidth/7)];
    WeekNum_View.backgroundColor = [UIColor brownColor];
    [self.view addSubview:WeekNum_View];
    self.WeekNum_View = WeekNum_View;

    for (int i = 0; i < self.WeekArray.count; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/7*i, 0, ScreenWidth/7, ScreenWidth/7)];
        label.text = self.WeekArray[i];
        label.textColor = Color(0, 176, 160);
        label.textAlignment = NSTextAlignmentCenter;
        [self.WeekNum_View addSubview:label];
        [self.TopLabelArray addObject:label];
    }

    
}
- (void)preBtnClick {
    
    NSDate *preDate = [self lastMonth:self.currentDate];
    [self loadWithDate:preDate];
    
    self.currentDate = preDate;
    
}

- (void)nextBtnClick {
    
    NSDate *nextDate = [self nextMonth:self.currentDate];
    [self loadWithDate:nextDate];
    
    self.currentDate = nextDate;
}
- (void)loadWithDate:(NSDate *)date {
    [self.Content_DataSource removeAllObjects];
    self.TopDay_Label.text = [NSString stringWithFormat:@"%zd年%zd月%zd日",[self getCurrentYear:date],[self getCurrentMonth:date],[self getCurrentDay:date]];

    self.days = [self getTotalDaysInMonth:date];// 获取当月有多少天
    self.firstDays = [self getFirstDayOfMonth:date];// 获取当月第一天是周几
    NSLog(@"----%ld--%ld-------",(long)self.firstDays,self.days);
    if(self.firstDays == 7){
        self.firstDays = 0;
    }
    for(int i=0;i<self.firstDays;i++){
        NSDictionary * dict = @{
                                @"number":@""
                                };
        [self.Content_DataSource addObject:dict];
    }
    
    for(int i=0;i<self.days;i++){
        NSDictionary * dict = @{
                                @"number":[NSString stringWithFormat:@"%d",i+1]
                                };
        [self.Content_DataSource addObject:dict];
    }

    [self.CollectionView reloadData];
    
}
@end
