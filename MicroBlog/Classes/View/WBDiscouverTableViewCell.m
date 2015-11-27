//
//  WBDiscouverTableViewCell.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBDiscouverTableViewCell.h"

@implementation WBDiscouverTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark xib初始化
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
     {
         
     }
    
    return [[[NSBundle mainBundle]loadNibNamed:@"WBDiscouverTableViewCell" owner:nil options:nil] firstObject];
}


#pragma mark 四个按钮触发事件
- (IBAction)btn1Act:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"话题被点中" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)btn2Act:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"话题被点中" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)btn3Act:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"话题被点中" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)btn4Act:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"话题被点中" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}
@end
