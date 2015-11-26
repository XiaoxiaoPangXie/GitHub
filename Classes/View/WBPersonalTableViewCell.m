//
//  WBPersonalTableViewCell.m
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/26.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "WBPersonalTableViewCell.h"

@implementation WBPersonalTableViewCell

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
    
    return [[[NSBundle mainBundle]loadNibNamed:@"WBPersonalTableViewCell" owner:nil options:nil] firstObject];
}
@end
