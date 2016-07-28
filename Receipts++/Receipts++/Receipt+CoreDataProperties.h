//
//  Receipt+CoreDataProperties.h
//  Receipts++
//
//  Created by Yevhen Kim on 2016-07-21.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Receipt.h"

NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDecimalNumber *amount;
@property (nullable, nonatomic, retain) NSString *note;
@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSOrderedSet<NSManagedObject *> *tags;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)value inTagsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTagsAtIndex:(NSUInteger)idx;
- (void)insertTags:(NSArray<NSManagedObject *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTagsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTagsAtIndex:(NSUInteger)idx withObject:(NSManagedObject *)value;
- (void)replaceTagsAtIndexes:(NSIndexSet *)indexes withTags:(NSArray<NSManagedObject *> *)values;
- (void)addTagsObject:(NSManagedObject *)value;
- (void)removeTagsObject:(NSManagedObject *)value;
- (void)addTags:(NSOrderedSet<NSManagedObject *> *)values;
- (void)removeTags:(NSOrderedSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
