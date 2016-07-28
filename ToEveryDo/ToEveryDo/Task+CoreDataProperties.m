//
//  Task+CoreDataProperties.m
//  ToEveryDo
//
//  Created by Yevhen Kim on 2016-07-20.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Task+CoreDataProperties.h"

@implementation Task (CoreDataProperties)

@dynamic timeStamp;
@dynamic taskName;
@dynamic taskDescription;
@dynamic taskPriority;
@dynamic isCompleted;

@end
