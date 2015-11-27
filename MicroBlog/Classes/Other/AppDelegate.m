//
//  AppDelegate.m
//  MicroBlog
//
//  Created by Ibokan on 15/11/23.
//  Copyright (c) 2015年 NSObject. All rights reserved.
//

#import "AppDelegate.h"
#import "WBMainViewController.h"
#import "WBNewsViewController.h"
#import "WBMoreViewController.h"
#import "WBDiscoverViewController.h"
#import "WBPersonalViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    /*
     首页ViewController
     */
    WBMainViewController*wbMainViewController=[[WBMainViewController alloc]initWithNibName:nil bundle:nil];

    //设置Tabbar按钮的名字
    wbMainViewController.tabBarItem.title=@"首页";
    //设置Tabbar的图片
     wbMainViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_home"];
    //点击更换图片
    wbMainViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_home_selected"];
    
    /*
     消息ViewController
     */
    WBNewsViewController*wbNewsViewController=[[WBNewsViewController alloc]initWithNibName:nil bundle:nil];
    wbNewsViewController.tabBarItem.title=@"消息";
    wbNewsViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_message_center"];
    wbNewsViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_message_center_highlighted"];
    
    /*
     更多ViewController
     */
    WBMoreViewController*wbMoreViewController=[[WBMoreViewController alloc]initWithNibName:nil bundle:nil];
    wbMoreViewController.tabBarItem.image=[[UIImage imageNamed:@"tabbar_add.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    wbMoreViewController.tabBarItem.selectedImage=[[UIImage imageNamed:@"tabbar_add_selected.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];



    
    /*
     发现ViewController
     */
    WBDiscoverViewController*wbDiscoverViewController=[[WBDiscoverViewController alloc]initWithNibName:nil bundle:nil];
    wbDiscoverViewController.tabBarItem.title=@"发现";
    wbDiscoverViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_discover"];
    wbDiscoverViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_discover_selected"];
    
    /*
     我ViewController
     */
    WBPersonalViewController*wbPersonalViewController=[[WBPersonalViewController alloc]initWithNibName:nil bundle:nil];
    wbPersonalViewController.tabBarItem.title=@"我";
    wbPersonalViewController.tabBarItem.image=[UIImage imageNamed:@"tabbar_profile"];
    wbPersonalViewController.tabBarItem.selectedImage=[UIImage imageNamed:@"tabbar_profile_selected"];
    
    
    //将各个ViewController加入对应的NavigationController里
    UINavigationController*mainNavigationController=[[UINavigationController alloc]initWithRootViewController:wbMainViewController];
    UINavigationController*newsNavigationController=[[UINavigationController alloc]initWithRootViewController:wbNewsViewController];
    UINavigationController*discoverNavigationController=[[UINavigationController alloc]initWithRootViewController:wbDiscoverViewController];
    UINavigationController*personalNavigationController=[[UINavigationController alloc]initWithRootViewController:wbPersonalViewController];
    
    
    /*
     创建TabBarController
     */
    UITabBarController*mainTabBarController=[[UITabBarController alloc]init];
    
    //将各个NavigationController加入到TabBarController
    mainTabBarController.viewControllers=@[mainNavigationController,newsNavigationController,wbMoreViewController,discoverNavigationController,personalNavigationController];

    //设置开始选中的视图控制器
    mainTabBarController.selectedIndex=3;
    
    //设置选中状态的颜色
    mainTabBarController.tabBar.tintColor=[[UIColor alloc]initWithRed:0.7 green:0.3 blue:0.6 alpha:1];
    
    //将TabBarController作为窗口的根视图控制器
    self.window.rootViewController=mainTabBarController;
    
    int i=0;
    //TabBar图片位置，使之垂直居中显示 
    CGFloat offset = 5.0;
    for (UITabBarItem *item in mainTabBarController.tabBar.items)
    {
        if (i==2)
        {
            item.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
        }
        i++;
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
