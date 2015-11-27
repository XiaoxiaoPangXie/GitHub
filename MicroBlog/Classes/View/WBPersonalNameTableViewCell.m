//
//  WBPersonalNameTableViewCell.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBPersonalNameTableViewCell.h"

//间距
#define LineSpacing 10.0
@implementation WBPersonalNameTableViewCell

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
        [self addSubview:self.userIconImage];
        [self addSubview:self.userLaber];
        [self addSubview:self.vipImage];
        [self addSubview:self.detailLabel];
    }
    return self;
}




#pragma mark 自定义圆形图像
-(UIImageView*)getCircleImageView:(NSString*)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5,12,50.0, 50.0)];
    imageView.layer.cornerRadius = imageView.frame.size.height/2;
    imageView.layer.masksToBounds = YES;
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setClipsToBounds:YES];
    imageView.layer.shadowColor = [UIColor whiteColor].CGColor;
    imageView.layer.shadowOffset = CGSizeMake(4.0, 4.0);
    imageView.layer.shadowOpacity = 0.5;
    imageView.layer.shadowRadius = 2.0;
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth = 2.0f;
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}


#pragma mark 懒加载

-(UIImageView *)userIconImage
{
    if (!_userIconImage)
    {
        _userIconImage=[self getCircleImageView:@"a1.jpg"];
    }
    
    return _userIconImage;
}



-(UILabel *)userLaber
{
    if (!_userLaber)
    {
        _userLaber =[UILabel new];
        
        _userLaber.text=@"湖人科比";
        //确定userLabel的X坐标，CGRectGetMaxX=横坐标最右值
        CGFloat userLabelX=CGRectGetMaxX(_userIconImage.frame)+LineSpacing;
        
        
        //sizeThatFit使用要求，UI组件当中已经有内容
        CGSize userLabeSize=[_userLaber sizeThatFits:CGSizeMake(CGFLOAT_MAX, 25)];
        
        
        _userLaber.frame=CGRectMake(userLabelX, 13, userLabeSize.width, userLabeSize.height);
    }
    
 
    
    return _userLaber;
    
}

-(UIImageView *)vipImage
{
    if (!_vipImage)
    {
        _vipImage=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_membership_level5"]];
        
        _vipImage.frame=CGRectMake(CGRectGetMaxX(_userLaber.frame)+LineSpacing, 13, 18, 18);
    }
    
    
    return _vipImage;
    
}



-(UILabel *)detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel=[UILabel new];
        
        _detailLabel.text=@"我要带领湖人打败勇士！";
        
        _detailLabel.textColor=[UIColor lightGrayColor];
        
        _detailLabel.font=[UIFont fontWithName:nil size:13];
        
        
        //确定userLabel的X坐标，CGRectGetMaxX=横坐标最右值
        CGFloat detailLabelX=CGRectGetMaxX(_userIconImage.frame)+LineSpacing;
        
        
        //sizeThatFit使用要求，UI组件当中已经有内容
        CGSize detailLabeSize=[_detailLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 25)];
        
        
        _detailLabel.frame=CGRectMake(detailLabelX, 40, detailLabeSize.width, detailLabeSize.height);
    

    }
    return _detailLabel;
}












@end
