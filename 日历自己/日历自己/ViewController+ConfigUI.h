//
//  ViewController+ConfigUI.h
//  日历自己
//
//  Created by 刘伟哲 on 2018/3/15.
//  Copyright © 2018年 刘伟哲. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (ConfigUI)
// 获取日
- (NSInteger)getCurrentDay:(NSDate *)date;
// 获取月
- (NSInteger)getCurrentMonth:(NSDate *)date;

// 获取年
- (NSInteger)getCurrentYear:(NSDate *)date;

// 一个月有多少天
- (NSInteger)getTotalDaysInMonth:(NSDate *)date;

// 每月第一天是周几
- (NSInteger)getFirstDayOfMonth:(NSDate *)date;

// 上个月
- (NSDate *)lastMonth:(NSDate *)date;

// 下个月
- (NSDate *)nextMonth:(NSDate *)date;
@end
