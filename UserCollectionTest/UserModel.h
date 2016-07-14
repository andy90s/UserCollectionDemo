//
//  UserModel.h
//  UserCollectionDemo
//
//  Created by liangbing on 16/7/13.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic,copy) NSString *deviceId;
//操作次数
@property (nonatomic,assign) NSInteger operationCount;

@end
