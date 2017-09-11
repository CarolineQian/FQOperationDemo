//
//  TwoViewController.m
//  T
//
//  Created by 冯倩 on 2017/7/18.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "TwoViewController.h"
#import "AFNetworking.h"

@interface TwoViewController ()<NSURLSessionDataDelegate>
{
    UIButton *btn;
}
@property (nonatomic, strong) NSMutableData *responseData;
@end


@implementation TwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, 200, 20)];
    btn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
  
//    
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
//    
//    [manager GET:@"http://localhost" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
//    {
//        NSLog(@"什么%@",responseObject);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
//    {
//        NSLog(@"什么%@",error);
//    }];
//
  //  [self http];
    
    
    

    //创建对象，封装操作
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"-operation-下载图片-%@",[NSThread currentThread]);
    }];
    //监听操作的执行完毕
    operation.completionBlock=^{
        NSLog(@"--接着下载第二张图片--%@",[NSThread currentThread]);
     };
    
    //创建队列
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [queue addOperation:operation];
    
}





//- (void)onClick
//{
//    NSLog(@"lallalal");
//}
//
//- (void)http
//{
//    AFHTTPSessionManager *manager;
//    manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@"https://www.yindou.com/newapi/"] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
//    manager.requestSerializer.timeoutInterval = 60.f;
//
//    //网络请求方案一
//    [manager POST:@"index" parameters:nil progress:^(NSProgress * uploadProgress)
//     {
//         NSLog(@"这是什么%@",uploadProgress);
//
//     } success:^(NSURLSessionDataTask *task, id responseObject)
//     {
//          NSLog(@"这是什么%@",responseObject);
//
//     } failure:^(NSURLSessionDataTask *task, NSError *error)
//     {
//         NSLog(@"这是什么%@",error);
//     }];
//    
//    
//    
//    //网络请求方案二
//    [manager POST:@"index" parameters:nil progress:nil
//                                           success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
//     {
//        NSLog(@"这是什么%@",responseObject);
//         
//     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
//     {
//        NSLog(@"这是什么%@",error);
//     }];
//}





@end
