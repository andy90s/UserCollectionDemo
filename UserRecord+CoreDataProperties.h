//
//  UserRecord+CoreDataProperties.h
//  
//
//  Created by liangbing on 16/7/13.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserRecord (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *deviceId;
@property (nullable, nonatomic, retain) NSNumber *operationCount;

@end

NS_ASSUME_NONNULL_END
