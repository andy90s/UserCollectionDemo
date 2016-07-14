//
//  UserDataManager.h
//  UserCollectionDemo
//
//  Created by liangbing on 16/7/12.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataManager : NSObject

single_interface(UserDataManager)

//更新数据
-(void)updateDataWithDeviceID:(NSString *)deviceId;
//根据主键获取次数
-(NSInteger)getCountWithDeviceID:(NSString *)deviceId;

@end
