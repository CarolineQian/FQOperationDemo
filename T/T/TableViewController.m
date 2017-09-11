//
//  TableViewController.m
//  T
//
//  Created by 冯倩 on 2017/8/16.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "TableViewController.h"
#import "FQModel.h"
#import "FQdownLoadOperation.h"

@interface TableViewController ()<FQdownLoadOperationDelegate>
@property(nonatomic,strong)NSArray *apps;
@property(nonatomic,strong)NSOperationQueue *queue;
@property(nonatomic,strong)NSMutableDictionary *images;
@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

#pragma mark- 懒加载
-(NSArray *)apps
{
    if (_apps==nil)
    {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        NSArray *tempArray=[NSArray arrayWithContentsOfFile:path];
        //字典转模型
        NSMutableArray *array=[NSMutableArray array];
        for (NSDictionary *dict in tempArray)
        {
            FQModel *app=[FQModel appModelWithDict:dict];
            [array addObject:app];
        }
        _apps=array;
    }
    return _apps;
}

-(NSOperationQueue *)queue
{
    if (_queue==Nil)
    {
        _queue=[[NSOperationQueue alloc]init];
        //设置最大并发数为3
        _queue.maxConcurrentOperationCount=3;
    }
    return _queue;
}

-(NSMutableDictionary *)images
{
    if (_images==Nil)
    {
        _images=[NSMutableDictionary dictionary];
    }
    return _images;
}

#pragma mark-数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"ID";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    FQModel *app=self.apps[indexPath.row];
    cell.textLabel.text=app.name;
    cell.detailTextLabel.text=app.download;
    
    //保证一个url对应一个image对象
    UIImage *image=self.images[app.icon];
    //缓存中有图片
    if (image)
    {
        NSLog(@"这是第%ld行,内容是什么%@",(long)indexPath.row,image);
        cell.imageView.image=image;
    }
    //  缓存中没有图片，得下载
    else
    {
        //先设置一张占位图片
        cell.imageView.image=[UIImage imageNamed:@"photo.png"];
           FQdownLoadOperation* operation=[[FQdownLoadOperation alloc]init];
            operation.url=app.icon;
            operation.indexPath=indexPath;
            operation.delegate=self;
            [self.queue addOperation:operation];//异步下载
//        }
    }
    


    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}



-(void)downLoadOperation:(FQdownLoadOperation *)operation didFishedDownLoad:(UIImage *)image
{
    //2.将图片放到缓存中
    self.images[operation.url]=image;
    //3.刷新表格（只刷新下载的那一行）
    [self.tableView reloadRowsAtIndexPaths:@[operation.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
