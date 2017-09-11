
//
//  AppDelegate.m
//  T
//
//  Created by 冯倩 on 2016/11/24.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "AppDelegate.h"
#import "TwoViewController.h"
#import "TableViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    TableViewController *secondController = [[TableViewController alloc] init];
    self.window.rootViewController = secondController;
    [self.window makeKeyAndVisible];
    


    
    
    
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^()
//    {
//        NSLog(@"执行第1次操作，线程：%@", [NSThread currentThread]);
//    }];
//    
//    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^()
//    {
//        NSLog(@"执行第2次操作，线程：%@", [NSThread currentThread]);
//    }];
//    
//    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^()
//                                    {
//                                        NSLog(@"执行第3次操作，线程：%@", [NSThread currentThread]);
//                                    }];
//    
//    
//    [queue addOperation:operation1];
//    [queue addOperation:operation2];
//    [queue addOperation:operation3];
    
    

    


    return YES;
}



@end
