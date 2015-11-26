//
//  ViewController.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/23.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "ViewController.h"
#import "WBGetInterface.h"
#import "WBGetInterface+WBStatuses.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //@"3912414707370439"
//    NSArray * arr = [[WBGetInterface shareInstance] getStatusesRepost_Timeline_ids:@"3912414707370439"];
//    NSDictionary * dic = [[WBGetInterface shareInstance] getStatusesCount:@"32817222"];
    WBTimeLineModel * model = [[WBGetInterface shareInstance] postStatusesDestroy:3912414707370439];
//    WBCounts count = [[WBGetInterface shareInstance] getStatusesCount:@"3912414707370439"];
    NSLog(@"%@",model);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
