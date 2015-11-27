//
//  WBAdvertisementView.h
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBAdvertisementView : UIView<UIScrollViewDelegate>
{
    NSInteger _count;
    NSTimer * _time;
}


@property (strong, nonatomic)UIScrollView *scrollView;

@property(nonatomic,strong)UIPageControl*pageControl;



@end
