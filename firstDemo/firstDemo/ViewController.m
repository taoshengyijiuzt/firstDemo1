//
//  ViewController.m
//  firstDemo
//
//  Created by qiukua on 2019/10/9.
//  Copyright © 2019 qiukua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建队列组
    [self group1];
    
    
    
}


//group1
-(void)group1{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //请求1
        dispatch_group_leave(group);
        NSLog(@"1-------%@", [NSThread currentThread]);
    });

    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //请求2
        dispatch_group_leave(group);
        NSLog(@"2-------%@", [NSThread currentThread]);
    });

    dispatch_group_enter(group);
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //请求3
        dispatch_group_leave(group);
       NSLog(@"3-------%@", [NSThread currentThread]);
    });

    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //界面刷新
         NSLog(@"4-------%@", [NSThread currentThread]);
    });
}

-(void)group2{
    //创建一个队列组
       dispatch_group_t grop = dispatch_group_create();
       dispatch_group_enter(grop);
       dispatch_group_async(grop, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           dispatch_group_leave(grop);
           NSLog(@"1-------%@", [NSThread currentThread]);
       });
       dispatch_group_enter(grop);
       dispatch_group_async(grop, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           dispatch_group_leave(grop);
              NSLog(@"2-------%@", [NSThread currentThread]);
          });
       //1 和 2 的顺序不定,开启新的线程,两者执行完后才执行下面的 3
       //上面的任务完成后在执行block块中的操作
       dispatch_group_notify(grop, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"3-------%@", [NSThread currentThread]);
       });
}

@end
