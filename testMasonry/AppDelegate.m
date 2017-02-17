//
//  AppDelegate.m
//  testMasonry
//
//  Created by 阿K on 2017/2/11.
//  Copyright © 2017年 阿K. All rights reserved.
//

#import "AppDelegate.h"

#import "MASExampleListViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    // Override point for customization after application launch.
    self.window.backgroundColor = UIColor.whiteColor;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:MASExampleListViewController.new];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
