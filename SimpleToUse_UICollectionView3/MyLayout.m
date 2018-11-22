//
//  MyLayout.m
//  SimpleToUse_UICollectionView3
//
//  Created by Geraint on 2018/11/22.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
{
    // 这个数组就是我们自定义的布局配置数组
    NSMutableArray * _attributeAttay;
}

#pragma mark --  数组的相关设置在这个方法中
// 布局前的准备会调用这个方法
- (void)prepareLayout {
    _attributeAttay = [[NSMutableArray alloc] init];
    [super prepareLayout];
    
    // 为了演示方便，我们设置为静态的 2列
    // 计算每一个item的宽度
    float WIDTH = ([UIScreen mainScreen].bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing) / 2;
    
    // 定义数组保存每一列的高度
    // 这个数组的主要作用是 保存每一列的总高度，这样在布局时，我们可以始终将下一个Item放在最短的列下面
    CGFloat colHeight[2] = {self.sectionInset.top, self.sectionInset.bottom};
    
    // itemCount 是外界传进来的item的个数，遍历来设置每一个item的布局
    for (int i = 0; i<_itemCount; i++) {
        // 设置每个item的位置等相关属性 (在第一个位置，“0”)
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        
        // 创建一个布局属性类，通过indexPath来创建 (这个类是对item布局的具体设置)：
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        
        // 随机一个高度，在 40--190 之间
        CGFloat height = arc4random() % 150 + 40;
        // 哪一列高度小  则放在那一列下面
        //标记最短的列
        int width = 0;
        if (colHeight[0] < colHeight[1]) {
            // 将新的item高度加入到最短的一列
            colHeight[0] = colHeight[0] + height + self.minimumLineSpacing; // 垂直滚动时
            width = 0;
        } else {
            colHeight[1] = colHeight[1] + height + self.minimumLineSpacing;
            width = 1;
        }
        
        // 设置item的位置 （minimumInteritemSpacing 水平滚动时）
        attributes.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + WIDTH) * width, colHeight[width] - height - self.minimumLineSpacing, WIDTH, height);
        [_attributeAttay addObject:attributes];
        
    }
    
    // 设置 itemSize 来确保滑动范围的正确 ，这里是通过将所有的item高度平局化，计算出来的（以最高的列位标准）
    if (colHeight[0] > colHeight[1]) {
        self.itemSize = CGSizeMake(WIDTH, (colHeight[0] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
    } else {
        self.itemSize = CGSizeMake(WIDTH, (colHeight[1] - self.sectionInset.top) *2 / _itemCount - self.minimumLineSpacing);
    }
    
}

// 这个方法中返回我们的布局数组
- (NSArray<UICollectionViewLayoutAttributes *> *) layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeAttay;
}



@end
