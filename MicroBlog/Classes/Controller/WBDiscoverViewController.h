//
//  WBDiscoverViewController.h
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

/**
    发现页面
 */
#import <UIKit/UIKit.h>

@interface WBDiscoverViewController : UIViewController



@property(nonatomic,strong)UISearchBar*searchBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
