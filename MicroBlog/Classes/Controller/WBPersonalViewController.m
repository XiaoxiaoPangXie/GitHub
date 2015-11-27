//
//  WBPersonalViewController.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBPersonalViewController.h"
#import "WBPersonalTableViewCell.h"
#import "WBPersonalNameTableViewCell.h"
#import "WBPersonalDataTableViewCell.h"

@interface WBPersonalViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray*_dataArr;
}

@end

@implementation WBPersonalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航栏标题
    self.navigationItem.title=@"我";
    
    /*
     导航栏右边边按钮设置属性
     */
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(0, 0, 60, 40);
    [rightBtn  setTitle:@"设置" forState:UIControlStateNormal];
    [rightBtn  setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rightBtn  setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    [rightBtn  addTarget:self action:@selector(rightBarAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightBarBtn=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem=rightBarBtn;
    
    
    /*
     tableView设置属性
     */
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    
    _dataArr=[self getCellData];
}



#pragma mark cell的数据
-(NSArray*)getCellData
{
    
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"PersonalTableView" ofType:@"plist"]];
    
}




#pragma mark 导航栏右边按钮触发方法
-(void)rightBarAct
{
    
}





#pragma mark 组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}


#pragma mark 行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 2;
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
        if (indexPath.row==0)
        {
            return 70.0;
        }
        else
        {
            return 45.0;
        }
    }
    
        return 45.0;
    
}

#pragma mark 设置每一行的cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    static NSString* CellId=@"personalCell";
    static NSString* CellId1=@"nameCell";
    static NSString* CellId2=@"dataCell";
    
    UITableViewCell *personalCell=[tableView dequeueReusableCellWithIdentifier:CellId];
    
    UITableViewCell *nameCell=[tableView dequeueReusableCellWithIdentifier:CellId1];
    
    UITableViewCell *dataCell=[tableView dequeueReusableCellWithIdentifier:CellId2];
    
    if (personalCell==nil)
    {
        
        personalCell=[[WBPersonalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
        nameCell=[[WBPersonalNameTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId1];
        
         dataCell=[[WBPersonalDataTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId2];
    }
    
    
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            nameCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
            return nameCell;
        }
        else
        {
            return dataCell;
        }
    }
    
    
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
    
    
        personalCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        
        return personalCell;
  
    
    
}


#pragma mark 点击cell触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
