//
//  UserDataManager.m
//  UserCollectionDemo
//
//  Created by liangbing on 16/7/12.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "UserDataManager.h"
#import "UserRecord.h"

@implementation UserDataManager

single_implementation(UserDataManager)

-(void)addDataWithDeviceID:(NSString *)deviceId operationCount:(NSInteger)count
{
    UserRecord *usr = [UserRecord MR_createEntity];
    usr.deviceId = deviceId;
    usr.operationCount = @(count);
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

-(void)updateDataWithDeviceID:(NSString *)deviceId
{
    NSArray *usrRecords = [UserRecord MR_findByAttribute:@"deviceId" withValue:deviceId];
    NSLog(@"符合条件条数:%ld",usrRecords.count);
    //1.没有保存过
    if (usrRecords.count == 0) {
        [self addDataWithDeviceID:deviceId operationCount:1];
    }
    //2.已存在,去修改
    if (usrRecords.count > 0) {
        UserRecord *usr = usrRecords.firstObject;
        usr.operationCount = @(usr.operationCount.integerValue + 1);
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
}

-(NSInteger)getCountWithDeviceID:(NSString *)deviceId
{
    NSArray *usrRecords = [UserRecord MR_findByAttribute:@"deviceId" withValue:deviceId];
    if (usrRecords.count == 0) {
        return 0;
    }
    else
    {
        UserRecord *usr = usrRecords.firstObject;
        return usr.operationCount.integerValue;
    }
}
@end
