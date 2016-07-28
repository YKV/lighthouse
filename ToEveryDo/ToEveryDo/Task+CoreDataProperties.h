//
//  Task+CoreDataProperties.h
//  ToEveryDo
//
//  Created by Yevhen Kim on 2016-07-20.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface Task (CoreDataProperties)

@property (nonatomic) NSTimeInterval timeStamp;
@property (nullable, nonatomic, retain) NSString *taskName;
@property (nullable, nonatomic, retain) NSString *taskDescription;
@property (nullable, nonatomic, retain) NSString *taskPriority;
@property (nonatomic) BOOL isCompleted;

@end

NS_ASSUME_NONNULL_END
