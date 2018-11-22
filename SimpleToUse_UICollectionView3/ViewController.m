//
//  ViewController.m
//  SimpleToUse_UICollectionView3
//
//  Created by Geraint on 2018/11/22.
//  Copyright © 2018 kilolumen. All rights reserved.
//



/**
    源码来自：https://my.oschina.net/u/2340880/blog/522806
 
 */

#import "ViewController.h"
#import "MyLayout.h"

@interface ViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>



@end

@implementation ViewController

#pragma mark -- 自定义完成 FlowLayout 后，我们在ViewController中进行使用
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个layout布局类
    MyLayout *layout = [[MyLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical; // 呈现 垂直布局
    layout.itemCount = 100; // item 的数量
    
    // 设置 分区的偏移量(与superView的边距)
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    // 创建collectionView 通过一个布局策略layout来创建
    UICollectionView *collect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 600) collectionViewLayout:layout];
    collect.delegate = self;
    collect.dataSource = self;
    collect.backgroundColor = [UIColor lightGrayColor]; // 背景颜色
    
    // 注册item类型，这里使用系统的类型 (在完成代理回调前，必须注册一个cell)
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    
    [self.view addSubview:collect];
    
}

#pragma mark -- 代理方法
// 返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 返回每个分区之中的 item 的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255/255.0 green:arc4random() % 255/255.0 blue:arc4random() % 255/255.0 alpha:1];
    return cell;
}


@end
