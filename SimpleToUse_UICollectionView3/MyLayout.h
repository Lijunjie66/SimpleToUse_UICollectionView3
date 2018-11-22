//
//  MyLayout.h
//  SimpleToUse_UICollectionView3
//
//  Created by Geraint on 2018/11/22.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark -- UICollectionViewFlowLayout 是一个专门用来管理collectionView布局的类。因此，collectionView在进行UI布局前，会通过这个类的对象获取相关的布局信息，FlowLayout类将这些布局信息全部存放在了一个数组中，数组中是UICollectionViewLayoutAttributes类，这个类是对item布局的具体设置。这个以后再说。总之，FlowLayout类将每个item的位置等布局信息放在一个数组中，在collectionView布局时，会调用FlowLayout类layoutAttitudesForElementsInRect：方法来获取这个布局配置数组。因此，我们需要重写这个方法，返回我们自定义的配置数组，另外，FlowLayout类在进行布局之前，会调用prepareLayout方法，所以我们可以重写这个方法，在里面对我们的自定义配置数据进行一些设置。 -----------  源码来自：https://my.oschina.net/u/2340880/blog/522806

/**
    简单来说，自定义一个FlowLayout布局类就是两个步骤：
 
    1、设计好我们的布局配置数据 prepareLayout方法中
    2、返回我们的配置数组 layoutAttitudesDForElementsInRect方法中
    
 */
@interface MyLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) int itemCount;    // 添加一个属性， 直接让外界将item的个数传递进来

@end

NS_ASSUME_NONNULL_END
