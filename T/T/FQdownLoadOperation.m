//
//  FQdownLoadOperation.m
//  T
//
//  Created by 冯倩 on 2017/8/17.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQdownLoadOperation.h"

@implementation FQdownLoadOperation

//start之后走的就是main()方法 
// 执行主任务,如果main方法执行完毕，那么整个operation就会从队列中被移除
-(void)main
{
    NSURL *url=[NSURL URLWithString:self.url];
    NSData *data=[NSData dataWithContentsOfURL:url];
    UIImage *imgae=[UIImage imageWithData:data];
    //图片下载完毕后，通知代理
    if ([self.delegate respondsToSelector:@selector(downLoadOperation:didFishedDownLoad:)])
    {
        //回到主线程，传递数据给代理对象
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           [self.delegate downLoadOperation:self didFishedDownLoad:imgae];
                       });
    }
}

@end
