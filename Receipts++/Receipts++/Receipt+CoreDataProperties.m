//
//  Receipt+CoreDataProperties.m
//  Receipts++
//
//  Created by Yevhen Kim on 2016-07-21.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Receipt+CoreDataProperties.h"

@implementation Receipt (CoreDataProperties)

@dynamic amount;
@dynamic note;
@dynamic timeStamp;
@dynamic tags;

@end
