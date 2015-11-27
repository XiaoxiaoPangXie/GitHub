//
//  WBNewsViewController.h
//  MicroBlog
//
//  Created by 🔥挖掘技术哪家强 on 15/11/25.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

/**
    消息界面
 */
#import <UIKit/UIKit.h>

@interface WBNewsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
