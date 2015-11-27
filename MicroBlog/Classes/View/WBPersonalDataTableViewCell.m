//
//  WBPersonalDataTableViewCell.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBPersonalDataTableViewCell.h"

@implementation WBPersonalDataTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addSubview:self.weiboBtn];
        [self addSubview:self.guanzhuBtn];
        [self addSubview:self.fensiBtn];
    }
    
    return self;
}


#pragma mark 懒加载
-(UIButton *)weiboBtn
{
    if (!_weiboBtn)
    {
        _weiboBtn=[self getButton:@"personal12.png"];
        _weiboBtn.frame=CGRectMake(0, 0, 127, 45);
    }
     return _weiboBtn;
}

-(UIButton *)guanzhuBtn
{
    
    if (!_guanzhuBtn)
    {
        _guanzhuBtn=[self getButton:@"personal13.png"];
        _guanzhuBtn.frame=CGRectMake(127,0, 127, 45);
    }
    
    return _guanzhuBtn;
}

-(UIButton *)fensiBtn
{
    if (!_fensiBtn)
    {
        _fensiBtn=[self getButton:@"personal14.png"];
        _fensiBtn.frame=CGRectMake(254,0, 127, 45);
    }
    
    return _fensiBtn;
}

#pragma mark 自定义button
-(UIButton*)getButton:(NSString*)btnImageName
{
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"1W5" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize: 11.0];
    btn.titleEdgeInsets=UIEdgeInsetsMake(-20,-40, 0, 0);
    btn.imageEdgeInsets=UIEdgeInsetsMake(20, 20, 0, 0);
    return btn;
}


@end
