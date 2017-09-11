//
//  FQModel.h
//  T
//
//  Created by 冯倩 on 2017/8/16.
//  Copyright © 2017年 冯倩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQModel : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *download;
@property(nonatomic,copy)NSString *icon;

+(instancetype)appModelWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
