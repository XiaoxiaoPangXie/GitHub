//
//  WBAdvertisementView.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBAdvertisementView.h"

@implementation WBAdvertisementView

-(instancetype)init
{
    if (self=[super init])
    {
        
        //加入广告图片
        for (int i=1; i<5; i++)
        {
            NSString* imageName=[NSString stringWithFormat:@"a%d",i];
            UIImage * image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"jpg"]];
            // 图片拉伸
            [image stretchableImageWithLeftCapWidth:15 topCapHeight:15];
            UIImageView *imageView=[[UIImageView alloc]initWithImage:image];
            imageView.contentMode = UIViewContentModeScaleToFill;
            imageView.frame=CGRectMake(375*(i-1), 0, 375, 90);
            [self.scrollView addSubview:imageView];
        }
        self.pageControl.numberOfPages = self.scrollView.subviews.count;
         _count=0;
        //计时器，每三秒调用一次
        _time = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(repeatPlay) userInfo:nil repeats:YES];
    }
    
    
    return self;
}
#pragma -mark- 懒加载
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 90)];
        
        _scrollView.contentSize=CGSizeMake(1500, 90);
        //到尽头就不再滚动(回弹设置)
        _scrollView.bounces=YES;
        //翻页
        _scrollView.pagingEnabled=YES;
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate=self;
        
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        //创建pageControl页面控制器对象
        _pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(100, 70, 10, 1)];
        
        _pageControl.backgroundColor=[UIColor clearColor];
        //设置总页数
        _pageControl.numberOfPages=4;
        //设置当前页
        _pageControl.currentPage=0;
        
        [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];

        [self addSubview:_pageControl];
    }
    return _pageControl;
}
#pragma mark pageControl值改变时调用的方法
-(void)pageControlAction:(UIPageControl*)pageControl
{
    [_time invalidate];
    [self.scrollView setContentOffset:CGPointMake(375*(pageControl.currentPage), 0)];
    _count=pageControl.currentPage;
    [_time fire];
}

#pragma mark 滑动结束触发的代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControl.currentPage=scrollView.contentOffset.x/375;
    _count=self.pageControl.currentPage;
}


#pragma mark 重复播放
-(void)repeatPlay
{
    if (_count==3)
    {
        _count=-1;
    }
    
    _count++;
    [self.scrollView setContentOffset:CGPointMake(375*_count,0)];
    self.pageControl.currentPage= _count;
    
    if (_count==3)
    {
        _count=-1;
    }

    
}
@end
