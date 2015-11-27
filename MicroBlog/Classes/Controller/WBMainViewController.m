//
//  WBMainViewController.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBMainViewController.h"

@interface WBMainViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>


@end

@implementation WBMainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏标题
    self.navigationItem.title=@"首页";

    /*
     导航栏左边按钮设置属性
     */
    UIImage *leftImage1=[UIImage imageNamed:@"navigationbar_friendattention"];
    UIImage *leftImage2=[UIImage imageNamed:@"navigationbar_friendattention_highlighted"];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 60, 40);
    [leftBtn  setImage:leftImage1 forState:UIControlStateNormal];
    [leftBtn  setImage:leftImage2 forState:UIControlStateHighlighted];
    [leftBtn  addTarget:self action:@selector(leftBarAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*leftBarBtn=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem=leftBarBtn;
    
    
    /*
     导航栏右边按钮设置属性
     */
    UIImage *rightImage1=[UIImage imageNamed:@"navigationbar_icon_radar"];
    UIImage *rightImage2=[UIImage imageNamed:@"navigationbar_icon_radar_highlighted"];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(0, 0, 60, 40);
    [rightBtn  setImage:rightImage1 forState:UIControlStateNormal];
    [rightBtn  setImage:rightImage2 forState:UIControlStateHighlighted];
    [rightBtn  addTarget:self action:@selector(rightBarAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightBarBtn=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightBarBtn;
    
    

    /*
     searchBar设置属性
     */
    
    //UITextAutocapitalizationTypeWords,  单词首字母大写
    self.searchBar.autocapitalizationType=UITextAutocapitalizationTypeWords;
    
    //自动匹配类型
    self.searchBar.autocapitalizationType=UITextAutocorrectionTypeNo;
    
    //显示Cancel按钮
    self.searchBar.showsCancelButton=YES;
    
    //设置代理方法
    self.searchBar.delegate=self;
    
    /*
     tableView设置属性
     */
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    
}


#pragma mark 导航栏左边按钮触发方法
-(void)leftBarAct
{
    
}

#pragma mark 导航栏右边按钮触发方法
-(void)rightBarAct
{
    
}

#pragma mark 搜索栏上面Cancel按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    //注销响应者，回收键盘
    [self.searchBar resignFirstResponder];
    
}

#pragma mark 组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


#pragma mark 设置每一行的cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*CellId=@"cell";
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:CellId];
    
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
        
    }

    return cell;
    
}

#pragma mark 点击cell触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
