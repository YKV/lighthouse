//
//  TaskModel.m
//  ToDo
//
//  Created by Yevhen Kim on 2016-07-12.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "TaskModel.h"

@implementation TaskModel

- (instancetype)initWithTitle:(NSString*)title description:(NSString*)taskDescription number:(NSString*)priority completed:(BOOL)isCompletedIndicator {
    self = [super init];
    if (self) {
        _title = title;
        _taskDescription = taskDescription;
        _priority = priority;
        _isCompletedIndicator = isCompletedIndicator;
    }
    return self;
}

@end
