//
//  FQdownLoadOperation.h
//  T
//
//  Created by 冯倩 on 2017/8/17.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FQdownLoadOperation;

@protocol FQdownLoadOperationDelegate <NSObject>
-(void)downLoadOperation:(FQdownLoadOperation*)operation didFishedDownLoad:(UIImage *)image;
@end

@interface FQdownLoadOperation : NSOperation
@property(nonatomic,copy)NSString *url;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,strong)id <FQdownLoadOperationDelegate> delegate;

@end
