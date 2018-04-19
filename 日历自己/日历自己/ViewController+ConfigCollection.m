//
//  ViewController+ConfigCollection.m
//  日历自己
//
//  Created by 刘伟哲 on 2018/3/15.
//  Copyright © 2018年 刘伟哲. All rights reserved.
//

#import "ViewController+ConfigCollection.h"
static NSString * TripNowCellId0 = @"TripNowTopCellId";
@implementation ViewController (ConfigCollection)
- (void)configCollectionView{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    self.CollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.WeekNum_View.y+self.WeekNum_View.height, ScreenWidth, ScreenWidth/7*6) collectionViewLayout:layout];
    [self.view addSubview:self.CollectionView];
    self.CollectionView.backgroundColor = [UIColor lightGrayColor];
    self.CollectionView.showsVerticalScrollIndicator = NO;
    self.CollectionView.delegate = self;
    self.CollectionView.dataSource = self;
    [self.view addSubview:self.CollectionView];
    
    [self.CollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:TripNowCellId0];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell * Cell = [collectionView dequeueReusableCellWithReuseIdentifier:TripNowCellId0 forIndexPath:indexPath];
    Cell.backgroundColor = [UIColor whiteColor];
    for(UIView * keyView in Cell.contentView.subviews){
        [keyView removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0, Cell.width, Cell.height)];
    label.text = self.Content_DataSource[indexPath.item][@"number"];
    label.textColor = Color(0, 176, 160);
    label.textAlignment = NSTextAlignmentCenter;
    [Cell.contentView addSubview:label];
    Cell.backgroundColor = [UIColor lightGrayColor];
    return Cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   return  self.Content_DataSource.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(ScreenWidth/7, ScreenWidth/7);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.firstDays == 7){
        self.firstDays = 0;
    }
    NSLog(@"%ld",indexPath.item-self.firstDays+1);
}
@end
