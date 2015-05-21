//
//  AppDelegate.m
//  dataShareWatchAndIphone
//
//  Created by 長尾聡一郎 on 2015/05/21.
//  Copyright (c) 2015年 長尾聡一郎. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#define COMMAND @"command"
#define PUSHA @"pushA"
#define PUSHB @"pushB"
#define REPPHONE @"repPhone"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize ViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
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

-(void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply
{
    //最前面のViewControllerを取得
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    ViewController* VC = (ViewController*)topController;
    
    //userInfoの確認
    for (id key in [userInfo keyEnumerator]){
        NSLog(@"userInfo::key = %@ value = %@",key, [userInfo valueForKey:key]);
    }
    //こんな書き方もある
    //for (id key in userInfo){
    //  NSLog(@"userInfo::key = %@ value = %@",key, [userInfo valueForKey:key]);
    //}
    
    if(userInfo[COMMAND] && [userInfo[COMMAND] isEqualToString:PUSHA]){
        [VC toggleAlabel];
        reply(@{REPPHONE:PUSHA});
    }
    else if(userInfo[COMMAND] && [userInfo[COMMAND] isEqualToString:PUSHB]){
        [VC toggleBLabel];
        reply(@{REPPHONE:PUSHB});
    }
    
    return;
}

@end
