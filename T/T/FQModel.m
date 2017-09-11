//
//  FQModel.m
//  T
//
//  Created by 冯倩 on 2017/8/16.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import "FQModel.h"

@implementation FQModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

//工厂方法
+(instancetype)appModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


@end
