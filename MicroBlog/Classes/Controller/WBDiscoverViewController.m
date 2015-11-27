//
//  WBDiscoverViewController.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBDiscoverViewController.h"
#import "WBAdvertisementView.h"
#import "WBDiscouverTableViewCell.h"
#import "WBPersonalTableViewCell.h"

@interface WBDiscoverViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    NSArray*_dataArr;
}

@end

@implementation WBDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     searchBar设置属性
     */
    self.searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(10, 0, 290, 44)];
    
    //UITextAutocapitalizationTypeWords,  单词首字母大写
    self.searchBar.autocapitalizationType=UITextAutocapitalizationTypeWords;
    
    //自动匹配类型
    self.searchBar.autocapitalizationType=UITextAutocorrectionTypeNo;
    
    
    [self.navigationController.navigationBar addSubview:self.searchBar];
    
    
    
    /*
     导航栏右边按钮设置属性
     */
    UIImage *rightImage1=[UIImage imageNamed:@"message_voice_background"];
    UIImage *rightImage2=[UIImage imageNamed:@"message_voice_background_highlighted"];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(0, 0, 60, 40);
    [rightBtn  setImage:rightImage1 forState:UIControlStateNormal];
    [rightBtn  setImage:rightImage2 forState:UIControlStateHighlighted];
    [rightBtn  addTarget:self action:@selector(rightBarAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightBarBtn=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightBarBtn;
    
    
    /*
     tableView设置属性
     */
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    WBAdvertisementView*advertisementView=[[WBAdvertisementView alloc]init];
    advertisementView.frame=CGRectMake(0, 0, 375, 90);
    
    self.tableView.tableHeaderView=advertisementView;
    
    
    
    //获取cell数据
    _dataArr=[self getCellData];
  
    
}

#pragma mark cell的数据
-(NSArray*)getCellData
{
    
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DiscouverTableView" ofType:@"plist"]];
    
}

#pragma mark 回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //注销响应者，回收键盘
    [self.searchBar resignFirstResponder];
}


#pragma mark 导航栏右边按钮触发方法
-(void)rightBarAct
{
    
}





#pragma mark 组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}


#pragma mark 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else
    {
        return [[_dataArr objectAtIndex:section-1]count];
    }
    
    
}

#pragma mark 每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 90.0;
    }
    else
    {
        return 45.0;
    }
   
}

#pragma mark 设置每一行的cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString* identifier=@"discouverCell";
    static NSString* CellId=@"personalCell";
    UITableViewCell *discouverCell=[tableView dequeueReusableCellWithIdentifier:identifier];
    UITableViewCell *personalCell=[tableView dequeueReusableCellWithIdentifier:CellId];

    if (discouverCell==nil||personalCell==nil)
    {

         discouverCell=[[WBDiscouverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
          personalCell=[[WBPersonalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
   
    if (indexPath.section==0)
    {
    
        return discouverCell;
    }
     else
         
     {
         /*
          自定义cell部件赋值
          */
         
         NSArray*arr=[_dataArr objectAtIndex:indexPath.section-1];
         NSDictionary*dic=[arr objectAtIndex:indexPath.row];
         UIImageView *imageView=(UIImageView *)[personalCell viewWithTag:1];
         imageView.image=[UIImage imageNamed:[dic objectForKey:@"imageName"]];
         
         UILabel *title=(UILabel *)[personalCell viewWithTag:2];
         title.text=[dic objectForKey:@"title"];
         UILabel *detailTitle=(UILabel *)[personalCell viewWithTag:3];
         detailTitle.text=[dic objectForKey:@"detailTitle"];
         
    
        return personalCell;
     }
  
    
   
}

#pragma mark 点击cell触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
